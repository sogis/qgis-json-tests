# qgis-json-tests
Testing Display of JSON data in QGIS

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
