import 'package:all_in_one/data/models/network_error_model/network_error_model.dart';
import 'package:dartz/dartz.dart';

import '../../../models/chat_model/list_user_chatting_model.dart';

abstract class ListUserChattingRepository{
  Future<Either<NetworkErrorModel, ListUserChattingModel>> getListUserChatting({
    required int id,
    required int page,
    required String search,
 });
}