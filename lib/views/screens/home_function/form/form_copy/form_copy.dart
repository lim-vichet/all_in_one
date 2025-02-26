import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:cross_file/cross_file.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:select_searchable_list/select_searchable_list.dart';

import '../../../../../data/models/form_model/form_copy/get_list_user_assige_model.dart';
import '../../../../../data/models/form_model/form_copy/plate_number_model.dart';
import '../../../../../data/models/form_model/form_copy/ticket_model.dart';
import '../../../../../data/models/form_model/form_copy/user_name_model.dart';
import '../../../../../data/models/form_model/form_copy/vehicle_model.dart';
import '../../../../../data/models/upload_model/upload_model.dart';
import '../../../../../logic/bloc/form_bloc/work_on_site_bloc/work_on_site_bloc.dart';
import '../../../../../logic/bloc/upload/upload_bloc.dart';
import '../../../../../routes/config_router.dart';
import '../../../../../utils/app_bars/main_app_bar.dart';
import '../../../../../utils/constants/app_button.dart';
import '../../../../../utils/constants/app_colors.dart';
import '../../../../../utils/constants/app_dialog.dart';
import '../../../../../utils/constants/app_dimensions.dart';
import '../../../../../utils/constants/app_time_picker_bottomsheet.dart';
import '../../../../../utils/constants/bottom_snack_bar.dart';
import '../../../../../utils/constants/main_app_validation.dart';
import '../../../../../utils/constants/url_path.dart';
import '../../../../../utils/dropdown_global.dart';
import '../../../../../utils/global_use.dart';
import '../../../../widgets/error_screen.dart';
import '../../../../widgets/file_attachment_widget.dart';
import '../../../../widgets/loading/loading.dart';
import '../../../../widgets/text_field.dart';

class FormCopy extends StatefulWidget {
  const FormCopy({super.key});

  @override
  State<FormCopy> createState() => _FormCopyState();
}

class _FormCopyState extends State<FormCopy> {

  /// declare controller
  TextEditingController purposeController = TextEditingController();
  TextEditingController fromDateController = TextEditingController();
  TextEditingController fromTimeController = TextEditingController();
  TextEditingController toDateController = TextEditingController();
  TextEditingController toTimeController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController referenceController = TextEditingController();
  TextEditingController approveController = TextEditingController();
  TextEditingController transportationController = TextEditingController();
  TextEditingController transportationTypeCompanyController = TextEditingController();
  TextEditingController transportationTypeOwnerController = TextEditingController();
  TextEditingController plateController = TextEditingController();
  TextEditingController ticketController = TextEditingController();
  TextEditingController plateNameController = TextEditingController();
  TextEditingController nullController = TextEditingController();

  /// variable for validate
  String fieldPurpose = "";
  String fieldFromDate = "";
  String fieldFromTime = "";
  String fieldToDate = "";
  String fieldToTime = "";
  String fieldLocation = "";
  String fieldDesc = "";
  String fieldPlateNumber = "";
  String fieldApprove = "";
  String fieldTransportation = "";
  String fieldTransportationTypeCompany = "";
  String fieldTransportationTypeOwner = "";
  String fieldPlate = "";
  String fieldTicket = "";

  /// variable  approve by
  List<ResultUserAssign> listUserApproved = [];
  List<AppDropdown> listUserName = [];
  late Map<dynamic, dynamic> listUserApproveBy = {};
  String fieldAssignTo = "";
  String approveByName = '';

  /// variable transportation
  List<Transportation> listTransportation = [Transportation(id: "ផ្ទាល់ខ្លួន", name: "ផ្ទាល់ខ្លួន"), Transportation(id: "ក្រុមហ៊ុន", name: "ក្រុមហ៊ុន")];
  final Map<dynamic, dynamic> listTransportationMap = {'ផ្ទាល់ខ្លួន': 'ផ្ទាល់ខ្លួន', 'ក្រុមហ៊ុន': 'ក្រុមហ៊ុន'};
  String transportationName = '';

