import 'package:buff_lisa/data/dto/pin_dto.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/feed_description.dart';

class FeedDescriptionExpandable extends ConsumerWidget {
  FeedDescriptionExpandable({
    super.key,
    required this.pin,
  });

  final LocalPinDto pin;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isExpanded = ref.watch(feedDescriptionProvider(pin.id));
    final toggleExpansion = ref.watch(feedDescriptionProvider(pin.id).notifier);


    return LayoutBuilder(
      builder: (context, constraints) {
        final textPainter = TextPainter(
          text: TextSpan(
            text: pin.description,
          ),
          maxLines: isExpanded ? 1 : null,
          textDirection: TextDirection.ltr,
        )..layout(maxWidth: constraints.maxWidth);

        final isOverflowing = textPainter.didExceedMaxLines;


        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: pin.description,
                  ),
                  if (isOverflowing && !isExpanded)
                    const TextSpan(
                      text: '...',
                    ),
                ],
              ),
              maxLines: isExpanded ? null : 1,
              overflow: isExpanded ? TextOverflow.visible : TextOverflow.ellipsis,
            ),
              GestureDetector(
                onTap: () {
                  toggleExpansion.toggle();
                  ref.read(feedDescriptionHeightProvider(pin).notifier).setHeight(textPainter.size.height * 2); // TODO this is a magic multiply. Has to be calculated automatically
                },
                child: Text(
                  isExpanded ? 'Show Less' : 'Show More',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
