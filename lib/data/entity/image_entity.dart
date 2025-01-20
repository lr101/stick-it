import 'dart:typed_data';

import 'package:hive/hive.dart';

part 'image_entity.g.dart'; // This will be generated

@HiveType(typeId: 2) // Unique type ID for this entity
class ImageEntity {
  @HiveField(0)
  final Uint8List? blob1; // Using List<int> to represent Blob

  @HiveField(1)
  final DateTime ttl;

  @HiveField(2)
  final bool keepAlive;

  ImageEntity({
    required this.blob1,
    required this.ttl,
    this.keepAlive = false
  });
}
