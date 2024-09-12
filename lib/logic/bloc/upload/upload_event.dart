part of 'upload_bloc.dart';

@immutable
abstract class UploadEvent {}
class OnUploadEvent extends UploadEvent{
  List<File> file;
  OnUploadEvent(this.file);
}

class OnEventXFile extends UploadEvent{
  List file;
  String? status;
  OnEventXFile(this.file,{this.status});
}
class EventDeleteImage extends UploadEvent {

  final List<XFile> listImage;
  final XFile imageItem;

  EventDeleteImage({required this.listImage,required this.imageItem});

}


class EventAddImageData extends UploadEvent {

  final List<XFile> listImageOld;
  final List<XFile> imageItemNew;

  EventAddImageData({required this.listImageOld,required this.imageItemNew});

}


/// event delete single image
class EventDeleteSingleImage extends UploadEvent {
  final List<File> listImage;
  final File imageItem;

  EventDeleteSingleImage({
    required this.listImage,
    required this.imageItem
  });

}

/// event get image
class EventGetImage extends UploadEvent {
  final List<File> imageItemNew;

  EventGetImage({
    required this.imageItemNew
  });

}





