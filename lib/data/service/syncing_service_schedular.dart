import 'package:buff_lisa/data/config/openapi_config.dart';
import 'package:buff_lisa/data/repository/pin_repository.dart';
import 'package:buff_lisa/data/service/global_data_service.dart';
import 'package:buff_lisa/data/service/pin_image_service.dart';
import 'package:buff_lisa/data/service/reachability_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mutex/mutex.dart';
import 'package:openapi/api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'syncing_service_schedular.g.dart';

enum SyncingServiceSchedularState {
  loading,
  done,
  offline,
  error;

  Color get color {
    switch (this) {
      case SyncingServiceSchedularState.done:
        return Colors.green;
      case SyncingServiceSchedularState.error:
        return Colors.red;
      case SyncingServiceSchedularState.loading:
        return Colors.orange;
      case SyncingServiceSchedularState.offline:
        return Colors.blue;
    }
  }
}

@riverpod
class SyncingServiceSchedular extends _$SyncingServiceSchedular {
  @override
  SyncingServiceSchedularState build() {
    return SyncingServiceSchedularState.done;
  }

  void setState(SyncingServiceSchedularState state) {
    this.state = state;
  }
}
