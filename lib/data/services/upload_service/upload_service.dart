
import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../utils/constants/url_path.dart';
import '../../models/network_error_model/network_error_model.dart';
import '../../models/upload_model/upload_model.dart';
import '../../repositories/upload_repo/upload_repo.dart';
import '../main_services/base_api_service.dart';
import '../main_services/error_handler/network_error_handler.dart';

class UploadService extends UploadRepository {
  @override
  Future<Either<NetworkErrorModel, UploadModel>> getUpload(List file) async {
   try {

     List<MultipartFile> files = [];
     for ( var data in file ) {
       files.add(await MultipartFile.fromFile(data.path));
       // files.add(await MultipartFile.fromFileSync(data.path));
     }
     var formData = FormData.fromMap({"file[]":files});
     var response = await BaseAPIService().post(
         UrlPath.upload,
          formData: formData
     );

     print("hello data3333333333333333333 ============= $response");
     return Right(UploadModel.fromJson(response));
   } on DioError catch ( e ) {
     log("------------------------------> Error Upload Files: $e");
     var err = await NetworkErrorHandler().exec(e);
     return Left(NetworkErrorModel(title: err!.title, description: err.description, statusCode: err.statusCode));
   }
  }

}