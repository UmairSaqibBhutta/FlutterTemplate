// import 'dart:convert';
// import 'dart:developer';

// import 'package:flutter/cupertino.dart';
// import 'package:get/get.dart';
// import 'package:hihello_flutter_app/api_urls.dart';
// import 'package:hihello_flutter_app/bottom_nav.dart';
// import 'package:hihello_flutter_app/cards/cards_page.dart';
// import 'package:hihello_flutter_app/cards/fields_feature_widget.dart';
// import 'package:hihello_flutter_app/constants.dart';
// import 'package:hihello_flutter_app/controllers/add_card_controller.dart';
// import 'package:hihello_flutter_app/main.dart';
// import 'package:hihello_flutter_app/models/cards_model.dart';
// import 'package:hihello_flutter_app/social_media_validators.dart';

// import 'package:http/http.dart' as http;

// class AddCardService {
//   Future<bool?> addCard() async {
//     AddCardController controller = Get.put(AddCardController());
//     String? path = baseUrl + AppUrls.addCArd;
//     String apiMethod = "POST";
//     if (controller.editcardData == null) {
//       path = baseUrl + AppUrls.addCArd;
//     } else {
//       apiMethod = "PUT";
//       path = "$baseUrl${AppUrls.updateCard}/${controller.editcardData!.id!}";

//       //
//     }

//     log("path = $path");
//     var uri = Uri.parse(path);

//     try {
//       var request = http.MultipartRequest(apiMethod, uri);

//       Map? fieldsJson;
// //     controller.fieldsWidgetList.forEach((widgetObj) {
// // // controller.fieldsList.add(Fields(type: widgetObj., url: url, name: name))
// //     });

//       controller.fieldsList.clear();
//       if (controller.emailUrlCont.text.isNotEmpty) {
//         controller.fieldsList.add(Fields(
//           type: "email", url: controller.emailUrlCont.text,

//           // name: "name"
//         ));
//       }

//       if (controller.facebookUrlCont.text.isNotEmpty) {
//         controller.fieldsList.add(Fields(
//           type: "facebook",
//           url: controller.facebookUrlCont.text,
//           // name: "name"
//         ));
//       }

//       if (controller.whatsappUrlCont.text.isNotEmpty) {
//         controller.fieldsList.add(Fields(
//           type: "whatsapp",
//           url: controller.whatsappUrlCont.text,
//           // name: "name"
//         ));
//       }

//       if (controller.twitterUrlCont.text.isNotEmpty) {
//         controller.fieldsList.add(Fields(
//           type: "twitter", url: controller.twitterUrlCont.text,
//           // name: "name"
//         ));
//       }

//       if (controller.linkedinUrlCont.text.isNotEmpty) {
//         controller.fieldsList.add(Fields(
//           type: "linkedin",
//           url: controller.linkedinUrlCont.text,
//           // name: "name"
//         ));
//       }

//       if (controller.webUrlCont.text.isNotEmpty) {
//         controller.fieldsList.add(Fields(
//           type: "website", url: controller.webUrlCont.text,
//           // name: "name"
//         ));
//       }

//       if (controller.locationControl.text.isNotEmpty) {
//         controller.fieldsList.add(Fields(
//           type: "location", url: controller.locationControl.text,
//           // name: "name"
//         ));
//       }

//       log(" fields = ${json.encode(controller.fieldsList.map((feild) => feild.toJson()).toList())}");

//       log("appointment = ${json.encode(controller.appointments.map((appointment) => appointment.toJson()).toList())}");

//       String? htmlEditorData = await controller.quillEditorController.getText();
//       log("htmlEditorData = $htmlEditorData");

//       if (controller.designNo == null) {
//         Get.snackbar("Error", "Please select card template first");
//         return false;
//       } else if (controller.profileImageVideo == null &&
//           controller.profileImgUrl == null) {
//         Get.snackbar("Error", "Profile Image is required");
//         return false;
//       } else if (controller.logoImage == null &&
//           controller.logoImgUrl == null) {
//         Get.snackbar("Error", "Logo Image is required");
//         return false;
//       } else if (controller.cardNameCont.text.isEmpty) {
//         Get.snackbar("Error", "Card name is required");
//         return false;
//       } else if (controller.userFirstNameCont.text.isEmpty) {
//         Get.snackbar("Error", "First name is required");
//         return false;
//       } else if (controller.userLastNameCont.text.isEmpty) {
//         Get.snackbar("Error", "Last name is required");
//         return false;
//       } else if (controller.affiliationDeptCont.text.isEmpty) {
//         Get.snackbar("Error", "Department name is required");
//         return false;
//       }

// //! validate email
//       else if (SocialMediaUrlValidator.validateEmail(
//               controller.emailUrlCont.text) !=
//           null) {
//         Get.snackbar(
//             'Error',
//             SocialMediaUrlValidator.validateEmail(
//                     controller.emailUrlCont.text) ??
//                 "");
//         return false;
//       }

