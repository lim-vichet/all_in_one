

import 'package:all_in_one/data/models/network_error_model/network_error_model.dart';
import 'package:dartz/dartz.dart';

import '../../models/all_form_detail_model/work_on_site_detail_model.dart';

abstract class WorkOnSiteDetailRepository{
  Future<Either<NetworkErrorModel, FormWorkOnSiteDetailModel>> getDataWorkOnSiteDetail({
    required int id
  });
}