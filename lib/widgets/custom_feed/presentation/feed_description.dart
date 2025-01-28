import 'package:buff_lisa/data/dto/pin_dto.dart';
import 'package:buff_lisa/widgets/custom_feed/data/feed_description.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FeedDescriptionExpandable extends ConsumerWidget {
  const FeedDescriptionExpandable({
    super.key,
    required this.pin,
  });

  final LocalPinDto pin;

  static const showLessOrMoreStyle = TextStyle(
    fontWeight: FontWeight.bold,
  );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isExpanded = ref.watch(feedDescriptionProvider(pin.id));
    final toggleExpansion = ref.watch(feedDescriptionProvider(pin.id).notifier);

    return LayoutBuilder(
      builder: (context, constraints) {
        final textPainterOneRow = getTextPainter(pin.description!,  DefaultTextStyle.of(context).style, 1, constraints.maxWidth);
        final textPainterExpanded = getTextPainter(pin.description!,  DefaultTextStyle.of(context).style, null, constraints.maxWidth);
        final showLessOrMorePainter = getTextPainter('Show Less',  showLessOrMoreStyle, 1, constraints.maxWidth);
        final lessOrMoreHeight = showLessOrMorePainter.size.height;
        final numLines = textPainterExpanded.computeLineMetrics().length;
        final textHeight = !isExpanded ? textPainterExpanded.height : textPainterOneRow.height;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              pin.description!,
              maxLines: isExpanded ? null : (numLines > 2 ? 1 : 2),
              overflow: isExpanded ? TextOverflow.visible : TextOverflow.ellipsis,
            ),
            if (numLines > 2)
              GestureDetector(
                onTap: () {
                  toggleExpansion.toggle();
                  ref.read(feedDescriptionHeightProvider(pin).notifier)
                      .setHeight(textHeight + lessOrMoreHeight * 2);
                },
                child: Text(
                  isExpanded ? 'Show Less' : 'Show More',
                  style: showLessOrMoreStyle,
                ),
              ),
          ],
        );
      },
    );
  }

  TextPainter getTextPainter(String text, TextStyle style, int? numLines, double maxWidth) {
    return TextPainter(
      text: TextSpan(
        text: pin.description,
        style: style,
      ),
      maxLines: numLines,
      textDirection: TextDirection.ltr,
    )..layout(maxWidth: maxWidth);
  }
}
