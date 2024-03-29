# qgis-json-tests
Testing Display of JSON data in QGIS Desktop and QGIS server

## Goals
- Test JSON Display in QGIS widgets

## Relevant PRs/commits
- https://github.com/qgis/QGIS/pull/7869 (PostgreSQL JSON field support)
- https://github.com/qgis/QGIS/pull/8223 (Testing the implementation from #7869 with GetFeatureInfo requests over QGIS Server.)

## Unit tests from OpenGIS
- QGIS core and Desktop: https://github.com/qgis/QGIS/pull/7869 - in particular https://github.com/signedav/QGIS/blob/920e150d95fa33bd95c6749e57dd843fad455366/tests/src/providers/testqgspostgresprovider.cpp see def testJson()
- QGIS Server: https://github.com/qgis/QGIS/pull/8223 - in particular https://github.com/signedav/QGIS/blob/0a2689d94e64ba28aac958ab119b686ff36b19ef/tests/src/python/test_qgsserver_wms_getfeatureinfo.py see def testGetFeatureInfoPostgresTypes()

## Remarks
- jsonb is the binary version
- jsonb can be created by casting a json text string to jsonb, e.g. "'{"a":1,"b":2}'::jsonb
- Minimum PG versions: 9.2 for json and 9.4 for jsonb

## Advantages / Disadvantages of json vs jsonb
| jsonb advantages                         | jsonb disadvantages                         |
| ---------------------------------------- | ------------------------------------------- |
| faster queries (SELECT)                  | may change original formatting slighly when compared to exact copy in json |
| supports indexing                        | slightly slower input (INSERT and UPDATE)   |
| faster than hstore data type             | may take more disk space than plain json    |
|                                          | certain queries (e.g. aggregates) may be slower due to lack of statistics |

see also [Faster Operations with the JSONB Data Type in PostgreSQL](https://compose.com/articles/faster-operations-with-the-jsonb-data-type-in-postgresql/)

## Display of JSON Data in QGIS Desktop
see also [OPENGIS blog post "Visualize Postgres JSON data in QML widgets"](https://new.opengis.ch/2018/11/13/visualize-postgres-json-data-in-qml-widgets/)

### Useful json-compatible widgets in QGIS
- List
- Key/Value
- Text Edit (preferably with Multiline Option)
- QML Widget

Attention: by default, QGIS assigns the Key/Value widget to json/jsonb data types. If the JSON structure isn't compatible
one will see an empty widget, even if JSON data exists.

### Text Edit widget
Sample Structure: any valid JSON structure can be used.

Configuration hints: For longer structures be sure to check the "Multiline" checkbox in the "Text edit" widget configuration.

![Screenshot configuration of text edit widget](https://raw.githubusercontent.com/sogis/qgis-json-tests/master/screenshots/qgis_text-edit-widget_Multiline.png)

This is how it looks like in a text edit widget in form mode, regardless if the source data type is json or jsonb:

![Screenshot display of text edit widget in form mode](https://raw.githubusercontent.com/sogis/qgis-json-tests/master/screenshots/qgis_display-of-json-as-text-edit-widget_in-form-mode.png)

### List widget
Valid json structure for list widget:

```javascript
[
 "Apples",
 "Cherries",
 "Bananas",
 "Strawberries"
]
```
![Screenshot configuration of list widget](https://raw.githubusercontent.com/sogis/qgis-json-tests/master/screenshots/qgis_list-widget_configuration.png)

This is how it looks like in a list widget in form mode, regardless if the source data type is json or jsonb:

![Screenshot display of list widget in form mode](https://raw.githubusercontent.com/sogis/qgis-json-tests/master/screenshots/qgis_display-of-json-as-list-widget_in-form-mode.png)

### Key/Value widget
Valid json structure for list widget:

```javascript
{
 "Apples": 20,
 "Cherries": 13,
 "Bananas": 23,
 "Strawberries": 7
}
```
![Screenshot configuration of key-value widget](https://raw.githubusercontent.com/sogis/qgis-json-tests/master/screenshots/qgis_key-value-widget_configuration.png)

This is how it looks like in a list widget in form mode, regardless if the source data type is json or jsonb:

![Screenshot display of list widget in form mode](https://raw.githubusercontent.com/sogis/qgis-json-tests/master/screenshots/qgis_display-of-json-as-key-value-widget_in-form-mode.png)

### Attribute Table View

This is how the attribute table looks like for the different widget types: list and key/value entries are separated by kommas combined with a blank as separater, keys are separated from the values with a colon and a blank:

![Screenshot of json data in table mode](https://raw.githubusercontent.com/sogis/qgis-json-tests/master/screenshots/qgis_json-data-in-attribute-table.png)

Note that the height of the rows are not auto-sized and often need to be made a bit higher manually.

## Display of JSON Data in the combo QGIS Server and Desktop

To test whether raw json/jsonb data is supported there is a Postgis/QGIS Server test environment that you can start with:

```
docker-compose up
```

in the root of this repository.

### GetFeatureInfo results with format "text/plain"

![GetFeatureInfo results with format text/plain](https://raw.githubusercontent.com/sogis/qgis-json-tests/master/screenshots/qgis_identify_results_WMS_format-text.png)

Remarks: displays as expected

### GetFeatureInfo results with format "text/html"

![GetFeatureInfo results with format text/html](https://raw.githubusercontent.com/sogis/qgis-json-tests/master/screenshots/qgis_identify_results_WMS_format-html.png)

Remarks:
Works ok, but room for improvements.

Proposal for improvements:
* for text widgets: use &lt;pre&gt;&lt;/pre&gt; tag to preserver line breaks and display with a monospace-font
* for list widget: use &lt;ul&gt;&lt;li&gt;&lt;/li&gt;&lt;/ul&gt; structure
* for key value widget: use &lt;table/&gt; structure
 
### GetFeatureInfo results with format "application/json"

![GetFeatureInfo results with format application/json](https://raw.githubusercontent.com/sogis/qgis-json-tests/master/screenshots/qgis_identify_results_WMS_format-feature.png)
 
Remarks:
doesn't display at all. [Fixes pending](https://github.com/qgis/QGIS/pull/30451)

