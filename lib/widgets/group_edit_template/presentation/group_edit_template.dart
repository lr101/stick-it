import 'dart:typed_data';

import 'package:buff_lisa/data/dto/group_dto.dart';
import 'package:buff_lisa/widgets/round_image/presentation/round_image_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../widgets/round_image/presentation/round_image.dart';
import '../service/group_create_service.dart';

class GroupEditTemplate extends ConsumerStatefulWidget {
  const GroupEditTemplate({super.key, required this.onSubmit, this.rowItems, this.groupDto});

  final Function(String name, String description, String? link,
      Uint8List profileImage, int visibility) onSubmit;

  final List<Widget>? rowItems;
  final LocalGroupDto? groupDto;

  @override
  ConsumerState<GroupEditTemplate> createState() => _GroupEditTemplate();
}

class _GroupEditTemplate extends ConsumerState<GroupEditTemplate> {
  final _textEditControllerName = TextEditingController();
  final _textEditControllerDescription = TextEditingController();
  final _textEditControllerLink = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    if (widget.groupDto != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ref.read(groupCreateServiceProvider.notifier).init(widget.groupDto!);
        _textEditControllerName.text = widget.groupDto!.name;
        _textEditControllerDescription.text = widget.groupDto!.description!;
        _textEditControllerLink.text = widget.groupDto!.link ?? "";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final group = ref.watch(groupCreateServiceProvider);
    final groupNotifier = ref.watch(groupCreateServiceProvider.notifier);
    return Scaffold(
        appBar: AppBar(title: Text("Create a group")),
        body: SingleChildScrollView(
          child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          SizedBox(
                              width: 90,
                              child: RoundImagePicker(
                                size: 40,
                                imageUpload: (image) {
                                  groupNotifier.updateProfileImage(image);
                                },
                                imageCallback: AsyncData(
                                    ref.watch(createGroupProfileImageProvider)),
                              )),
                          const SizedBox(
                            width: 10,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width - 120,
                            child: TextFormField(
                              controller: _textEditControllerName,
                              validator: (value) => value!.isEmpty
                                  ? "Please enter a group name"
                                  : null,
                              textAlign: TextAlign.left,
                              decoration: const InputDecoration(
                                  hintText: "Type your group name"),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.85,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text("Description:",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.normal)),
                                TextFormField(
                                  validator: (value) => value!.isEmpty
                                      ? "Please enter a group description"
                                      : null,
                                  controller: _textEditControllerDescription,
                                  textAlign: TextAlign.start,
                                  keyboardType: TextInputType.multiline,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                  ),
                                  decoration: const InputDecoration(
                                      hintText: "Type your group description"),
                                  maxLines: null,
                                ),
                              ])),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.85,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text("Url/Link:",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.normal)),
                                TextFormField(
                                  validator: (value) => value == null || value.isEmpty ||
                                          Uri.parse(value).isAbsolute
                                      ? null
                                      : "Invalid link",
                                  controller: _textEditControllerLink,
                                  textAlign: TextAlign.start,
                                  keyboardType: TextInputType.url,
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal,
                                  ),
                                  decoration: const InputDecoration(
                                      hintText: "Type your link (optional)"),
                                  maxLines: 1,
                                ),
                              ])),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                      child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.85,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Group privacy (default public):",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.normal)),
                          Switch(
                            value: group.visibility == 0,
                            onChanged: (value) =>
                                groupNotifier.updateVisibility(value ? 0 : 1),
                          ),
                        ],
                      ),
                    ),
                  )),
                  const SizedBox(
                    height: 5,
                  ),
                  ...widget.rowItems ?? [],
                ],
              )),
        ),
        floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.check),
            onPressed: () {
              final group = ref.watch(groupCreateServiceProvider);
              if (_formKey.currentState!.validate() &&
                  group.profileImage != null) {
                widget.onSubmit(
                    _textEditControllerName.text,
                    _textEditControllerDescription.text,
                    _textEditControllerLink.text.isEmpty ? null : _textEditControllerLink.text,
                    group.profileImage!,
                    group.visibility);
              }
            }));
  }
}
