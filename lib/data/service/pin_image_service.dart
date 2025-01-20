
import 'dart:typed_data';

import 'package:buff_lisa/data/repository/pin_image_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pin_image_service.g.dart';

@riverpod
Future<Uint8List> getPinImageAndFetch(Ref ref, String pinId) async {
  return await ref.watch(pinImageRepositoryProvider).fetchImage(pinId);
}