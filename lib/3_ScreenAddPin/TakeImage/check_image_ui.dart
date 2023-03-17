import 'package:buff_lisa/Files/AbstractClasses/abstract_widget_ui.dart';
import 'package:buff_lisa/Files/Widgets/CustomSliverList/custom_easy_title.dart';
import 'package:buff_lisa/Files/Widgets/custom_title.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'check_image_logic.dart';

class CheckImageIU extends StatefulUI<CheckImageWidget, StateCheckImageWidget> {

  const CheckImageIU({super.key, required state}) : super(state: state);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(appBar: null,
            body: CustomTitle(
              title: CustomEasyTitle(
                title: Text("Approve"),
                back: true,
                right: CustomEasyAction(
                  child: const Icon(Icons.add_task) ,
                  action: state.handleApprove
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FutureProvider<Widget>(
                      create: (_) => state.handleFutureImage(),
                      initialData: const Center(child: CircularProgressIndicator()),
                      builder: ((context, child) => Expanded(
                          child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: InteractiveViewer(
                                panEnabled: false,
                                boundaryMargin: const EdgeInsets.all(100),
                                minScale: 1,
                                maxScale: 4,
                                child:  Consumer<Widget>(builder: (context, widget, child) => widget), //insert future image
                              )
                          )
                      ))
                  ),
                ],
              ),
            ),
            floatingActionButton: Container(
              width: MediaQuery.of(context).size.width - 50,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  color: const Color(0x99ffffff)
              ),
              child: TextButton(onPressed: state.handleApprove, child: const Text("Approve")),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        ),
    );
  }


}