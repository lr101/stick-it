import 'package:buff_lisa/data/service/filter_service.dart';
import 'package:buff_lisa/data/service/pin_image_service.dart';
import 'package:buff_lisa/widgets/custom_interaction/presentation/custom_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:transparent_image/transparent_image.dart';

class EditHiddenPosts extends ConsumerStatefulWidget {
  const EditHiddenPosts({super.key});

  @override
  ConsumerState<EditHiddenPosts> createState() => _EditHiddenPostsState();
}

class _EditHiddenPostsState extends ConsumerState<EditHiddenPosts> {

  @override
  Widget build(BuildContext context) {
    final hiddenPosts = ref.watch(hiddenPostsServiceProvider);
    return Scaffold(
        appBar: AppBar(title: Text("Edit hidden Posts")),
        body: CustomScrollView(slivers: [
          SliverToBoxAdapter(
            child: Text("Tap on the post to remove it from the list"),
          ),
          SliverList.builder(
            itemCount: hiddenPosts.length,
            itemBuilder: (context, index) => ListTile(
                onTap: () => CustomDialog.show(context,
                    acceptText: "Remove",
                    title: "Remove hidden post",
                    onPressed: () => ref
                        .read(hiddenPostsServiceProvider.notifier)
                        .removeHiddenPost(hiddenPosts[index])),
                title: ref
                        .watch(getPinImageAndFetchProvider(hiddenPosts[index]))
                        .whenOrNull(
                          data: (data) {
                            if (data == null) return null;
                            return FadeInImage(
                                placeholder: MemoryImage(kTransparentImage),
                                image: MemoryImage(data));
                          },
                          error: (_, __) => Icon(Icons.error),
                        ) ??
                    CircularProgressIndicator()),
          )
        ]));
  }
}
