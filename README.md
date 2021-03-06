# metadata-ci

A CLI/library for validating ADRL metadata.

## Adding a new checker

To add a new checker, provide a method that accepts an array of paths
as its only parameter and returns an array of `MetadataError`s; then
add it to the array in `bin/check`.

## CLI

General usage:
```
bin/check <files>
```

### MODS
```
» bin/check test/fixtures/mods/*

* test/fixtures/mods/cusbmss228-p00001-invalid.xml:
  Value of dateCreated: 'long ago' is not W3C-valid (https://www.w3.org/TR/1998/NOTE-datetime-19980827).

* test/fixtures/mods/cusbmss228-p00001-latin1.xml:
  Missing 'encoding="UTF-8"' declaration.

* test/fixtures/mods/cusbmss228-p00001-missing-declaration.xml:
  Missing 'encoding="UTF-8"' declaration.

* test/fixtures/mods/cusbmss228-p00001-uncontrolled.xml:
  12:0: ERROR: Element '{http://www.loc.gov/mods/v3}typeOfResource': [facet 'enumeration'] The value 'wiggly image' is not an element of the set {'text', 'cartographic', 'notated music', 'sound recording-musical', 'sound recording-nonmusical', 'sound recording', 'still image', 'moving image', 'three dimensional object', 'software, multimedia', 'mixed material', ''}.

* test/fixtures/mods/cusbmss228-p00001-uncontrolled.xml:
  12:0: ERROR: Element '{http://www.loc.gov/mods/v3}typeOfResource': 'wiggly image' is not a valid value of the atomic type '{http://www.loc.gov/mods/v3}resourceTypeDefinition'.

* test/fixtures/mods/cusbmss228-p00001-uncontrolled.xml:
  'Somewhere outside Memphis' is not an allowed location.

* test/fixtures/mods/cusbmss228-p00001-uncontrolled.xml:
  'wiggly image' is not an allowed object type.

* test/fixtures/mods/cusbspcmss36-110001-ISO-8859-1.xml:
  10:0: ERROR: Element '{http://www.loc.gov/mods/v3}typeOfResource', attribute 'authorityURI': The attribute 'authorityURI' is not allowed.

* test/fixtures/mods/cusbspcmss36-110001-ISO-8859-1.xml:
  Missing 'encoding="UTF-8"' declaration.

* test/fixtures/mods/cusbspcmss36-110001-ISO-8859-1.xml:
  10:0: ERROR: Element '{http://www.loc.gov/mods/v3}typeOfResource', attribute 'authority': The attribute 'authority' is not allowed.

* test/fixtures/mods/cusbspcmss36-110001-ISO-8859-1.xml:
  10:0: ERROR: Element '{http://www.loc.gov/mods/v3}typeOfResource', attribute 'valueURI': The attribute 'valueURI' is not allowed.

* test/fixtures/mods/cusbspcmss36-110001_utf16.xml:
  invalid byte sequence in UTF-8

* test/fixtures/mods/cusbspcmss36-110001_utf16.xml:
  10:0: ERROR: Element '{http://www.loc.gov/mods/v3}typeOfResource', attribute 'authority': The attribute 'authority' is not allowed.

* test/fixtures/mods/cusbspcmss36-110001_utf16.xml:
  10:0: ERROR: Element '{http://www.loc.gov/mods/v3}typeOfResource', attribute 'authorityURI': The attribute 'authorityURI' is not allowed.

* test/fixtures/mods/cusbspcmss36-110001_utf16.xml:
  10:0: ERROR: Element '{http://www.loc.gov/mods/v3}typeOfResource', attribute 'valueURI': The attribute 'valueURI' is not allowed.

* test/fixtures/mods/cusbspcmss36-110001_windows-1252.xml:
  10:0: ERROR: Element '{http://www.loc.gov/mods/v3}typeOfResource', attribute 'authorityURI': The attribute 'authorityURI' is not allowed.

* test/fixtures/mods/cusbspcmss36-110001_windows-1252.xml:
  Missing 'encoding="UTF-8"' declaration.

* test/fixtures/mods/cusbspcmss36-110001_windows-1252.xml:
  10:0: ERROR: Element '{http://www.loc.gov/mods/v3}typeOfResource', attribute 'valueURI': The attribute 'valueURI' is not allowed.

* test/fixtures/mods/cusbspcmss36-110001_windows-1252.xml:
  10:0: ERROR: Element '{http://www.loc.gov/mods/v3}typeOfResource', attribute 'authority': The attribute 'authority' is not allowed.

* test/fixtures/mods/html-entities.xml:
  HTML-encoded character '&#x27;' on line 20

* test/fixtures/mods/html-entities.xml:
  8:0: ERROR: Element '{http://www.loc.gov/mods/v3}typeOfResource', attribute 'authority': The attribute 'authority' is not allowed.

* test/fixtures/mods/html-entities.xml:
  8:0: ERROR: Element '{http://www.loc.gov/mods/v3}typeOfResource', attribute 'authorityURI': The attribute 'authorityURI' is not allowed.

* test/fixtures/mods/html-entities.xml:
  8:0: ERROR: Element '{http://www.loc.gov/mods/v3}typeOfResource', attribute 'valueURI': The attribute 'valueURI' is not allowed.

* test/fixtures/mods/html-entities.xml:
  HTML-encoded character '&apos;' on line 15

* test/fixtures/mods/multiple-records.xml:
  10:0: ERROR: Element '{http://www.loc.gov/mods/v3}typeOfResource', attribute 'valueURI': The attribute 'valueURI' is not allowed.

* test/fixtures/mods/multiple-records.xml:
  10:0: ERROR: Element '{http://www.loc.gov/mods/v3}typeOfResource', attribute 'authorityURI': The attribute 'authorityURI' is not allowed.

* test/fixtures/mods/multiple-records.xml:
  Missing 'encoding="UTF-8"' declaration.

* test/fixtures/mods/multiple-records.xml:
  10:0: ERROR: Element '{http://www.loc.gov/mods/v3}typeOfResource', attribute 'authority': The attribute 'authority' is not allowed.

» echo $?
1
```

