import 'dart:developer';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../logic/bloc/form_bloc/work_on_site_bloc/work_on_site_bloc.dart';
import '../logic/cubit/dropdown_search_cubit/dropdown_search_cubit.dart';
import '../logic/cubit/select/select_fun_cubit.dart';
import 'constants/app_colors.dart';
import 'constants/app_font_styles.dart';
import 'global_use.dart';

class AppDropdown {
  dynamic id;
  String name;
  String? position;
  String? description;
  bool isChecked;
  AppDropdown({
      required this.id,
      required this.name,
      this.position = "",
      this.description = "",
      this.isChecked = true
  });
}

class AppSelectDropdown {
  List<dynamic>? listItem;
  int? code;
  AppSelectDropdown(
      {required this.listItem, this.code, this.getDataFormSelect});
  TextEditingController searchController = TextEditingController();
  List<dynamic> resultSearch = [];
  List<dynamic> listTmp = [];
  Function(dynamic data)? getDataFormSelect;

  Future<void> selectDropdown(BuildContext context, contextSelect) {
    for (var data in listItem!) {
      listTmp.add(data);
    }
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return BlocProvider(
          create: (context) => SelectFunCubit(),
          child: BlocConsumer<SelectFunCubit, SelectFunState>(
            listener: (searchContext, state) {},
            builder: (sContext, state) {
              if (state is SearchState) {
                listTmp = [];
                for (var element in state.resultSearch) {
                  listTmp.add(element);
                }
              }
              if (state is SelectValueState) {
                List<AppDropdown> data = [
                  AppDropdown(
                    id: state.id,
                    name: state.name,
                    position: state.position ?? "",
                  )
                ];
                getDataFormSelect!(data);
              }

              return AlertDialog(
                title: TextField(
                  controller: searchController,
                  decoration: const InputDecoration(
                    hintText: "Search...",
                    prefixIcon: Align(
                      widthFactor: 1.0,
                      heightFactor: 1.0,
                      child: Icon(
                        Icons.search,
                      ),
                    ),
                  ),
                  onChanged: (String value) {
                    sContext.read<SelectFunCubit>().search(value, listItem);
                  },
                ),
                content: SizedBox(
                    height: listTmp.length > 10
                        ? screenHeight / 1.35
                        : screenHeight / 3,
                    width: screenWidth,
                    child: listTmp.isEmpty
                        ? Center(
                            child: Text(
                              "Result Not Found",
                              style: AppTextStyle().titleM(),
                            ),
                          )
                        : ListView.builder(
                            itemCount: listTmp.length,
                            itemBuilder: (context, index) => InkWell(
                                  onTap: () {
                                    int id = listTmp[index].idTicketDetails;
                                    String name = listTmp[index].nameTranTypeCompany;
                                    // print("date3333333333333 $id - $name");
                                    AppDropdown data = AppDropdown(
                                      id: listTmp[index].idTicketDetails,
                                      name: listTmp[index].nameTranTypeCompany,
                                      position: listTmp[index].position ?? "",
                                    );
                                    getDataFormSelect!(data);
                                    BlocProvider.of<SelectFunCubit>(
                                            contextSelect)
                                        .selectValue(
                                            id: id, name: name, code: code);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5, vertical: 15),
                                    child: Text("${listTmp[index].nameTranTypeCompany}"),
                                  ),
                                ))),
              );
            },
          ),
        );
      },
    );
  }
}

class AppDropdownSearch extends StatefulWidget {
  List<dynamic>? listItem;
  String labelText;
  String isError;
  dynamic contextLeaveForm;
  dynamic contextWork;
  TextEditingController? controller;
  TextEditingController? secondController;
  dynamic? hint;
  TextEditingController? descController;
  Function()? onLoad;
  void Function(String value)? onChange;
  void Function(dynamic AppDropdown)? onSelect;
  void Function(String value)? onChangeName;
  void Function(String value,String name,String pos)? onSelectThreePosition;

  Function? onClick;
  bool cancelIcon;
  Widget? clearIcon;
  AppDropdownSearch({
      super.key,
      required this.listItem,
      this.labelText = "Select",
      this.isError = "",
      this.contextLeaveForm,
      this.controller,
      this.contextWork,
      this.secondController,
      this.hint,
      this.descController,
      this.onLoad,
      this.cancelIcon = true,
      this.onChange,
      this.onChangeName,
      this.onSelect,
      this.clearIcon,
      this.onClick,
      this.onSelectThreePosition,
  });

  @override
  State<AppDropdownSearch> createState() => _AppDropdownSearchState();
}

class _AppDropdownSearchState extends State<AppDropdownSearch> {
  final TextEditingController nController = TextEditingController();

  var selectedValue;
  bool num = true;
  final key = GlobalKey<FormFieldState>();

