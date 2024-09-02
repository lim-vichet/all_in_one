import 'package:get/get.dart';
import 'english.dart';
import 'khmer.dart';

class Language extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': trEN,
        'kh_KH': trKM,
      };
}
