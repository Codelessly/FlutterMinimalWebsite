import 'package:json_annotation/json_annotation.dart';
import 'package:collection/collection.dart';

enum Product$AttributesStatus {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('draft')
  draft('draft'),
  @JsonValue('published')
  published('published');

  final String? value;

  const Product$AttributesStatus(this.value);
}