// //! validate facebook
//       else if (SocialMediaUrlValidator.validateFacebookUrl(
//               controller.facebookUrlCont.text) !=
//           null) {
//         Get.snackbar(
//             'Error',
//             SocialMediaUrlValidator.validateFacebookUrl(
//                     controller.facebookUrlCont.text) ??
//                 "");
//         return false;
//       }

// //! validate whatsapp number

//       else if (SocialMediaUrlValidator.validateWhatsAppNumber(
//               controller.whatsappUrlCont.text) !=
//           null) {
//         Get.snackbar(
//             'Error',
//             SocialMediaUrlValidator.validateWhatsAppNumber(
//                     controller.whatsappUrlCont.text) ??
//                 "");
//         return false;
//       } else if (SocialMediaUrlValidator.validateTwitterUrl(
//               controller.twitterUrlCont.text) !=
//           null) {
//         Get.snackbar(
//             'Error',
//             SocialMediaUrlValidator.validateTwitterUrl(
//                     controller.twitterUrlCont.text) ??
//                 "");
//         return false;
//       }

//       //! validate linkedin
//       else if (SocialMediaUrlValidator.validateLinkedInUrl(
//               controller.linkedinUrlCont.text) !=
//           null) {
//         Get.snackbar(
//             'Error',
//             SocialMediaUrlValidator.validateLinkedInUrl(
//                     controller.linkedinUrlCont.text) ??
//                 "");
//         return false;
//       }

//       //! validate web url
//       else if (SocialMediaUrlValidator.validateWebUrl(
//               controller.webUrlCont.text) !=
//           null) {
//         Get.snackbar(
//             'Error',
//             SocialMediaUrlValidator.validateWebUrl(
//                     controller.webUrlCont.text) ??
//                 "");
//         return false;
//       } else if (controller.locationControl.text.isEmpty) {
//         Get.snackbar("Error", "Location is required");
//         return false;
//       } else if (controller.appointments.isEmpty) {
//         Get.snackbar("Error", "Please add at least one day for appointments");
//         return false;
//       }

//       //! validation removed from services
//       //! but if he adds service name and it is mandotory to add its desc and image
//       // else if (controller.serviceNameCont.text.isEmpty) {
//       //   Get.snackbar("Error", "Add any service name");
//       //   return false;
//       // }

//       else if (controller.serviceNameCont.text.isNotEmpty &&
//           controller.servicedesCont.text.isEmpty) {
//         Get.snackbar("Error", "Service description is required");
//         return false;
//       }

//       if (controller.serviceNameCont.text.isNotEmpty &&
//           controller.serviceCodeFile == null &&
//           controller.serviceCodeImgUrl == null) {
//         Get.snackbar("Error", "Service Image is required");
//         return false;
//       }
//       // else if (controller.serviceNameCont.text.isEmpty) {
//       //   Get.snackbar("Error", "Add any service name");
//       //   return false;
//       // }

//       //! validation removed from products
//       //! but if he adds product name and it is mandotory to add its desc and image

//       // else if (controller.productNameCont.text.isEmpty) {
//       //   Get.snackbar("Error", "Add any product name");
//       //   return false;
//       // }

//       else if (controller.productNameCont.text.isNotEmpty &&
//           controller.producDesCont.text.isEmpty) {
//         Get.snackbar("Error", "Product Description is required");
//         return false;
//       }

//       if (controller.productNameCont.text.isNotEmpty &&
//           controller.productCodeFile == null &&
//           controller.productCodeImgUrl == null) {
//         Get.snackbar("Error", "Product Image is required");
//         return false;
//       }

//       //! privacy policy check is removed
//       // else if (htmlEditorData == "" || htmlEditorData.isEmpty) {
//       //   Get.snackbar("Error", "Privacy Policy is required");
//       //   return false;
//       // }

//       controller.isCardSaving(true);
//       // Create a map to hold all the fields
//       Map<String, String> fields = {
//         "userId": loginStorage.getUserId() ?? "1",
//         "designNo": controller.designNo.toString(),
//         "designColor": controller.cardBgColor.toString(),
//         "cardName": controller.cardNameCont.text,
//         "location": controller.cardNameCont.text,
//         "prefix": controller.userPrefixCont.text,
//         "firstName": controller.userFirstNameCont.text,
//         "lastName": controller.userLastNameCont.text,
//         "middleName": controller.userMiddleNameCont.text,
//         "suffix": controller.userMiddleNameCont.text,
//         "accreditations": controller.userAccreditationsCont.text,
//         "prefferedName": controller.userPrefferedName.text,
//         "maidenName": controller.userMaidenName.text,
//         "pronouns": controller.userPronounsName.text,
//         "companyTitle": controller.affiliationTitleCont.text,
//         "companyDept": controller.affiliationDeptCont.text,
//         "companyName": controller.affiliationCompanyCont.text,
//         "companyHeadlines": controller.affiliationHeadlineCont.text,
//         if (controller.appointments.isNotEmpty)
//           "appointments": json.encode(controller.appointments
//               .map((appointment) => appointment.toJson())
//               .toList()),
//         if (controller.fieldsList.isNotEmpty)
//           "fields": json.encode(
//               controller.fieldsList.map((feild) => feild.toJson()).toList()),
//         "serviceName": controller.serviceNameCont.text,
//         "serviceUrl": controller.serviceUrlCont.text,
//         "serviceDesc": controller.servicedesCont.text,
//         "productName": controller.productNameCont.text,
//         "productUrl": controller.productUrlCont.text,
//         "productDesc": controller.producDesCont.text,
//         "productCurrency": controller.currencyVal ?? "Riyal",
//         "productPrice": controller.productPriceCont.text,
//       };

