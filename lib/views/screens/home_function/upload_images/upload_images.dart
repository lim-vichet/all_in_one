import 'dart:io';

import 'package:cross_file/cross_file.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../data/models/upload_model/upload_model.dart';
import '../../../../logic/bloc/upload/upload_bloc.dart';
import '../../../../routes/config_router.dart';
import '../../../../utils/constants/app_button.dart';
import '../../../../utils/constants/app_colors.dart';
import '../../../../utils/constants/bottom_snack_bar.dart';
import '../../../../utils/global_use.dart';
import '../../../widgets/error_screen.dart';
import '../../../widgets/file_attachment_widget.dart';
import '../../../widgets/loading/loading.dart';
import '../../main_screen/main_screen.dart';

class UploadImages extends StatefulWidget {
  const UploadImages({super.key});

  @override
  State<UploadImages> createState() => _UploadImagesState();
}

class _UploadImagesState extends State<UploadImages> {


  /// Upload
  // ================== upload ==================
  String? fileName;
  String? pathFile;
  String? type;
  String? name;
  String? extension;
  String? path;
  List<ResultFile> listResultFile=[];
  List<File> listShowImages = [];
  List<File> selectedImages = [];
  List<XFile> listImage = [];
  // ================== upload ==================

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => UploadBloc(),
      child: Scaffold(
          backgroundColor: AppColors().bgColorApp,
          appBar: AppBar(
            backgroundColor: Colors.lightBlueAccent,
            automaticallyImplyLeading: false,
            title: const Center(child: Text("Upload Image", style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),)),
          ),
          body: BlocConsumer<UploadBloc, UploadState>(
            listener: (context, state) async {
              if(state is UploadSuccessState){
                AppSnackBar.showBottomSnackBarSuccess(context: context,message: messageSuccess);
                await Future.delayed(const Duration(seconds: 5),(){
                  ConfigRouter.pushPage(context, MainScreen());
                });
              }
            },
            builder: (context, state) {
              if( state is UploadLoadingState ) {
                return LoadingScreen();
              }
              else if ( state is UploadErrorState ) {
                return const ErrorScreen();
              }
              else if ( state is TmpListImg ) {
                listShowImages = state.listImage;
              }
              else if ( state is RemoveImg ) {
                listShowImages = state.listImage;
              }
              return Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: ListView(
                        scrollDirection: Axis.vertical,
                        children: [
                          SizedBox(height: 15.px),

                          /// Images
                          FileAttachmentWidgets(
                            isText: false,
                            getListImage: (List<XFile> list) {
                              listImage = list;
                            },
                          ),
                          SizedBox(height: 15.px),
                          AppButton(
                            onPressed: () {
                              BlocProvider.of<UploadBloc>(context).add(OnEventXFile(listImage));
                            },
                            text: 'Save'.tr,
                          ),


                        ],
                      ),
                    ),
                  )
                ],
              );
            },
          )
      ),
    );
  }
}
