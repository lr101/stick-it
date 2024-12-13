import 'package:buff_lisa/data/service/group_image_service.dart';
import 'package:buff_lisa/data/service/user_group_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../round_image/presentation/round_image.dart';

class RoundGroupCard extends ConsumerStatefulWidget {
  const RoundGroupCard({super.key, required this.groupId});

  final String groupId;

  @override
  ConsumerState<RoundGroupCard> createState() => _RoundGroupCardState();
}

class _RoundGroupCardState extends ConsumerState<RoundGroupCard> {
  @override
  Widget build(BuildContext context) {
    double baseHeight = (MediaQuery.of(context).size.height * 0.09) - 15;
    Color color = Colors.grey.withOpacity(0.8);
    Widget num = const SizedBox.shrink();
    final isActive =
        ref.watch(groupByIdActivatedProvider(widget.groupId)).value ?? false;

    return ref.watch(groupProfilePictureByIdProvider(widget.groupId)).when(
        data: (data) {
          return Padding(
              key: ValueKey(widget.groupId),
              padding: const EdgeInsets.all(5),
              child: GestureDetector(
                  onTap: () => {
                        ref
                            .read(userGroupServiceProvider.notifier)
                            .setIsActive(widget.groupId, !isActive),
                      },
                  child: Stack(children: [
                    ClipOval(
                      child: Container(
                        height: baseHeight,
                        width: baseHeight,
                        decoration: BoxDecoration(
                            color: isActive ? color : Colors.transparent),
                      ),
                    ),
                    RoundImage(
                      size: baseHeight / 2,
                      clickable: false,
                      imageCallback: AsyncData(data),
                      child: ClipOval(
                        child: Container(
                          height: baseHeight,
                          width: baseHeight,
                          decoration: BoxDecoration(
                              color: isActive ? Colors.transparent : color),
                        ),
                      ),
                    ),
                  ])));
        },
        error: (error, stackTrace) => Icon(Icons.error),
        loading: () => SizedBox.square(dimension: baseHeight + 10));
  }
}
