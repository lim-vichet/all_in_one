import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

import '../../../data/models/upload_model/upload_model.dart';
import '../../../data/repositories/upload_repo/upload_repo.dart';
import '../../../data/services/upload_service/upload_service.dart';

part 'upload_event.dart';
part 'upload_state.dart';

class UploadBloc extends Bloc<UploadEvent, UploadState> {
  UploadBloc() : super(UploadInitial()) {
    UploadRepository obj = UploadService();

    on<OnUploadEvent>((event, emit) async {
      emit(UploadLoadingState());
      List<File> file = event.file;
      if (file.isEmpty) {
        emit(EmptyListImg());
        return;
      }
      var result = await obj.getUpload(file);

      emit(result.fold(
          (l) => UploadErrorState(),
          (r) => UploadSuccessState(r, file)));
    });

    on<OnEventXFile>((event, emit) async {

      emit(UploadLoadingState());
      List file = event.file;
      if (file.isEmpty) {
        emit(EmptyListImg(status: event.status));
        return;
      }
      var result = await obj.getUpload(file);
      emit(result.fold((l) => UploadErrorState(),
          (r) => UploadSuccessState(r, file, status: event.status)));
    });
    on<EventDeleteImage>((event, emit) {
      List<XFile> listImage = [];
      event.listImage.forEach((element) {
        if (element.path != event.imageItem.path) {
          listImage.add(element);
        }
      });
      emit(DeleteImageSuccess(listImage: listImage));
    });


    on<EventAddImageData>((event, emit) {
      List<XFile> listImage = event.listImageOld;

      for (var element in event.imageItemNew) {
        listImage.add(element);
      }
      emit(DeleteImageSuccess(listImage: listImage));
    });


    /// call event get single image
    on<EventGetImage>((event, emit) {
     emit(GetSingleImageSuccess(listImage: event.imageItemNew));
    });

  /// call event delete single image
    on<EventDeleteSingleImage>((event, emit) {
      List<File> listNewImage = [];
      event.listImage.forEach((element) {
        if (element.path != event.imageItem.path) {
          listNewImage.add(element);
        }
      });
      emit(DeleteSingleImageSuccess(listImage: listNewImage));
    });

  }

  void selectImage(List<File> listImg) {
    emit(TmpListImg(listImg));
  }

  void removeImage(List<File> listImg, int index) {
    listImg.removeAt(index);

    emit(RemoveImg(listImg));
  }
}