  /// variable transportation type company
  List<ResultVehicle> listTransportationsTypeCompany = [];
  List<AppDropdown> listTransportationTypeCompany = [];
  late Map<dynamic, dynamic> listTransportationTypeCompanyMap = {};
  int transportationTypeIdCompany = 1;
  String transportationTypeNameCompany = '';

  /// variable transportation type owner
  List<AppDropdown> listTransportationTypeOwner = [
    AppDropdown(id: 1, name: "ម៉ូតូ"),
    AppDropdown(id: 2, name: "ឡាន"),
  ];
  List<AppDropdown> listTransportationTypeOwnerAdd = [];
  late Map<dynamic, dynamic> listTransportationTypeOwnerMap = {};
  String transportationTypeNameOwner = '';

  /// variable plate number
  List<ResultPlateNumber> listPlateNumbers = [];
  late Map<dynamic, dynamic> ListPlateNumberMap = {};
  List<AppDropdown> listPlateNumber = [];
  String platNumberName = '';

  ///  variable ticket
  List<ResultTicket> listTickets = [];
  List<AppDropdown> listTicket = [];
  late Map<dynamic, dynamic> ListTicketMap = {};
  String ticketName = '';

  /// variable upload  image
  List<ResultFile> listResultFile = [];
  List<File> listShowImages = [];
  List<File> selectedImages = [];
  List<XFile> listImage = [];
  String? fileName;
  String? pathFile;
  String? type;
  String? name;
  String? extension;
  String? path;

  /// variable for hin text
  String fromDate = UrlPath().fromDate;
  String toDate = UrlPath().toDate;
  String fromTime = UrlPath().fromTime;
  String toTime = UrlPath().toTime;
  String fromTimeHour = "";
  String toTimeHour = "";

