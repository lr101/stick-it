import 'package:buff_lisa/data/dto/pin_dto.dart';
import 'package:buff_lisa/data/service/user_group_service.dart';
import 'package:buff_lisa/data/service/user_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../features/camera/data/camera_state.dart';
import '../../round_image/presentation/round_image.dart';

class PinHeader extends ConsumerWidget {

  final LocalPinDto pinDto;

  PinHeader({super.key, required this.pinDto});


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(userByIdProvider(pinDto.creatorId));
    return SizedBox(
      height: 40,
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(2),
                  child: RoundImage(
                    size: 16,
                    imageCallback: AsyncData(data.whenOrNull(data: (d) => d.profileImage)),
                    child: Container(),
                  ),
                ),
                Column(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 22,
                      child: FittedBox(fit: BoxFit.fitHeight, child: Text(data.whenOrNull(data: (d) => d.username) ?? "Loading...",)),
                    ),
                    SizedBox(
                        height: 18,
                        child: FittedBox(fit: BoxFit.fitHeight, child:  Text(
                          ref.watch(groupByIdProvider(pinDto.groupId)).whenOrNull(data: (d) => d?.name) ?? "Loading...",
                          style: const TextStyle(
                              fontStyle: FontStyle.italic),
                        )))
                  ],
                )
              ]),
        ],
      ),
    );
  }
}
