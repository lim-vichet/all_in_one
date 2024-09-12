
import 'package:dartz/dartz.dart';

import '../../models/network_error_model/network_error_model.dart';
import '../../models/upload_model/upload_model.dart';


abstract class UploadRepository {
  Future<Either<NetworkErrorModel,UploadModel>> getUpload(List file);
}