  /// variable
  bool isHide = false;
  String currentDate = DateFormat('dd-MM-yyyy').format(DateTime.now());

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    clearText();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isHide = true;
  }

  /// function dropdown transportation type owner list static
  DropdownTransportationTypeOwner() {
    /// note  for dropdown when user select owner it static list
    /// loop add data to dropdown owner static
    for (var element in listTransportationTypeOwner) {
      listTransportationTypeOwnerAdd.add(AppDropdown(id: element.id, name: element.name));
    }

    /// loop add data to dropdown bottom sheet owner
    for (var item in listTransportationTypeOwnerAdd) {
      final Map<int, String> listTransportationTypeOwner = {item.id: item.name};
      listTransportationTypeOwnerMap.addAll(listTransportationTypeOwner);
    }
  }

  bool checkRequire = false;
  String transportationTypeOwnerName = '';
  String transportationTypeCompanyName = '';

  @override
  Widget build(BuildContext context) {

    // return Container(
    //   width: 100,
    //   height: 100,
    //   color: Colors.pink,
    // );

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => WorkOnSiteBloc()..add(EventGetListUsersApproved()),
        ),
        BlocProvider(
          create: (context) => UploadBloc(),
        ),
      ],
      child: Scaffold(
        backgroundColor: AppColors().bgColorApp,
        body: SizedBox(
          width: double.infinity,
          height: 900,
          child: mainAppBar(
            backClick: () {
              Navigator.pop(context);
            },
            appBarTitle: "Form Copy",
            child: Container(
              width: screenWidth,
              height: screenHeight,
              decoration: BoxDecoration(
                color: AppColors().bgColorApp,
                // color: AppColors().primaryRed,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              child: BlocConsumer<WorkOnSiteBloc, WorkOnSiteState>(
                listener: (contextWork, state) async {
                  if (state is LoadingInsertWorkOnSite) {
                    AppDialog.loadingDialog(context);
                  } else if (state is FailInsertWorkOnSite) {
                    AppSnackBar.showBottomSnackBarError(context: context, message: messageError);
                  } else if (state is GetListUserApprovedBySuccess) {
                    /// get list user approved success
                    listUserApproved = state.userAssign;

                    /// loop add data to dropdown
                    for (var element in state.userAssign) {
                      listUserName.add(AppDropdown(id: element.maUserId, name: "${element.firstNameEn} ${element.lastNameEn}"));
                    }

                    /// loop add data to dropdown bottom sheet
                    for (var item in listUserApproved) {
                      final Map<int, String> listUserApprove = {item.maUserId: "${item.firstNameEn} ${item.lastNameEn}"};
                      listUserApproveBy.addAll(listUserApprove);
                    }

                    /// get data transportation type
                    BlocProvider.of<WorkOnSiteBloc>(contextWork).add(EventGetListTransportationType());
                  } else if (state is GetListTransportationTypeSuccess) {
                    /// get list transportation type success company
                    listTransportationsTypeCompany = state.data.result;

                    /// loop add data to dropdown company
                    for (var element in state.data.result) {
                      listTransportationTypeCompany.add(AppDropdown(id: element.id, name: element.vehicleTypeName));
                    }

                    /// loop add data to dropdown bottom sheet company
                    for (var item in listTransportationsTypeCompany) {
                      final Map<int, String> listTransportationType = {item.id: item.vehicleTypeName};
                      listTransportationTypeCompanyMap.addAll(listTransportationType);
                    }

                    /// note call function dropdown transportation typ owner when user select type owner
                    DropdownTransportationTypeOwner();

                    /// get data ticket
                    BlocProvider.of<WorkOnSiteBloc>(contextWork).add(EventGetListTicket());
                  } else if (state is GetListTicketSuccess) {
                    /// get list ticket success
                    listTickets = state.data.result;

                    /// loop add data to dropdown
                    for (var element in state.data.result) {
                      listTicket.add(AppDropdown(id: element.ticketNumber, name: element.ticketNumber.toString()));
                    }

                    /// loop add data to dropdown bottom sheet
                    for (var item in listTickets) {
                      final Map<dynamic, dynamic> listTicket = {item.ticketNumber: item.ticketNumber.toString()};
                      ListTicketMap.addAll(listTicket);
                    }
                  } else if (state is GetListPlateNumberSuccess) {
                    /// get list plate number success
                    listPlateNumbers = state.data.result;

                    /// loop add data to dropdown
                    for (var element in state.data.result) {
                      listPlateNumber.add(AppDropdown(id: element.id, name: element.vehiclePlateNumber));
                    }

                    /// loop add data to dropdown bottom sheet
                    for (var item in listPlateNumbers) {
                      final Map<int, String> listPlateNumber = {item.id: item.vehiclePlateNumber};
                      ListPlateNumberMap.addAll(listPlateNumber);
                    }

                    /// set text to empty
                    fieldTransportationTypeCompany = "";
                    if (purposeController.text.isNotEmpty) fieldPurpose = "";
                    if (approveController.text.isNotEmpty) fieldApprove = "";
                    if (fromDateController.text.isNotEmpty) fieldFromDate = "";
                    if (toDateController.text.isNotEmpty) fieldToDate = "";
                    if (fromTimeController.text.isNotEmpty) fieldFromTime = "";
                    if (toTimeController.text.isNotEmpty) fieldToTime = "";
                    if (descController.text.isNotEmpty) fieldDesc = "";
                    if (locationController.text.isNotEmpty) fieldLocation = "";
                    if (transportationController.text.isNotEmpty) fieldTransportation = "";
                    if (plateController.text.isNotEmpty) fieldPlate = "";
                    if (ticketController.text.isNotEmpty) fieldTicket = "";
                    if (transportationTypeOwnerController.text.isNotEmpty) fieldTransportationTypeOwner = "";
                    if (transportationTypeCompanyController.text.isNotEmpty) fieldTransportationTypeCompany = "";
                  } else if (state is GetNameTransportationTypeOwnerSuccess) {
                    transportationTypeNameOwner = state.nameTransportationTypeOwner;
                  } else if (state is GetIdAndNameTransportationTypeCompanySuccess) {
                    transportationTypeIdCompany = state.id;
                    transportationTypeNameCompany = state.nameTranTypeCompany;

                    /// get list plate number
                    BlocProvider.of<WorkOnSiteBloc>(contextWork).add(EventGetListPlateNumber(transportationTypeIdCompany));
                  } else if (state is WorkOnSiteValidate) {
                    fieldPurpose = state.fieldPurpose;
                    fieldFromDate = state.fieldFromDate;
                    fieldFromTime = state.fieldFromTime;
                    fieldToDate = state.fieldToDate;
                    fieldToTime = state.fieldToTime;
                    fieldDesc = state.fieldDesc;
                    fieldLocation = state.fieldLocation;
                    fieldTransportation = state.fieldTransportation;
                    fieldTransportationTypeOwner = state.fieldTransportationTypeOwner;
                    fieldPlate = state.fieldPlateNumber;
                    fieldApprove = state.fieldApprove;
                    if (fieldFromDate == MainValidation().dateFromSmallThanDateTo()) AppDialog.alertDateFromSmallerThanDateTo(context, text: fieldFromDate);
                    if (fieldFromTime == MainValidation().fromTimeSmallerThanToTime()) AppDialog.alertDateFromSmallerThanDateTo(context, text: fieldFromTime);
                  } else if (state is WorkOnSiteSuccess) {
                    Navigator.pop(context);
                    AppSnackBar.showBottomSnackBarSuccess(context: context, message: messageSuccess);
                    await Future.delayed(const Duration(seconds: 3), () {
                      Navigator.pop(context);
                      // ConfigRouter.pushPage(context, MyRequestScreen());
                    });
                    // clearText();
                  } else if (state is IsHideAndShowPlateNumberSuccess) {
                    if (transportationController.text == "ផ្ទាល់ខ្លួន" || transportationName == "") {
                      setState(() {
                        listPlateNumber = [];
                        isHide = true;
                      });
                    } else {
                      setState(() {
                        isHide = false;
                      });
                    }
                    if (purposeController.text.isNotEmpty) fieldPurpose = "";
                    if (approveController.text.isNotEmpty) fieldApprove = "";
                    if (fromDateController.text.isNotEmpty) fieldFromDate = "";
                    if (toDateController.text.isNotEmpty) fieldToDate = "";
                    if (fromTimeController.text.isNotEmpty) fieldFromTime = "";
                    if (toTimeController.text.isNotEmpty) fieldToTime = "";
                    if (descController.text.isNotEmpty) fieldDesc = "";
                    if (locationController.text.isNotEmpty) fieldLocation = "";
                    if (transportationController.text.isNotEmpty) fieldTransportation = "";
                    if (plateController.text.isNotEmpty) fieldPlate = "";
                    if (ticketController.text.isNotEmpty) fieldTicket = "";
                    if (transportationTypeOwnerController.text.isNotEmpty) fieldTransportationTypeOwner = "";
                    if (transportationTypeCompanyController.text.isNotEmpty) fieldTransportationTypeCompany = "";
                  }
                },
                builder: (contextWork, state) {
                  if (state is WorkOnSiteLoading) {
                    return const LoadingScreen();
                  } else if (state is WorkOnSiteError) {
                    return const ErrorScreen();
                  }
                  return BlocConsumer<UploadBloc, UploadState>(
                    listener: (uploadContext, state) {
                      if (state is UploadSuccessState) {
                        /// set text to empty
                        setTextToEmpty();

                        /// upload image success  has image
                        listResultFile = state.data.result;
                        print("listResultFile${jsonEncode(listResultFile)}");
                        if (transportationName == "ផ្ទាល់ខ្លួន") {
                          contextWork.read<WorkOnSiteBloc>().add(EventValidateAndAddFormWorkOnSite(
                            purposeValue: purposeController.text,
                            valueApprove: approveByName,
                            fromDateValue: fromDateController.text,
                            fromTimeValue: fromTimeController.text,
                            toDateValue: toDateController.text,
                            toTimeValue: toTimeController.text,
                            descValue: descController.text,
                            locationValue: locationController.text,
                            valueTransportation: transportationName,
                            valueTransportationType: transportationTypeNameOwner,
                            ticket: ticketName,
                            listResultFile: listResultFile,
                            selectPlateNumber: platNumberName,
                          ));

                          print("listResultFile===========${jsonEncode(listResultFile)}");
                        }
                        else {
                          contextWork.read<WorkOnSiteBloc>().add(EventValidateAndAddFormWorkOnSite(
                            purposeValue: purposeController.text,
                            valueApprove: approveByName,
                            fromDateValue: fromDateController.text,
                            fromTimeValue: fromTimeController.text,
                            toDateValue: toDateController.text,
                            toTimeValue: toTimeController.text,
                            descValue: descController.text,
                            locationValue: locationController.text,
                            valueTransportation: transportationName,
                            ticket: ticketName,
                            valueTransportationType: transportationTypeNameCompany,
                            vehicle: transportationTypeIdCompany.toString(),
                            listResultFile: listResultFile,
                            selectPlateNumber: platNumberName,
                          ));
                          print("listResultFile2===========${jsonEncode(listResultFile)}");
                        }
                      }
                      else if (state is EmptyListImg) {
                        /// set text to empty
                        setTextToEmpty();
                        listResultFile = [];

                        /// upload image success  has image
                        if (transportationName == "ផ្ទាល់ខ្លួន") {
                          contextWork.read<WorkOnSiteBloc>().add(EventValidateAndAddFormWorkOnSite(
                            purposeValue: purposeController.text,
                            valueApprove: approveByName,
                            fromDateValue: fromDateController.text,
                            fromTimeValue: fromTimeController.text,
                            toDateValue: toDateController.text,
                            toTimeValue: toTimeController.text,
                            descValue: descController.text,
                            locationValue: locationController.text,
                            valueTransportation: transportationName,
                            valueTransportationType: transportationTypeNameOwner,
                            ticket: ticketName,
                            listResultFile: listResultFile,
                            // selectPlateNumber: platNumberName,
                          ));
                        }
                        else {
                          contextWork.read<WorkOnSiteBloc>().add(EventValidateAndAddFormWorkOnSite(
                            purposeValue: purposeController.text,
                            valueApprove: approveByName,
                            fromDateValue: fromDateController.text,
                            fromTimeValue: fromTimeController.text,
                            toDateValue: toDateController.text,
                            toTimeValue: toTimeController.text,
                            descValue: descController.text,
                            locationValue: locationController.text,
                            valueTransportation: transportationName,
                            valueTransportationType: transportationTypeNameCompany,
                            vehicle: transportationTypeIdCompany.toString(),
                            ticket: ticketName,
                            listResultFile: listResultFile,
                            selectPlateNumber: platNumberName,
                          ));

                        }
                      }
                    },
                    builder: (uploadContext, state) {
                      if (state is UploadLoadingState) {
                        // return const LoadingScreen();
                      } else if (state is UploadErrorState) {
                        return const ErrorScreen();
                      } else if (state is TmpListImg) {
                        listShowImages = state.listImage;
                      } else if (state is RemoveImg) {
                        listShowImages = state.listImage;
                      }
                      return Padding(
                        padding: EdgeInsets.only(
                          left: AppDimension().bodySpace,
                          right: AppDimension().bodySpace,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            /// text input
                            Expanded(
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.only(
                                            top: 20,
                                            bottom: 10
                                        ),
                                        child: AppTextInput(
                                          hint: "Purpose".tr,
                                          controller: purposeController,
                                          isError: fieldPurpose,
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(bottom: 15),
                                        child: DropDownTextField(
                                          textEditingController: approveController,
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.normal,
                                          ),
                                          hint: 'Approved By'.tr,
                                          title: 'Approved By'.tr,
                                          options: listUserApproveBy,
                                          isError: fieldApprove,
                                          decoration: InputDecoration(
                                            contentPadding: EdgeInsets.only(left: 15, bottom: 5),
                                            filled: true,
                                            fillColor: Colors.white.withOpacity(0.5),
                                            labelText: "Approved By".tr,
                                            labelStyle: TextStyle(color: approveByName.isEmpty && checkRequire ? AppColors().primaryRed : Colors.grey.withOpacity(0.5)),
                                            floatingLabelBehavior: FloatingLabelBehavior.auto,
                                            hintStyle: TextStyle(color: Colors.blue),
                                            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: approveByName.isEmpty && checkRequire ? AppColors().primaryRed : Colors.cyan.withOpacity(0.2), width: 1)),
                                            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: approveByName.isEmpty && checkRequire ? AppColors().primaryRed : Colors.cyan.withOpacity(0.2), width: 1)),
                                            suffixIcon: Icon(Icons.arrow_drop_down),
                                          ),
                                          onChanged: (approveBy) {
                                            setState(() {
                                              approveByName = "${approveBy![0]}";
                                            });
                                          },
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(bottom: 10),
                                        child: AppDatePicker(
                                          hint: UrlPath().fromDate,
                                          isError: fieldFromDate,
                                          controller: fromDateController,
                                          // suffixIcon: const Icon(Icons.date_range),
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(bottom: 10),
                                        child: AppTimePickerBS(
                                          hint: UrlPath().fromTime,
                                          controller: fromTimeController,
                                          isError: fieldFromTime,
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(bottom: 10),
                                        child: AppDatePicker(
                                          hint: UrlPath().toDate,
                                          isError: fieldToDate,
                                          controller: toDateController,
                                          // suffixIcon: const Icon(Icons.access_time),
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(bottom: 10),
                                        child: AppTimePickerBS(
                                          hint: UrlPath().toTime,
                                          controller: toTimeController,
                                          isError: fieldToTime,
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(bottom: 10),
                                        child: AppTextInput(
                                          hint: "Description".tr,
                                          controller: descController,
                                          isError: fieldDesc,
                                          maxLine: 4,
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(bottom: 10),
                                        child: AppTextInput(
                                          hint: "Location".tr,
                                          controller: locationController,
                                          isError: fieldLocation,
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(bottom: 15),
                                        child: DropDownTextField(
                                          textEditingController: transportationController,
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.normal,
                                          ),
                                          hint: 'Transportation'.tr,
                                          title: 'Transportation'.tr,
                                          options: listTransportationMap,
                                          isError: fieldTransportation,
                                          decoration: InputDecoration(
                                            contentPadding: EdgeInsets.only(left: 15, bottom: 5),
                                            filled: true,
                                            fillColor: Colors.white.withOpacity(0.5),
                                            labelText: "Transportation".tr,
                                            labelStyle: TextStyle(color: fieldTransportation.isEmpty ? Colors.grey.withOpacity(0.5) : AppColors().primaryRed),
                                            floatingLabelBehavior: FloatingLabelBehavior.auto,
                                            hintStyle: TextStyle(
                                              color: Colors.grey.withOpacity(0.5),
                                            ),
                                            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: fieldTransportation.isEmpty ? Colors.cyan.withOpacity(0.2) : Colors.cyan.withOpacity(0.2), width: 1)),
                                            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: fieldTransportation.isEmpty ? Colors.cyan.withOpacity(0.2) : Colors.red, width: 1)),
                                            suffixIcon: Icon(Icons.arrow_drop_down),
                                          ),
                                          onChanged: (transportation) {
                                            transportationName = "${transportation![0]}";
                                            contextWork.read<WorkOnSiteBloc>().add(EventChangeIsHideAndShowPlateNumber(value: transportationName));
                                          },
                                        ),
                                      ),
                                      Builder(builder: (context) {
                                        if (isHide) {
                                          /// transportation type owner
                                          return Container(
                                            padding: EdgeInsets.only(bottom: 15),
                                            child: DropDownTextField(
                                              textEditingController: transportationTypeOwnerController,
                                              style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.normal,
                                              ),
                                              hint: 'Transportation_Type'.tr,
                                              title: 'Transportation_Type'.tr,
                                              options: listTransportationTypeOwnerMap,
                                              isError: fieldTransportationTypeOwner,
                                              decoration: InputDecoration(
                                                contentPadding: EdgeInsets.only(left: 15, bottom: 5),
                                                filled: true,
                                                fillColor: Colors.white.withOpacity(0.5),
                                                labelText: "Transportation_Type".tr,
                                                labelStyle: TextStyle(color: transportationTypeOwnerName.isEmpty && checkRequire ? AppColors().primaryRed : Colors.grey.withOpacity(0.5)),
                                                floatingLabelBehavior: FloatingLabelBehavior.auto,
                                                hintStyle: TextStyle(
                                                  color: Colors.grey.withOpacity(0.5),
                                                ),
                                                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: fieldTransportationTypeOwner.isEmpty ? Colors.cyan.withOpacity(0.2) : Colors.cyan.withOpacity(0.2), width: 1)),
                                                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: fieldTransportationTypeOwner.isEmpty ? Colors.cyan.withOpacity(0.2) : Colors.red, width: 1)),
                                                suffixIcon: Icon(Icons.arrow_drop_down),
                                              ),
                                              onChanged: (transportationTypeOwner) {
                                                setState(() {
                                                  transportationTypeOwnerName = "${transportationTypeOwner![0]}";
                                                });
                                                var id = "${transportationTypeOwner![0]}";
                                                contextWork.read<WorkOnSiteBloc>().add(EventGetNameTransportationTypeOwner(id: int.parse(id), listTransportationTypeOwner: listTransportationTypeOwner));
                                              },
                                            ),
                                          );
                                        } else {
                                          /// transportation type company
                                          return Container(
                                            padding: EdgeInsets.only(bottom: 15),
                                            child: DropDownTextField(
                                              textEditingController: transportationTypeCompanyController,
                                              style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.normal,
                                              ),
                                              hint: 'Transportation_Type'.tr,
                                              title: 'Transportation_Type'.tr,
                                              options: listTransportationTypeCompanyMap,
                                              isError: fieldTransportationTypeCompany,
                                              decoration: InputDecoration(
                                                contentPadding: EdgeInsets.only(left: 15, bottom: 5),
                                                filled: true,
                                                fillColor: Colors.white.withOpacity(0.5),
                                                labelText: "Transportation_Type".tr,
                                                labelStyle: TextStyle(color: transportationTypeCompanyName.isEmpty && checkRequire ? AppColors().primaryRed : Colors.grey.withOpacity(0.5)),
                                                floatingLabelBehavior: FloatingLabelBehavior.auto,
                                                hintStyle: TextStyle(
                                                  color: Colors.grey.withOpacity(0.5),
                                                ),
                                                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: fieldTransportationTypeCompany.isEmpty ? Colors.cyan.withOpacity(0.2) : Colors.cyan.withOpacity(0.2), width: 1)),
                                                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: fieldTransportationTypeCompany.isEmpty ? Colors.cyan.withOpacity(0.2) : Colors.red, width: 1)),
                                                suffixIcon: Icon(Icons.arrow_drop_down),
                                              ),
                                              onChanged: (transportationTypeCompany) {
                                                setState(() {
                                                  transportationTypeCompanyName = "${transportationTypeCompany![0]}";
                                                });
                                                var transportationTypeId = "${transportationTypeCompany![0]}";

                                                /// get id and name transportation typ company
                                                contextWork.read<WorkOnSiteBloc>().add(EventGetIdAndNameTransportationTypeCompany(id: int.parse(transportationTypeId), listTransportation: listTransportationsTypeCompany));
                                              },
                                            ),
                                          );
                                        }
                                      }),
                                      Builder(builder: (context) {
                                        if (!isHide) {
                                          return Container(
                                            padding: EdgeInsets.only(bottom: 15),
                                            child: DropDownTextField(
                                              textEditingController: plateNameController,
                                              style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.normal,
                                              ),
                                              hint: 'Plate_Number'.tr,
                                              title: 'Plate_Number'.tr,
                                              options: ListPlateNumberMap,
                                              isError: fieldPlateNumber,
                                              decoration: InputDecoration(
                                                contentPadding: EdgeInsets.only(left: 15, bottom: 5),
                                                filled: true,
                                                fillColor: Colors.white.withOpacity(0.5),
                                                labelText: "Plate_Number".tr,
                                                labelStyle: TextStyle(color: fieldTransportation.isEmpty ? Colors.grey.withOpacity(0.5) : AppColors().primaryRed),
                                                floatingLabelBehavior: FloatingLabelBehavior.auto,
                                                hintStyle: TextStyle(
                                                  color: Colors.grey.withOpacity(0.5),
                                                ),
                                                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: fieldTransportation.isEmpty ? Colors.cyan.withOpacity(0.2) : Colors.cyan.withOpacity(0.2), width: 1)),
                                                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: fieldTransportation.isEmpty ? Colors.cyan.withOpacity(0.2) : Colors.red, width: 1)),
                                                suffixIcon: Icon(Icons.arrow_drop_down),
                                              ),
                                              onChanged: (platNumber) {
                                                platNumberName = "${platNumber![0]}";
                                              },
                                            ),
                                          );
                                        } else {
                                          return SizedBox.shrink();
                                        }
                                      }),
                                      Container(
                                        padding: EdgeInsets.only(bottom: 15),
                                        child: DropDownTextField(
                                          textEditingController: ticketController,
                                          style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.normal,
                                          ),
                                          hint: 'Ticket Number'.tr,
                                          title: 'Ticket Number'.tr,
                                          options: ListTicketMap,
                                          isError: fieldTicket,
                                          decoration: InputDecoration(
                                            contentPadding: EdgeInsets.only(left: 15, bottom: 5),
                                            filled: true,
                                            fillColor: Colors.white.withOpacity(0.5),
                                            labelText: "Ticket Number".tr,
                                            labelStyle: TextStyle(color: fieldTicket.isEmpty ? Colors.grey.withOpacity(0.5) : AppColors().primaryRed),
                                            floatingLabelBehavior: FloatingLabelBehavior.auto,
                                            hintStyle: TextStyle(
                                              color: Colors.grey.withOpacity(0.5),
                                            ),
                                            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: fieldTicket.isEmpty ? Colors.cyan.withOpacity(0.2) : Colors.cyan.withOpacity(0.2), width: 1)),
                                            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: fieldTicket.isEmpty ? Colors.cyan.withOpacity(0.2) : Colors.red, width: 1)),
                                            suffixIcon: Icon(Icons.arrow_drop_down),
                                          ),
                                          onChanged: (ticketNumber) {
                                            ticketName = "${ticketNumber![0]}";
                                          },
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(bottom: 5),
                                        child: FileAttachmentWidgets(
                                          isText: false,
                                          getListImage: (List<XFile> list) {
                                            listImage = list;
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                )),
                            /// button save
                            AppButton(
                              onPressed: () {
                                BlocProvider.of<UploadBloc>(uploadContext).add(OnEventXFile(listImage));
                                setState(() {
                                  checkRequire = true;
                                });
                              },
                              text: 'Save'.tr,
                            ),
                            SizedBox(height: 15)
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }


  /// function clear text
  void clearText() {
    purposeController.clear();
    approveController.clear();
    fromDateController.clear();
    fromTimeController.clear();
    toDateController.clear();
    toTimeController.clear();
    descController.clear();
    locationController.clear();
    transportationController.clear();
    transportationTypeCompanyController.clear();
    plateNameController.clear();
    ticketController.clear();
    listImage.clear();
    approveController.clear();
    transportationController.clear();
    plateController.clear();
    ticketController.clear();
  }

  /// function set text to empty
  void setTextToEmpty() {
    fieldTransportationTypeCompany = "";
    fieldPurpose = "";
    fieldApprove = "";
    fieldFromDate = "";
    fieldToDate = "";
    fieldFromTime = "";
    fieldToTime = "";
    fieldDesc = "";
    fieldLocation = "";
    fieldTransportation = "";
    fieldPlate = "";
    fieldTicket = "";
  }

  Widget height() {
    return const SizedBox(
      height: 20,
    );
  }
}
