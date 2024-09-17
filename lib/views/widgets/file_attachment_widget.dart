import 'dart:io';
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
// import 'package:turbotech/utils/global_use.dart';
import '../../../../../logic/bloc/upload/upload_bloc.dart';
import '../../../../../utils/constants/app_colors.dart';
import '../../../../../utils/constants/app_dimensions.dart';
import '../../../../../utils/constants/app_font_styles.dart';

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
                      showDialogChangeImage(context, (List<XFile> imageListNew) {
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
                          return fileItemGrid(index + 1 , listImage[index], () {
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


  /// list image
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

  /// for function picker image
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


  Future pickCamera(Function(List<XFile> imageLists) addImage) async {
    List<XFile> listImg = [];
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      if (image == null) return;
      listImg.add(image);
      addImage(listImg);
    } on PlatformException catch (e) {
      // print('Failed to pick image: $e');
    }
  }

  Future<void> showDialogChangeImage(BuildContext context, Function(List<XFile> imageLists) addImage) async {
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
              height: 200,
              width: 100,
              // height: screenWidth > 500 ? screenHeight / 5.5 : screenHeight / 5.4,
              // width: screenWidth / 4.5,
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
                            color: Colors.lightBlueAccent,
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: Center(
                          child: Text(
                            'Pick With Photo'.tr,
                            style: AppTextStyle().titleS(),
                          ),
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
                            color: Colors.orange,
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Center(
                          child: Text(
                            'Pick With Camera'.tr,
                            style: AppTextStyle().titleS(),
                          ),
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

  Future getImages(uploadContext, Function(List<XFile> imagelists) getListImage) async {
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

