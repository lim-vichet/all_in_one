import 'package:all_in_one/views/widgets/loading/loading.dart';
import 'package:flutter/material.dart';
import 'package:all_in_one/utils/global_use.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../logic/bloc/test_calculate_bloc/test_calculate_bloc.dart';
import '../../../../utils/constants/app_colors.dart';
import '../../../widgets/text_field.dart';

class TestCalculateScreen extends StatefulWidget {
  const TestCalculateScreen({super.key});

  @override
  State<TestCalculateScreen> createState() => _TestCalculateScreenState();
}

class _TestCalculateScreenState extends State<TestCalculateScreen> {

  /// controller
  TextEditingController unitPriceController = TextEditingController();
  TextEditingController taxPriceController = TextEditingController();
  TextEditingController totalPriceController = TextEditingController();

  String unitPriceValue = '';
  String taxValue = '';
  double taxPrice = 0.0;
  double totalprice = 0.0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TestCalculateBloc(),
      child: Scaffold(
        backgroundColor: AppColors().bgColorApp,
        appBar: AppBar(
          backgroundColor: Colors.lightBlueAccent,
          automaticallyImplyLeading: false,
          leading: const BackButton(
            color: Colors.white,
          ),
          title: Text("Test Calculate in Bloc Partern", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
        ),

        body: Container(
          width: screenWidth,
          height: screenHeight,
          margin: EdgeInsets.all(15),
          decoration: BoxDecoration(
            // color: Colors.pink,
            borderRadius: BorderRadius.circular(10),
          ),
          child: BlocConsumer<TestCalculateBloc, TestCalculateState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              if(state is TestCalculateError){
                return LoadingScreen();
              }
              else if(state is TestCalculateLoading){
                return LoadingScreen();
              }
              else if(state is TestCalculateSuccess){
                  totalprice = state.totalPrice;
                  taxPrice = state.taxPrice;
                  // totalPriceController.text = state.totalPrice.toString();
                  totalPriceController.text = state.taxPrice.toString();
              }
              return Column(
                children: [
                  // SizedBox(height: 50,),

                  AppTextInput(
                    keyDisable: true,
                    hint: "Unit Price",
                    controller: unitPriceController,
                    onChange: (value) {
                      unitPriceValue = value;
                      context.read<TestCalculateBloc>().add(EventTestCalculate(unitPrice: unitPriceValue, taxValue: taxValue));
                    },
                    maxLine: 1,
                  ),
                  SizedBox(
                    height: 10.px,
                  ),
                  AppTextInput(
                    keyDisable: true,
                    hint: 'Tax Price'.tr,
                    controller: taxPriceController,
                    onChange: (value) {
                      taxValue = value;
                      context.read<TestCalculateBloc>().add(EventTestCalculate(unitPrice: unitPriceValue, taxValue: taxValue));
                    },
                    maxLine: 1,

                  ),
                  SizedBox(
                    height: 10.px,
                  ),
                  AppTextInput(
                    hintText: "Total Price".tr,
                    controller: totalPriceController,
                    maxLine: 1,
                    readOnly: true,
                    // isError: byError,
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
