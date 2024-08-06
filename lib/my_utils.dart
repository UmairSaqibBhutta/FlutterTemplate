import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_template/colors.dart';
import 'package:flutter_template/main.dart';

import 'package:file_picker/file_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class MyUtils {
  static Future<File?> myImageOrVideoPicker(context) async {
    File? file;
    FilePicker.platform.pickFiles(
        allowMultiple: false,
        allowCompression: true,
        type: FileType.custom,
        allowedExtensions: ["png", "jpeg", "jpg", "mp4"]).then((value) async {
      if (value != null) {
        if (value.files.first.extension!.contains("mp4")) {
          file = File(value.files.first.path!);

          return file;
        } else {
          file = File(value.files.first.path!);
          if (file != null) {
            file = await cropImage(file!, context);
            log("cropped image received with path = ${file!.path}");
            return file;
          }
        }
      }
    });
  }

  static Future<File?> getCroppedImage(context,
      {double? xAxisRatio, double? yAxisRatio}) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      allowCompression: false,
      type: FileType.image,
    );

    if (result != null) {
      File? imageFile = File(result.files.first.path!);

      imageFile = await cropImage(imageFile, context,
          xAxisRatio: xAxisRatio, yAxisRatio: yAxisRatio);

      return imageFile;
    }
  }

  static Future<File?> pickSimpleImage(context, {ImageSource? source}) async {
    final ImagePicker picker = ImagePicker();
    XFile? photo =
        await picker.pickImage(source: source ?? ImageSource.gallery);
    if (photo != null) {
      File? file = File(photo.path);
      return file;
    }
  }

  static Future<File?> getCameraCroppedImage(context) async {
    final ImagePicker picker = ImagePicker();
    XFile? photo = await picker.pickImage(source: ImageSource.camera);
    if (photo != null) {
      File? file = File(photo.path);
      file = await cropImage(file, context);
      return file;
    }
  }

  // static Future<void> scanQRCodeWithGoogle(File image) async {
  //   final inputImage = InputImage.fromFile(image);
  //   final barcodeScanner = GoogleMlKit.vision.barcodeScanner();
  //   final barcodes = await barcodeScanner.processImage(inputImage);

  //   logger.i("barcodes.first.rawValue = ${barcodes.first.rawValue}");

  // String? qrCode;
  // for (Barcode barcode in barcodes) {
  //   final String? value = barcode.value.;
  //   if (value != null) {
  //     qrCode = value;
  //     break;
  //   }
  // }

  // setState(() {
  //   _qrCodeResult = qrCode ?? 'No QR code found in the image.';
  // });

  //   barcodeScanner.close();
  // }

  static Future<File?> cropImage(File file, BuildContext context,
      {double? xAxisRatio, double? yAxisRatio}) async {
    CroppedFile? croppedFile = CroppedFile(file.path);
    croppedFile = await ImageCropper().cropImage(
      sourcePath: file.path,
      aspectRatio:
          CropAspectRatio(ratioX: xAxisRatio ?? 1, ratioY: yAxisRatio ?? 1),
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'Crop selected image',
          toolbarColor: appColor,
          toolbarWidgetColor: Colors.white,
          aspectRatioPresets: [
            CropAspectRatioPreset.original,
            CropAspectRatioPreset.square,
            CropAspectRatioPresetCustom(),
          ],
        ),
        IOSUiSettings(
          title: 'Crop selected image',
          aspectRatioPresets: [
            CropAspectRatioPreset.original,
            CropAspectRatioPreset.square,
            CropAspectRatioPresetCustom(), // IMPORTANT: iOS supports only one custom aspect ratio in preset list
          ],
        ),
        WebUiSettings(
          context: context,
        ),
      ],
    );

    log("croppedFile path = ${croppedFile!.path}");
    // if (croppedFile != null) {
    return File(croppedFile.path);
    // }
  }

  static clearLocalData() {
    loginStorage.clearStorageData();
  }
}

class CropAspectRatioPresetCustom implements CropAspectRatioPresetData {
  @override
  (int, int)? get data => (2, 3);

  @override
  String get name => '2x3 (customized)';
}
