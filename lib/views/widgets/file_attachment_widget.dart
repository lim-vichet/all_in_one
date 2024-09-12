

/// old code vichet

// import 'dart:io';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:dotted_border/dotted_border.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:geocoding/geocoding.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:get/get.dart';
// import 'package:image_cropper/image_cropper.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:intl/intl.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:responsive_sizer/responsive_sizer.dart';
// import 'package:turbotech/utils/global_use.dart';
// import '../../../../../logic/bloc/upload/upload_bloc.dart';
// import '../../../../../utils/constants/app_colors.dart';
// import '../../../../../utils/constants/app_dimensions.dart';
// import '../../../../../utils/constants/app_font_styles.dart';
// import 'dart:ui' as ui;
//
// class FileAttachmentWidgets extends StatefulWidget {
//   Function(List<XFile> listImage)? getListImage;
//   bool isText;
//   Widget? attachment;
//   String? title;
//   Color? titleColor;
//   double? height;
//   Color? bgColor;
//
//   FileAttachmentWidgets(
//       {
//         super.key,
//         this.getListImage,
//         this.isText = true,
//         this.attachment,
//         this.title,
//         this.titleColor,
//         this.height,
//         this.bgColor,
//       });
//
//   @override
//   State<FileAttachmentWidgets> createState() => _FileAttachmentWidgetsState();
// }
//
// class _FileAttachmentWidgetsState extends State<FileAttachmentWidgets> {
//   List<XFile> listImage = [];
//
//   File? _image;
//   String? _address;
//   String? _time;
//   final ImagePicker _picker = ImagePicker();
//   final FirebaseStorage _storage = FirebaseStorage.instance;
//   GlobalKey _globalKey = GlobalKey(); // GlobalKey for screenshot
//
//   Future<void> _takePhoto() async {
//     try {
//       Position position = await _getCurrentLocation();
//       _address = await _getAddressFromLatLng(position.latitude, position.longitude);
//       _time = DateFormat('HH:mm').format(DateTime.now());
//
//       final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
//       if (photo != null) {
//         setState(() {
//           _image = File(photo.path);
//         });
//       }
//     } catch (e) {
//       print("Error: $e");
//     }
//   }
//
//   Future<void> _uploadScreenshot() async {
//     if (_image == null || _address == null || _time == null) return;
//
//     try {
//       // Capture the screenshot
//       RenderRepaintBoundary boundary = _globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
//       ui.Image image = await boundary.toImage();
//       ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
//       Uint8List pngBytes = byteData!.buffer.asUint8List();
//
//       // Save the screenshot as a file
//       final tempDir = await getTemporaryDirectory();
//       final file = await File('${tempDir.path}/screenshot.png').create();
//       await file.writeAsBytes(pngBytes);
//
//
//       // Upload screenshot to Firebase Storage
//       String fileName = DateTime.now().millisecondsSinceEpoch.toString();
//       Reference ref = _storage.ref().child('images/$fileName');
//       UploadTask uploadTask = ref.putFile(file);
//       TaskSnapshot snapshot = await uploadTask;
//
//       // Get download URL
//       String downloadURL = await snapshot.ref.getDownloadURL();
//
//       // Store metadata in Firestore
//       await FirebaseFirestore.instance.collection('uploads').add({
//         'downloadURL': downloadURL,
//         'address': _address,
//         'time': _time,
//         'uploadedAt': Timestamp.now(),
//       });
//
//       print("======================= File Path  : ${file}");
//       print('Screenshot upload successful: $downloadURL');
//     } catch (e) {
//       print('Error uploading screenshot: $e');
//     }
//   }
//
//   Future<Position> _getCurrentLocation() async {
//     bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
//     if (!serviceEnabled) {
//       return Future.error('Location services are disabled.');
//     }
//
//     LocationPermission permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied) {
//       permission = await Geolocator.requestPermission();
//       if (permission == LocationPermission.denied) {
//         return Future.error('Location permissions are denied.');
//       }
//     }
//
//     if (permission == LocationPermission.deniedForever) {
//       return Future.error('Location permissions are permanently denied, we cannot request permissions.');
//     }
//
//     return await Geolocator.getCurrentPosition();
//   }
//
//   Future<String> _getAddressFromLatLng(double latitude, double longitude) async {
//     try {
//       List<Placemark> placemarks = await placemarkFromCoordinates(latitude, longitude);
//       if (placemarks.isNotEmpty) {
//         Placemark place = placemarks.first;
//         return "${place.street}, ${place.subLocality}, ${place.locality}, ${place.administrativeArea}, ${place.country}";
//       }
//       return "Unknown location";
//     } catch (e) {
//       print("Error in converting coordinates to address: $e");
//       return "Error in getting location";
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//
//     return BlocProvider(
//       create: (context) => UploadBloc(),
//       child: BlocConsumer<UploadBloc, UploadState>(
//         listener: (BuildContext context, UploadState state) {
//           if (state is AddImageDataSuccess) {
//             listImage = state.listImage;
//             widget.getListImage!(listImage);
//           }
//         },
//         builder: (context, state) {
//           if (state is DeleteImageSuccess) {
//             listImage = state.listImage;
//             widget.getListImage!(listImage);
//           }
//           return SizedBox(
//             width: double.maxFinite,
//             child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       widget.isText ?
//                       Text(
//                         "Upload Files".tr,
//                         style: AppTextStyle().textS(
//                           fontWeight: FontWeight.w500,
//                           color: widget.titleColor?? AppColors().black,
//                         ),
//                       ): const SizedBox.shrink()
//                     ],
//                   ),
//                   SizedBox(
//                     height:widget.isText ? 10.px:0.px,
//                   ),
//                   InkWell(
//                     onTap: () {
//                       showDialogChangeImage(context, (List<XFile> imageListNew) {
//                         context.read<UploadBloc>().add(
//                           EventAddImageData(
//                             listImageOld: listImage,
//                             imageItemNew: imageListNew,
//                           ),
//                         );
//                         Navigator.pop(context);
//                       });
//                     },
//                     child: widget.attachment ??
//                         DottedBorder(
//                           borderType: BorderType.RRect,
//                           radius: Radius.circular(5.px),
//                           dashPattern: [2.px, 2],
//                           color: AppColors().grey.withOpacity(0.6),
//                           strokeWidth: 1,
//                           child: Container(
//                               height: widget.height?? 70.px,
//                               width: double.infinity,
//                               alignment: Alignment.center,
//                               decoration: BoxDecoration(
//                                 color: widget.bgColor ?? AppColors().bgColorApp,
//                                 borderRadius: BorderRadius.circular(5.px),
//                               ),
//                               padding: EdgeInsets.symmetric(horizontal: 5.px),
//                               child: Column(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   SvgPicture.asset(
//                                     "assets/icons/icons_svg/ic_upload_files.svg",
//                                     width: 25.px,
//                                     height: 25.px,
//                                   ),
//                                   Container(
//                                     padding: EdgeInsets.only(
//                                         top: 5.px,
//                                         bottom: 5.px
//                                     ),
//                                     child: Text(
//                                       "Upload your files".tr,
//                                       style: AppTextStyle().titleS(color: AppColors().grey, fontSize: 14),
//                                     ),
//                                   ),
//                                 ],
//                               )),
//                         ),
//                   ),
//                   Container(
//                     alignment: Alignment.centerLeft,
//                     width: double.infinity,
//                     margin: EdgeInsets.only(top: listImage.isEmpty ? 0 : 10.px),
//                     height: listImage.isEmpty ? 10.px : 90.px,
//                     child: ListView.builder(
//                         itemCount: listImage.length,
//                         scrollDirection: Axis.horizontal,
//                         physics: const BouncingScrollPhysics(),
//                         shrinkWrap: true,
//                         itemBuilder: (context, index) {
//                           return fileItemGrid(index + 1 , listImage[index], () {
//                             context.read<UploadBloc>().add(EventDeleteImage(
//                                 listImage: listImage,
//                                 imageItem: listImage[index]));
//                           });
//                         }),
//                   ),
//                 ]),
//           );
//         },
//       ),
//     );
//   }
//
//
//   /// list image
//   Widget fileItemGrid(int index, XFile data, Function() deleteData) {
//     return Container(
//       margin: EdgeInsets.symmetric(horizontal: 5.px, vertical: 5.px),
//       width: 90.px,
//       height: 80.px,
//       child: RepaintBoundary(
//         key: _globalKey,
//         child: Stack(
//           children: [
//             Container(
//                 width: 80.px,
//                 height: 80.px,
//                 clipBehavior: Clip.hardEdge,
//                 decoration: BoxDecoration(
//                     color: AppColors().white.withOpacity(0.5),
//                     borderRadius: BorderRadius.circular(10)),
//                 child: Image.file(
//                   File(data.path),
//                   fit: BoxFit.cover,
//                 )),
//             Positioned(
//               top: -2,
//               right: 3,
//               // bottom: 0,
//               // left: 0,
//               child: Column(
//                 children: [
//
//                   InkWell(
//                       onTap: () => deleteData(),
//                       child: Icon(
//                         Icons.cancel_outlined,
//                         color: AppColors().primaryRed,
//                         size: 25.px,
//                       )),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   /// for function picker image
//   XFile? image;
//   Future pickImage(Function(List<XFile> imageLists) addImage) async {
//     List<XFile> listImg = [];
//
//     Position position = await _getCurrentLocation();
//     _address = await _getAddressFromLatLng(position.latitude, position.longitude);
//     _time = DateFormat('HH:mm').format(DateTime.now());
//
//     try {
//       final XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
//       if (image == null) return;
//       _image = File(image.path);
//       listImg.add(image);
//       addImage(listImg);
//     } on PlatformException catch (e) {
//       // print('Failed to pick image: $e');
//     }
//   }
//
//   Widget fileItem(int index, XFile data, Function() deleteData) {
//     return Container(
//       // width: double.maxFinite,
//       margin: EdgeInsets.symmetric(horizontal: 10.px, vertical: 5.px),
//       padding: EdgeInsets.symmetric(vertical: 10.px),
//       decoration: BoxDecoration(
//           color: AppColors().white.withOpacity(0.5),
//           borderRadius: BorderRadius.circular(5)),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Container(
//               alignment: Alignment.center,
//               padding: EdgeInsets.symmetric(horizontal: 10.px),
//               child: Row(
//                 children: [
//                   Text(
//                     "$index .",
//                     style: AppTextStyle().textS(),
//                   ),
//                   SizedBox(
//                     width: 5.px,
//                   ),
//                   Text(
//                     "${"Name".tr}   :",
//                     style: AppTextStyle().textS(),
//                   ),
//                 ],
//               )),
//           Expanded(
//               child: Text(
//                 data.name,
//                 style: AppTextStyle().textS(),
//                 overflow: TextOverflow.clip,
//               )),
//           InkWell(
//             onTap: () => deleteData(),
//             child: Padding(
//               padding: const EdgeInsets.only(right: 5.0),
//               child: Icon(
//                 Icons.delete_forever,
//                 size: 25,
//                 color: AppColors().primaryRed,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//
//   Future pickCamera(Function(List<XFile> imageLists) addImage) async {
//     List<XFile> listImg = [];
//
//     Position position = await _getCurrentLocation();
//     _address = await _getAddressFromLatLng(position.latitude, position.longitude);
//     _time = DateFormat('HH:mm').format(DateTime.now());
//
//     // try {
//     //   final image = await ImagePicker().pickImage(source: ImageSource.camera);
//     //   if (image == null) return;
//     //   listImg.add(image);
//     //   addImage(listImg);
//     // } on PlatformException catch (e) {
//     //   // print('Failed to pick image: $e');
//     // }
//
//     try {
//       final XFile? image = await ImagePicker().pickImage(source: ImageSource.camera);
//       if (image == null) return;
//       _image = File(image.path);
//       listImg.add(image);
//       addImage(listImg);
//     } on PlatformException catch (e) {
//       // print('Failed to pick image: $e');
//     }
//   }
//
//
//
//   Future<void> showDialogChangeImage(BuildContext context, Function(List<XFile> imageLists) addImage) async {
//     showDialog(
//         context: context,
//         builder: (context) {
//           return AlertDialog(
//             contentPadding: EdgeInsets.zero,
//             insetPadding: const EdgeInsets.all(15.0),
//             shape: const RoundedRectangleBorder(
//               borderRadius: BorderRadius.all(Radius.circular(10.0)),
//             ),
//             content: Container(
//               padding: EdgeInsets.symmetric(vertical: AppDimension().medium),
//               height: screenWidth > 500 ? screenHeight / 5.5 : screenHeight / 5.4,
//               width: screenWidth / 4.5,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   Expanded(
//                     child: GestureDetector(
//                       onTap: () {
//                         getImages(context, addImage);
//                       },
//                       child: Container(
//                         width: double.infinity,
//                         margin: EdgeInsets.only(
//                           top: AppDimension().small,
//                           bottom: AppDimension().small,
//                           left: AppDimension().bodySpace,
//                           right: AppDimension().bodySpace,
//                         ),
//                         height: 48,
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(8),
//                             border: Border.all(
//                                 color: AppColors().black.withOpacity(0.4),
//                                 width: 0.3),
//                             boxShadow: [
//                               BoxShadow(
//                                   color: AppColors().grey.withOpacity(.2),
//                                   blurRadius: 3,
//                                   spreadRadius: 1)
//                             ]),
//                         child: Row(
//                           children: [
//                             Container(
//                                 padding: EdgeInsets.symmetric(horizontal: 15.px),
//                                 child: SvgPicture.asset("assets/icons/icons_svg/upload_image.svg")
//                             ),
//                             Expanded(
//                               child: Text(
//                                 'Pick With Photo'.tr,
//                                 style: AppTextStyle().titleS(),
//                               ),
//                             )
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                   Expanded(
//                     child: GestureDetector(
//                       onTap: () {
//                         pickCamera(addImage);
//                       },
//                       child: Container(
//                         width: double.infinity,
//                         margin: EdgeInsets.only(
//                           top: AppDimension().small,
//                           bottom: AppDimension().small,
//                           left: AppDimension().bodySpace,
//                           right: AppDimension().bodySpace,
//                         ),
//                         height: 48,
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(8),
//                             border: Border.all(
//                                 color: AppColors().black.withOpacity(0.4),
//                                 width: 0.3),
//                             boxShadow: [
//                               BoxShadow(
//                                   color: AppColors().grey.withOpacity(.2),
//                                   blurRadius: 3,
//                                   spreadRadius: 1)
//                             ]),
//                         child: Row(
//                           children: [
//                             Container(
//                                 padding: EdgeInsets.symmetric(horizontal: 15.px),
//                                 child: SvgPicture.asset("assets/icons/icons_svg/take_photo.svg")
//                             ),
//                             Expanded(
//                               child: Text(
//                                 'Pick With Camera'.tr,
//                                 style: AppTextStyle().titleS(),
//                               ),
//                             )
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         });
//   }
//
//   Future getImages(uploadContext, Function(List<XFile> imagelists) getListImage) async {
//     final pickedFile = await ImagePicker()
//         .pickMultiImage(imageQuality: 100, maxHeight: 1000, maxWidth: 1000);
//     List<XFile> xfilePick = pickedFile;
//     if (xfilePick.isNotEmpty) {
//       // for (var i = 0; i < xfilePick.length; i++) {
//       //   getListImage(imagelists.add(File(xfilePick[i].path)));
//       // }
//       getListImage(xfilePick);
//       // BlocProvider.of<UploadBloc>(uploadContext).selectImage(selectedImages);
//     } else {
//       // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Nothing is selected')));
//       // print('Nothing is selected');
//     }
//   }
//
//   Future<File?> _cropImage({required File imageFile}) async {
//     CroppedFile? croppedImage =
//     await ImageCropper().cropImage(sourcePath: imageFile.path);
//     if (croppedImage == null) return null;
//     return File(croppedImage.path);
//   }
// }



