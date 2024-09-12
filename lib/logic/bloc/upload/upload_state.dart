part of 'upload_bloc.dart';

@immutable
abstract class UploadState {}

class UploadInitial extends UploadState {}
class UploadLoadingState extends UploadState {}
class UploadErrorState extends UploadState {}
class UploadSuccessState extends UploadState {
  UploadModel data;
  List listImage;
  String? status;
  UploadSuccessState(this.data,this.listImage,{this.status});
}

class TmpListImg extends UploadState {
  List<File> listImage;
  TmpListImg(this.listImage);
}

class RemoveImg extends UploadState {
  List<File> listImage;
  RemoveImg(this.listImage);
}

class EmptyListImg extends UploadState {
  String? status;
  EmptyListImg({this.status});
}
class DeleteImageSuccess extends UploadState {
  final List<XFile> listImage;

  DeleteImageSuccess({required this.listImage});
}

class AddImageDataSuccess extends UploadState {
  final List<XFile> listImage;

  AddImageDataSuccess({required this.listImage});
}

/// get single image success
class GetSingleImageSuccess extends UploadState {

  final List<File> listImage;
  GetSingleImageSuccess({
    required this.listImage
  });
}

/// delete single image success
class DeleteSingleImageSuccess extends UploadState{
  final List<File> listImage;

  DeleteSingleImageSuccess({
    required this.listImage
  });
}




