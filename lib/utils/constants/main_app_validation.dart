import '../global_use.dart';

class MainValidation {

  String requiredMessage(){
    if( lan == "en" ) return "This field is required!.";
    if( lan == "kh" ) return "ប្រអប់នេះត្រូវតែបំពេញ!.";
    return detailsMsg();
  }
  String validate(String message){
    if( lan == "en" ) return "The field $message is required!.";
    if( lan == "kh" ) return "ប្រអប់$messageមិនអាចទទេបានទេ។!.";
    return detailsMsg();
  }

  String validEmail(){
    if( lan == "en" )  return "Invalid Email";
    if( lan == "kh" ) return "ទម្រង់អ៊ីមែលមិនត្រឹមត្រូវ.";
    return detailsMsg();
  }

  String phoneNumberMustBe9(){
    if( lan == "en" ) return "The field phone number can not smaller then 9 0r bigger than 10 !";
    if( lan == "kh" ) return "លេខទូរស័ព្ទរបស់វាលត្រូវតែ9ខ្ទង់!.";
    return detailsMsg();
  }
  String phoneNumber10(){
    if( lan == "en" ) return "The field phone number can not bigger then be 9 0r 10!.";
    if( lan == "kh" ) return "លេខទូរស័ព្ទរបស់វាលត្រូវតែ9 រឺ 10ខ្ទង់!.";
    return detailsMsg();
  }

  String validatePassword(){
    if( lan == "en" ) return "The field password must be at least 8 characters contain at least one number one lowercase and uppercase letter and one special characters.!";
    if( lan == "kh" ) return "រអប់ពាក្យសម្ងាត់ត្រូវតែមានយ៉ាងហោចណាស់ 8 តួអក្សរដែលមានយ៉ាងហោចណាស់លេខមួយ អក្សរតូច និងអក្សរធំ និងតួអក្សរពិសេសមួយ។";
    return detailsMsg();
  }

  String passwordNotMatch(){
    if( lan == "en" ) return "The field password not match confirm password!.";
    if( lan == "kh" ) return "ពាក្យសម្ងាត់មិនដូចគ្នា";
    return detailsMsg();
  }

  String validFromTime(){
    if( lan == "en" )  return "(From Time) must be smaller than current hour";
    if( lan == "kh" ) return "(ចាប់ពីម៉ោង) ត្រូវតែតូចជាងម៉ោងបច្ចុប្បន្ន";
    return detailsMsg();
  }
  String validToTime(){
    if( lan == "en" )  return "(To Time) must be Bigger than current hour";
    if( lan == "kh" ) return "(ទៅម៉ោង) ត្រូវតែធំជាងម៉ោងបច្ចុប្បន្ន";
    return detailsMsg();
  }

  String mustBeGreaterThanCurrentTime(){
    if( lan == "en" )  return "This field must be greater than current time!";
    if( lan == "kh" ) return "ត្រូវតែធំជាងម៉ោងបច្ចុប្បន្ន!";
    return detailsMsg();
  }
  String fromTimeSmallerThanToTime(){
    if( lan == "en" )  return "(From Time) must be smaller than (To Time)";
    if( lan == "kh" ) return "(ចាប់ពីម៉ោង) ត្រូវតែតូចជាង (ទៅម់ោង)";
    return detailsMsg();
  }
  String fourCharacter() {
    if( lan == "en" )  return "The field contain at least 4 characters.";
    if( lan == "kh" ) return "ត្រូវមានយ៉ាងហោចណាស់ 4 តួអក្សរ";
    return detailsMsg();
  }

  String detailsMsg()  {
    return "go to path libs/utils/constants/main_app_validation.dart and check in";
  }

  String dateFromSmallThanDateTo(){
    if( lan == "en" ) return "(Date From) must be small than date to or equal! (Date To)";
    if( lan == "kh" ) return "(ចាប់ពីថ្ងៃ) ត្រូវតែតូចជាង ឬស្មើ (ទៅថ្ងៃ)!";
    return detailsMsg();
  }

}