/// new code

import 'dart:io';
import 'package:cross_file/cross_file.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../../utils/constants/app_colors.dart';
import '../../../../../utils/constants/app_dimensions.dart';
import '../../../../../utils/constants/app_font_styles.dart';
import '../../logic/bloc/upload/upload_bloc.dart';
import '../../utils/global_use.dart';

class FileAttachmentWidgets extends StatefulWidget {
  Function(List<XFile> listImage)? getListImage;
  bool isText;
  Widget? attachment;
  String? title;
  Color? titleColor;
  double? height;
  Color? bgColor;

  FileAttachmentWidgets(
      {
        super.key,
        this.getListImage,
        this.isText = true,
        this.attachment,
        this.title,
        this.titleColor,
        this.height,
        this.bgColor,
      });

  @override
  State<FileAttachmentWidgets> createState() => _FileAttachmentWidgetsState();
}

class _FileAttachmentWidgetsState extends State<FileAttachmentWidgets> {
  List<XFile> listImage = [];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UploadBloc(),
      child: BlocConsumer<UploadBloc, UploadState>(
        listener: (BuildContext context, UploadState state) {
          if (state is AddImageDataSuccess) {
            listImage = state.listImage;
            widget.getListImage!(listImage);
          }
        },
        builder: (context, state) {
          if (state is DeleteImageSuccess) {
            listImage = state.listImage;
            widget.getListImage!(listImage);
          }
          return SizedBox(
            width: double.maxFinite,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      widget.isText ?
                      Text(
                        "Upload Files".tr,
                        style: AppTextStyle().textS(
                          fontWeight: FontWeight.w500,
                          color: widget.titleColor?? AppColors().black,
                        ),
                      ): const SizedBox.shrink()
                    ],
                  ),
                  SizedBox(
                    height:widget.isText ? 10.px:0.px,
                  ),
                  InkWell(
                    onTap: () {
                      showDialogChangeImage(context,
                              (List<XFile> imageListNew) {
                            context.read<UploadBloc>().add(
                              EventAddImageData(
                                listImageOld: listImage,
                                imageItemNew: imageListNew,
                              ),
                            );
                            Navigator.pop(context);
                          });
                    },
                    child: widget.attachment ??
                        DottedBorder(
                          borderType: BorderType.RRect,
                          radius: Radius.circular(5.px),
                          dashPattern: [2.px, 2],
                          color: AppColors().grey.withOpacity(0.6),
                          strokeWidth: 1,
                          child: Container(
                              height: widget.height?? 70.px,
                              width: double.infinity,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: widget.bgColor ?? AppColors().bgColorApp,
                                borderRadius: BorderRadius.circular(5.px),
                              ),
                              padding: EdgeInsets.symmetric(horizontal: 5.px),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    "assets/icons/icons_svg/ic_upload_files.svg",
                                    width: 25.px,
                                    height: 25.px,
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(
                                        top: 5.px,
                                        bottom: 5.px
                                    ),
                                    child: Text(
                                      "Upload your files".tr,
                                      style: AppTextStyle().titleS(color: AppColors().grey, fontSize: 14),
                                    ),
                                  ),
                                ],
                              )),
                        ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    width: double.infinity,
                    margin: EdgeInsets.only(top: listImage.isEmpty ? 0 : 10.px),
                    height: listImage.isEmpty ? 10.px : 90.px,
                    child: ListView.builder(
                        itemCount: listImage.length,
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return fileItemGrid(index + 1, listImage[index], () {
                            context.read<UploadBloc>().add(EventDeleteImage(
                                listImage: listImage,
                                imageItem: listImage[index]));
                          });
                        }),
                  ),
                ]),
          );
        },
      ),
    );
  }

  XFile? image;
  Future pickImage(Function(List<XFile> imageLists) addImage) async {
    List<XFile> listImg = [];
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      listImg.add(image);
      addImage(listImg);
    } on PlatformException catch (e) {
      // print('Failed to pick image: $e');
    }
  }

  Widget fileItem(int index, XFile data, Function() deleteData) {
    return Container(
      // width: double.maxFinite,
      margin: EdgeInsets.symmetric(horizontal: 10.px, vertical: 5.px),
      padding: EdgeInsets.symmetric(vertical: 10.px),
      decoration: BoxDecoration(
          color: AppColors().white.withOpacity(0.5),
          borderRadius: BorderRadius.circular(5)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 10.px),
              child: Row(
                children: [
                  Text(
                    "$index .",
                    style: AppTextStyle().textS(),
                  ),
                  SizedBox(
                    width: 5.px,
                  ),
                  Text(
                    "${"Name".tr}   :",
                    style: AppTextStyle().textS(),
                  ),
                ],
              )),
          Expanded(
              child: Text(
                data.name,
                style: AppTextStyle().textS(),
                overflow: TextOverflow.clip,
              )),
          InkWell(
            onTap: () => deleteData(),
            child: Padding(
              padding: const EdgeInsets.only(right: 5.0),
              child: Icon(
                Icons.delete_forever,
                size: 25,
                color: AppColors().primaryRed,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget fileItemGrid(int index, XFile data, Function() deleteData) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.px, vertical: 5.px),
      width: 90.px,
      height: 80.px,
      child: Stack(
        children: [
          Container(
              width: 80.px,
              height: 80.px,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                  color: AppColors().white.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(10)),
              child: Image.file(
                File(data.path),
                fit: BoxFit.cover,
              )),
          Positioned(
            top: -2,
            right: 3,
            // bottom: 0,
            // left: 0,
            child: InkWell(
                onTap: () => deleteData(),
                child: Icon(
                  Icons.cancel_outlined,
                  color: AppColors().primaryRed,
                  size: 25.px,
                )),
          ),
        ],
      ),
    );
  }

  Future pickCamera(Function(List<XFile> imageLists) addImage) async {
    List<XFile> listImg = [];
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      if (image == null) return;
      final imageTemp = File(image.path);
      // var cropImage = await _cropImage(imageFile: imageTemp);
      // setState(() {
      //   listImage.add(image);
      //   print("kkkkkkkkk${image.name}");
      //   // this.image = cropImage;
      //   Navigator.pop(context);
      // });
      listImg.add(image);
      addImage(listImg);
    } on PlatformException catch (e) {
      // print('Failed to pick image: $e');
    }
  }

  Future<void> showDialogChangeImage(
      BuildContext context, Function(List<XFile> imageLists) addImage) async {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            contentPadding: EdgeInsets.zero,
            insetPadding: const EdgeInsets.all(15.0),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
            content: Container(
              padding: EdgeInsets.symmetric(vertical: AppDimension().medium),
              height: screenWidth > 500 ? screenHeight / 5.5 : screenHeight / 5.4,
              width: screenWidth / 4.5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        getImages(context, addImage);
                      },
                      child: Container(
                        width: double.infinity,
                        margin: EdgeInsets.only(
                          top: AppDimension().small,
                          bottom: AppDimension().small,
                          left: AppDimension().bodySpace,
                          right: AppDimension().bodySpace,
                        ),
                        height: 48,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                                color: AppColors().black.withOpacity(0.4),
                                width: 0.3),
                            boxShadow: [
                              BoxShadow(
                                  color: AppColors().grey.withOpacity(.2),
                                  blurRadius: 3,
                                  spreadRadius: 1)
                            ]),
                        child: Row(
                          children: [
                            Container(
                                padding: EdgeInsets.symmetric(horizontal: 15.px),
                                child: SvgPicture.asset("assets/icons/icons_svg/upload_image.svg")
                            ),
                            Expanded(
                              child: Text(
                                'Pick With Photo'.tr,
                                style: AppTextStyle().titleS(),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        pickCamera(addImage);
                      },
                      child: Container(
                        width: double.infinity,
                        margin: EdgeInsets.only(
                          top: AppDimension().small,
                          bottom: AppDimension().small,
                          left: AppDimension().bodySpace,
                          right: AppDimension().bodySpace,
                        ),
                        height: 48,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                                color: AppColors().black.withOpacity(0.4),
                                width: 0.3),
                            boxShadow: [
                              BoxShadow(
                                  color: AppColors().grey.withOpacity(.2),
                                  blurRadius: 3,
                                  spreadRadius: 1)
                            ]),
                        child: Row(
                          children: [
                            Container(
                                padding: EdgeInsets.symmetric(horizontal: 15.px),
                                child: SvgPicture.asset("assets/icons/icons_svg/take_photo.svg")
                            ),
                            Expanded(
                              child: Text(
                                'Pick With Camera'.tr,
                                style: AppTextStyle().titleS(),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  Future getImages(
      uploadContext, Function(List<XFile> imagelists) getListImage) async {
    final pickedFile = await ImagePicker()
        .pickMultiImage(imageQuality: 100, maxHeight: 1000, maxWidth: 1000);
    List<XFile> xfilePick = pickedFile;
    if (xfilePick.isNotEmpty) {
      // for (var i = 0; i < xfilePick.length; i++) {
      //   getListImage(imagelists.add(File(xfilePick[i].path)));
      // }
      getListImage(xfilePick);
      // BlocProvider.of<UploadBloc>(uploadContext).selectImage(selectedImages);
    } else {
      // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Nothing is selected')));
      // print('Nothing is selected');
    }
  }

  Future<File?> _cropImage({required File imageFile}) async {
    CroppedFile? croppedImage =
    await ImageCropper().cropImage(sourcePath: imageFile.path);
    if (croppedImage == null) return null;
    return File(croppedImage.path);
  }
}