### CSV
```
» bin/check test/fixtures/csv/*

* test/fixtures/csv/html-entities.csv:
  HTML-encoded character '&#x27;' on line 5

* test/fixtures/csv/html-entities.csv:
  HTML-encoded character '&mid;' on line 4

* test/fixtures/csv/html-entities.csv:
  HTML-encoded character '&mid;' on line 4

* test/fixtures/csv/html-entities.csv:
  HTML-encoded character '&Psi;' on line 4

* test/fixtures/csv/html-entities.csv:
  HTML-encoded character '&Psi;' on line 4

* test/fixtures/csv/html-entities.csv:
  HTML-encoded character '&Psi;' on line 4

* test/fixtures/csv/html-entities.csv:
  HTML-encoded character '&rarr;' on line 4

* test/fixtures/csv/html-entities.csv:
  Missing required 'access_policy' header.

* test/fixtures/csv/html-entities.csv:
  HTML-encoded character '&#x3BB;' on line 6

* test/fixtures/csv/html-entities.csv:
  HTML-encoded character '&#x27;' on line 6

* test/fixtures/csv/html-entities.csv:
  HTML-encoded character '&#x2013;' on line 6

* test/fixtures/csv/html-entities.csv:
  HTML-encoded character '&#x394;' on line 6

* test/fixtures/csv/html-entities.csv:
  HTML-encoded character '&#x2013;' on line 6

* test/fixtures/csv/html-entities.csv:
  HTML-encoded character '&#xE4;' on line 5

* test/fixtures/csv/html-entities.csv:
  HTML-encoded character '&#xE4;' on line 5

* test/fixtures/csv/html-entities.csv:
  HTML-encoded character '&#xE4;' on line 5

* test/fixtures/csv/html-entities.csv:
  HTML-encoded character '&#x3BB;' on line 5

* test/fixtures/csv/html-entities.csv:
  HTML-encoded character '&amp;' on line 2

* test/fixtures/csv/html-entities.csv:
  HTML-encoded character '&apos;' on line 3

* test/fixtures/csv/html-entities.csv:
  HTML-encoded character '&in;' on line 4

* test/fixtures/csv/mcpeak-utf8problems.csv:
  invalid byte sequence in UTF-8

* test/fixtures/csv/mcpeak-utf8problems.csv:
  invalid byte sequence in UTF-8

* test/fixtures/csv/mcpeak-utf8problems.csv:
  invalid byte sequence in UTF-8

* test/fixtures/csv/pamss045-invalid.csv:
  created_start on line 2: 'bleb' is not W3C-valid (https://www.w3.org/TR/1998/NOTE-datetime-19980827).

* test/fixtures/csv/pamss045-invalid.csv:
  created_finish on line 2: '1974-9' is not W3C-valid (https://www.w3.org/TR/1998/NOTE-datetime-19980827).

* test/fixtures/csv/pamss045-invalid.csv:
  created_start on line 3: '1930-' is not W3C-valid (https://www.w3.org/TR/1998/NOTE-datetime-19980827).

* test/fixtures/csv/pamss045-missing-required.csv:
  Missing required 'access_policy' header.

* test/fixtures/csv/pamss045-missing-required.csv:
  All required 'created' headers must be used (missing 'created_start').

* test/fixtures/csv/pamss045-uncontrolled.csv:
  'Bundle' is not an allowed object type.

* test/fixtures/csv/pamss045-uncontrolled.csv:
  'Department of Mysteries' is not an allowed location.

* test/fixtures/csv/pamss045-undefined.csv:
  'animal' is not an allowed header.

* test/fixtures/csv/pamss045-unordered.csv:
  'created_start' should be followed by 'created_finish'.

* test/fixtures/csv/pamss045-unordered.csv:
  'created_finish' should be followed by 'created_label'.

* test/fixtures/csv/pamss045-unordered.csv:
  'created_start_qualifier' should be followed by 'created_finish_qualifier'.

* test/fixtures/csv/uarch112-part3a-excel-csv.csv:
  invalid byte sequence in UTF-8

* test/fixtures/csv/uarch112-part3a-excel-csv.csv:
  invalid byte sequence in UTF-8

* test/fixtures/csv/uarch112-part3a-excel-csv.csv:
  invalid byte sequence in UTF-8

* test/fixtures/csv/uarch112-part3a-msdos-csv.csv:
  invalid byte sequence in UTF-8

* test/fixtures/csv/uarch112-part3a-msdos-csv.csv:
  invalid byte sequence in UTF-8

* test/fixtures/csv/uarch112-part3a-msdos-csv.csv:
  invalid byte sequence in UTF-8

* test/fixtures/csv/uarch112-part3a-windows-csv.csv:
  invalid byte sequence in UTF-8

* test/fixtures/csv/uarch112-part3a-windows-csv.csv:
  invalid byte sequence in UTF-8

* test/fixtures/csv/uarch112-part3a-windows-csv.csv:
  invalid byte sequence in UTF-8

» echo $?
1
```