  reset() {
    key.currentState!.reset();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DropdownSearchCubit(),
      child: BlocConsumer<DropdownSearchCubit, DropdownSearchState>(
        listener: (context, state) {
          if (state is PickedDropdownValue) {
            widget.onLoad;
            widget.isError = "";

            if (widget.onChange != null) {
              widget.onChange!(state.value.id.toString());
            }

            if(widget.onChangeName !=null){
              widget.onChangeName!(state.value.nameTranTypeCompany);
            }

            if(widget.onSelectThreePosition !=null){
              widget.onSelectThreePosition!(state.value.id.toString(),state.value.nameTranTypeCompany,state.value.position);
            }
            widget.controller?.text = state.value.id.toString();
            if (widget.secondController != null) {
              widget.secondController!.text = state.value.nameTranTypeCompany;
            }
            // if (widget.contextLeaveForm != null) {
            //   BlocProvider.of<LeaveApplicationFormBloc>(widget.contextLeaveForm)
            //       .add(OnEventLeaveBalance(state.value.id.toString()));
            // }
            //
            // if (widget.contextWork != null) {
            //   BlocProvider.of<WorkOnSiteBloc>(widget.contextWork).add(EventGetListPlateNumber(state.value.id));
            // }

            if (widget.descController != null) {
              widget.descController!.text = state.value.description;
            }
          }
        },
        builder: (contextDropdown, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              widget.clearIcon != null
                  ? IconButton(
                      onPressed: () {
                        key.currentState!.reset();
                      },
                      icon: const Icon(Icons.close),
                    )
                  : Container(),
              SizedBox(
                //color: Colors.yellow,
                //height: 60,
                width: double.maxFinite,
                child: DropdownButtonHideUnderline(
                  child: DropdownButtonFormField2(

                    isDense: false,
                    key: key,
                    iconStyleData: IconStyleData(
                        icon: Icon(Icons.arrow_drop_down_outlined,
                            color: widget.isError.isEmpty
                                ? widget.cancelIcon
                                    ? Colors.grey.withOpacity(0.9)
                                    : AppColors().grey
                                : AppColors().primaryRed)),
                    isExpanded: true,
                    hint: widget.hint,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.5),
                      enabledBorder: border(widget.isError),
                      focusedBorder: border(widget.isError),
                      disabledBorder: border(widget.isError),
                      labelText: widget.labelText,
                      labelStyle: TextStyle(
                          color: widget.isError.isEmpty
                              ? widget.cancelIcon
                                  ? Colors.grey.withOpacity(0.9)
                                  : AppColors().grey
                              : AppColors().primaryRed),
                      contentPadding:  EdgeInsets.symmetric(
                          horizontal: 15, vertical: 2.px),
                    ),
                    items: widget.listItem
                        ?.map((item) => DropdownMenuItem(

                              value: item,
                              // child: Text( capitalizeAllWord("${item.name}" ) ),
                              child: Text(
                                  capitalizeAllWord("${item.name}"),
                                style: TextStyle(
                                  color: Colors.black.withOpacity(0.8),
                                  fontSize: 15.px,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ))
                        .toList(),
                    value: selectedValue,
                    onChanged: (value) {
                      BlocProvider.of<DropdownSearchCubit>(contextDropdown).pickValue(value);
                    },
                    dropdownStyleData: DropdownStyleData(
                      decoration: BoxDecoration(
                        // color: Colors.green
                      ),
                        maxHeight: 200,
                        // maxHeight: screenHeight / 2,
                        padding: EdgeInsets.zero
                    ),
                    menuItemStyleData: const MenuItemStyleData(
                      padding: EdgeInsets.only(left: 10),
                      height: 50,
                    ),
                    dropdownSearchData: DropdownSearchData(
                      searchController: nController,
                      searchInnerWidgetHeight: 55.px,
                      searchInnerWidget: Container(
                        // color: Colors.red,
                        height: 55.px,
                        padding: const EdgeInsets.only(
                          top: 8,
                          bottom: 4,
                          right: 8,
                          left: 8,
                        ),
                        child: TextFormField(
                          expands: true,
                          maxLines: null,
                          controller: nController,
                          decoration: InputDecoration(
                            // filled: true,
                            // fillColor: Colors.red,
                            isDense: true,
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 8,
                            ),
                            hintText: 'Search...',
                            enabledBorder: OutlineInputBorder(
                              // width: 0.0 produces a thin "hairline" border
                              borderSide:  BorderSide(color: Colors.cyan.withOpacity(0.15), width: 1),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.cyan.withOpacity(0.15), width: 1)
                            ),
                            disabledBorder: InputBorder.none,
                            focusColor: Colors.cyan,
                            border: const OutlineInputBorder(),
                            labelStyle: const TextStyle(color: Colors.green),
                          ),
                        ),
                      ),
                      searchMatchFn: (item, searchValue) {
                        var text = searchValue;
                        return item.child.toString().contains(text);
                      },
                    ),
                    //This to clear the search value when you close the menu
                    onMenuStateChange: (isOpen) {
                      if (!isOpen) {
                        nController.clear();
                      }
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              // Text(nController.text , style: textStyle(widget.isError),)
            ],
          );
        },
      ),
    );
  }

  OutlineInputBorder border(String err) {
    return OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(3)),
        borderSide: BorderSide(
            color: err.isEmpty ? Colors.cyan.withOpacity(0.2) :AppColors().primaryRed,
            width: err.isEmpty ? 1 : 1.15));
  }

  TextStyle textStyle(String err) {
    return AppTextStyle().textValidate(isError: widget.isError);
  }

  String capitalizeAllWord(String value) {
    // return value.toUpperCase();
    if (value.contains(" ")) {
      var result = value[0].toUpperCase();
      for (int i = 1; i < value.length; i++) {
        if (value[i - 1] == " ") {
          result = result + value[i].toUpperCase();
        } else {
          result = result + value[i];
        }
      }
      return result;
    } else {
      return value;
    }
  }
}
