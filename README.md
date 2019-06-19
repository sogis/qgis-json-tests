# qgis-json-tests
Testing Display of JSON data in QGIS Desktop and QGIS server

## Goals
- Test JSON Display in QGIS widgets

## Relevant PRs/commits
- https://github.com/qgis/QGIS/pull/7869 (PostgreSQL JSON field support)
- https://github.com/qgis/QGIS/pull/8223 (Testing the implementation from #7869 with GetFeatureInfo requests over QGIS Server.)

## Unit tests from OpenGIS
- 

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

### Text plain widgets
Sample Structure: any valid JSON structure can be used.

Configuration hints: For longer structures be sure to check the "Multiline" checkbox in the "Text edit" widget configuration.


