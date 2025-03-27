// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:convert';
import 'dart:io';
import 'package:path/path.dart' as p;

import '../test/schema/helpers.dart' show findPackageRoot;

void main() {
  final packageUri = findPackageRoot('hooks');

  final directories = [
    Directory.fromUri(packageUri),
    Directory.fromUri(packageUri.resolve('../code_assets/')),
    Directory.fromUri(packageUri.resolve('../data_assets/')),
  ];
  for (final directory in directories) {
    processDirectory(directory);
  }
}

void processDirectory(Directory directory) {
  final entities = directory.listSync(recursive: true);
  for (final entity in entities) {
    if (entity is File &&
        p.extension(entity.path) == '.json' &&
        !entity.path.contains('.dart_tool/')) {
      processFile(entity);
    }
  }
}

void processFile(File file) {
  final contents = file.readAsStringSync();
  final dynamic decoded = json.decode(contents);

  final sorted = sortJson(decoded, file.path);

  const encoder = JsonEncoder.withIndent('  ');
  final sortedJson = encoder.convert(sorted);

  file.writeAsStringSync('$sortedJson\n');
  print('Normalized: ${file.path}');
}

const List<String> _orderedKeysInSchemas = [
  // Schema Identification: Defines the JSON Schema version and identifier.
  // Should be at the top.
  '\$schema',
  '\$id',

  // Informational: Keyword for adding comments to the schema.
  '\$comment',

  // References to other schemas.
  '\$ref',

  // Schema Metadata: Human-readable information about the schema.
  'title',
  'description',

  // Core Types: The basic data types and related keywords.
  'type',
  'enum',
  'const',

  // Object Schemas: Keywords for defining and validating JSON objects.
  'properties',
  'required',
  'additionalProperties',
  'patternProperties',
  'unevaluatedProperties',

  // Array Schemas: Keywords for defining and validating JSON arrays.
  'items',
  'prefixItems',
  'contains',
  'minContains',
  'maxContains',

  // Combining Schemas: Keywords for combining and manipulating schemas.
  'allOf',
  'anyOf',
  'oneOf',
  'not',

  // Conditional Application: Keywords for applying schemas conditionally.
  'if',
  'then',
  'else',
  'dependentSchemas',
  'dependentRequired',

  // Reusable Definitions: Keywords for defining and referencing reusable schema
  // components.
  '\$defs',
  'definitions',

  // Semantic Validation: Keywords for validating data based on its semantic
  // type.
  'format',
  'examples',
  'default',

  // Metadata Annotations: Keywords for adding metadata annotations to schemas.
  'readOnly',
  'writeOnly',
  'deprecated',

  // Numeric Validation: Keywords for validating numeric data.
  'multipleOf',
  'maximum',
  'exclusiveMaximum',
  'minimum',
  'exclusiveMinimum',

  // String Validation: Keywords for validating string data.
  'maxLength',
  'minLength',
  'pattern',

  // Array Validation: Keywords for validating array data.
  'maxItems',
  'minItems',
  'uniqueItems',

  // Object Validation: Keywords for validating object data.
  'maxProperties',
  'minProperties',
];

dynamic sortJson(dynamic data, String filePath) {
  if (data is Map<String, Object?>) {
    final sortedMap = <String, Object?>{};
    final keys = data.keys.toList();

    final isSchema = filePath.endsWith('schema.json');
    if (isSchema) {
      keys.sort((a, b) {
        final aIndex = _orderedKeysInSchemas.indexOf(a);
        final bIndex = _orderedKeysInSchemas.indexOf(b);
        if (aIndex == -1 && bIndex == -1) {
          // Both keys are not in _orderedKeys, sort alphabetically.
          return a.compareTo(b);
        } else if (aIndex == -1) {
          // Only b is in _orderedKeys, sort b first
          return 1;
        } else if (bIndex == -1) {
          // Only a is in _orderedKeys, sort a first
          return -1;
        } else {
          return aIndex.compareTo(bIndex);
        }
      });
    } else {
      // Sort keys alphabetically for non-schemas.
      keys.sort();
    }

    for (final key in keys) {
      sortedMap[key] = sortJson(data[key], filePath);
    }
    return sortedMap;
  }
  if (data is List) {
    return data.map((item) => sortJson(item, filePath)).toList()..sort((a, b) {
      if (a is Map && b is Map) {
        return compareMaps(a, b);
      }
      if (a is String && b is String) {
        return a.compareTo(b);
      }
      throw UnimplementedError('Not implemented to compare $a and $b.');
    });
  }
  return data;
}

int compareMaps(Map<dynamic, dynamic> a, Map<dynamic, dynamic> b) {
  final aKeys = a.keys.toList();
  final bKeys = b.keys.toList();
  for (var i = 0; i < aKeys.length && i < bKeys.length; i++) {
    final comparison = aKeys[i].toString().compareTo(bKeys[i].toString());
    if (comparison != 0) {
      return comparison;
    }
    final aValue = a[aKeys[i]];
    final bValue = b[bKeys[i]];
    if (aValue is String && bValue is String) {
      final valueComparison = aValue.compareTo(bValue);
      if (valueComparison != 0) {
        return valueComparison;
      }
    }
    if (aValue is Map && bValue is Map) {
      final valueComparison = compareMaps(aValue, bValue);
      if (valueComparison != 0) {
        return valueComparison;
      }
    }
    if (aValue == bValue) {
      continue;
    }
    throw UnimplementedError('Not implemented to compare $aValue and $bValue.');
  }
  return 0;
}
