import 'package:buff_lisa/widgets/custom_interaction/presentation/custom_error_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
class CustomImagePicker {

  static Future<XFile?> pick({required BuildContext context}) async {


    try {
      if (!(await Permission.photos.isGranted)) {
        await Permission.photos.request();
      }
      if (!(await Permission.accessMediaLocation.isGranted)) {
        await Permission.accessMediaLocation.request();
      }
      final picker = ImagePicker();
      XFile? pickedFile = await picker.pickMedia(imageQuality: 25, requestFullMetadata: true);
      final LostDataResponse response = await picker.retrieveLostData();
      if (response.file != null) {
        pickedFile = response.file;
      }
      return pickedFile;
    } catch (e) {
      CustomErrorSnackBar.message(message: e.toString());
    }
    return null;
  }

  /// opens the input picker for selecting an image from the gallery
  /// after selecting an image it is opened in an image cropper
  /// check if 100 < width, height and image is square
  static Future<Uint8List?> pickAndCrop({required int minHeight, required int minWidth,required BuildContext context, CropAspectRatio? initAspectRatio}) async {
    try {
      final XFile? res =  await CustomImagePicker.pick(context: context);
      return crop(res: res, minHeight: minHeight, minWidth: minWidth, context: context, initAspectRatio: initAspectRatio);
    } catch (e) {
      CustomErrorSnackBar.message(message: e.toString());
    }
    return null;
  }

  /// opens the input picker for selecting an image from the gallery
  /// after selecting an image it is opened in an image cropper
  /// check if 100 < width, height and image is square
  static Future<Uint8List?> crop({
    required XFile? res,
    required int minHeight,
    required int minWidth,
    required BuildContext context,
    CropAspectRatio? initAspectRatio
  }) async {
      if (res != null && context.mounted) {
        CroppedFile? croppedFile = await ImageCropper().cropImage(
          compressFormat: ImageCompressFormat.jpg,
          sourcePath: res.path,
          aspectRatio: initAspectRatio ?? const CropAspectRatio(ratioX: 1, ratioY: 1),
          uiSettings: [
            AndroidUiSettings(
              toolbarTitle: 'Cropper',
              toolbarWidgetColor: Colors.white,
              toolbarColor: Theme.of(context).primaryColor,
              lockAspectRatio: true,
            ),
            IOSUiSettings(
              title: 'Cropper',
              aspectRatioLockEnabled: true,
              aspectRatioLockDimensionSwapEnabled: false,
              aspectRatioPickerButtonHidden: true,
              resetAspectRatioEnabled: false,
            ),
            WebUiSettings(
              context: context,
            ),
          ],
        );
        if (croppedFile == null) return null;
        Uint8List image = await croppedFile.readAsBytes();
        final dimensions = await decodeImageFromList(image);
        if ((dimensions.width < minHeight && dimensions.height < minHeight)) {
          return null;
        }
        return image;
      }
      return null;
  }
}