//       String? data = await controller.quillEditorController.getText();

//       // if (data ) {
//       request.fields["privacyPolicy"] = data;

//       // if (controller.editcardData != null) {
//       //   request.fields["id"] = controller.editcardData!.id!;
//       // }

//       request.fields.addAll(fields);

//       if (controller.profileImgUrl != null) {
//         request.fields["profileImage"] = controller.profileImgUrl!;
//       } else {
//         if (controller.profileImageVideo != null) {
//           request.files.add(await http.MultipartFile.fromPath(
//             "profileImage",
//             controller.profileImageVideo!.path,
//             filename: controller.profileImageVideo!.path.split("/").last,
//           ));
//         }
//       }

//       if (controller.logoImgUrl != null) {
//         request.fields["logoImage"] = controller.logoImgUrl!;
//       } else {
//         if (controller.logoImage != null) {
//           request.files.add(await http.MultipartFile.fromPath(
//             "logoImage",
//             controller.logoImage!.path,
//             filename: controller.logoImage!.path.split("/").last,
//           ));
//         }
//       }

//       if (controller.badgeImgUrl != null) {
//         request.fields["badgeImage"] = controller.badgeImgUrl!;
//       } else {
//         if (controller.badgeImage != null) {
//           request.files.add(await http.MultipartFile.fromPath(
//             "badgeImage",
//             controller.badgeImage!.path,
//             filename: controller.badgeImage!.path.split("/").last,
//           ));
//         }
//       }

//       if (controller.serviceCodeImgUrl != null) {
//         request.fields["serviceSourceFile"] = controller.serviceCodeImgUrl!;
//       } else {
//         if (controller.serviceCodeFile != null) {
//           request.files.add(await http.MultipartFile.fromPath(
//             "serviceSourceFile",
//             controller.serviceCodeFile!.path,
//             filename: controller.serviceCodeFile!.path.split("/").last,
//           ));
//         }
//       }

//       if (controller.productCodeImgUrl != null) {
//         request.fields["productSourceFile"] = controller.productCodeImgUrl!;
//       } else {
//         //! product souce file
//         if (controller.productCodeFile != null) {
//           request.files.add(await http.MultipartFile.fromPath(
//             "productSourceFile",
//             controller.productCodeFile!.path,
//             filename: controller.productCodeFile!.path.split("/").last,
//           ));
//         }
//       }

// // "":
//       // }
//       // Add all fields to the request

//       // if (controller.logoImage != null) {
//       //   request.files.add(await http.MultipartFile.fromPath(
//       //     "logoImage",
//       //     controller.logoImage!.path,
//       //     filename: controller.logoImage!.path.split("/").last,
//       //   ));
//       // }
//       // if (controller.badgeImage != null) {
//       //   request.files.add(await http.MultipartFile.fromPath(
//       //     "badgeImage",
//       //     controller.badgeImage!.path,
//       //     filename: controller.badgeImage!.path.split("/").last,
//       //   ));
//       // }

// //! service souce file

//       request.send().then((value) async {
//         log("value.statusCode = ${value.statusCode}");
//         String d = await value.stream.bytesToString();
//         Map json = jsonDecode(d);
//         log("value.body = $json");

//         if (value.statusCode == 200) {
//           Get.snackbar("Info", json["message"]);
//           controller.isCardSaving(false);

//           await getCards();
//           Get.offAll(BottomNavPage());

//           return true;
//         } else {
//           Get.snackbar("Error", json["message"]);
//           return false;
//         }
//       });
//     } catch (e) {
//       Get.snackbar("Error", "Card could not be saved. ${e.toString()}");
//       controller.isCardSaving(false);

//       return false;
//     }
//   }
// }

// Future<void> getCards() async {
//   try {
//     var responce = await getRequest.httpGetRequest(
//         url: "getCardsByUserId/${loginStorage.getUserId()}");
//     if (responce["data"] != null) {
//       cardsList = List<CardData>.from(
//           responce["data"].map((x) => CardData.fromJson(x)));
//       filteredCardsList = cardsList;
//       if (cardsList.isEmpty) {
//         emptyList = true;
//       }
//     } else {
//       emptyList = true;
//     }
//   } catch (e) {
//     emptyList = true;
//   }
// }

// bool emptyList = false;
// bool isLoading = true; // Add a loading state
// List<CardData> cardsList = [];
// List<CardData> filteredCardsList = [];
