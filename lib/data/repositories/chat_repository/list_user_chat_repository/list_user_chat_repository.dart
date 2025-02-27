

import 'package:all_in_one/data/models/network_error_model/network_error_model.dart';
import 'package:dartz/dartz.dart';

import '../../../models/chat_model/list_user_chat_model.dart';

abstract class ListUserChatRepository{
  Future<Either<NetworkErrorModel, ListUserChatModel>> GetListUserChatRepo({
    required int page,
    required String search,
    required String show
  });
}