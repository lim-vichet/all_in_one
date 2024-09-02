import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../data/services/main_services/base_service.dart';
import 'app_colors.dart';

class AppImages {
  static const String logo = 'assets/images/logo_app.png';
  static const String logoTT = 'assets/images/tt-logo2.png';
  static const String placeholderImage = 'assets/logo/default_product.jpg';
  static const String icon_no_data = 'assets/icons/icon _window restore.svg';
  static const String icon_coming_soon = 'assets/icons/coming-soon.png';
  static const String icon_nodata = 'assets/icons/no_data.png';

  static Widget logoImage({double? width=200,double height = 200}) => Hero(
    tag: 'imagelogo',
    child: Image.asset(
      AppImages.logo,
      width: width,
      height: height,
      fit: BoxFit.contain,
    ),
  );

  static Widget assetImage(String image,{ BoxFit? fit, double? scale,
    double? width, double? height, Color? color}) =>
      Image.asset(
        image,
        fit: fit,
        width: width,
        height: height,
        scale: scale,
        color: color,
      );
  static Widget assetSVG(String image,{ BoxFit fit = BoxFit.cover,
    double? width, double? height, Color? color}) =>
      SvgPicture.asset(
        image,
        width: width,
        height: height,
        color: color,
        fit: fit,
      );


  static Widget networkImage(String imageUrl,
      {
        bool? baseUrl = false,
        double? width,
        BoxFit? fit, double? scale, Color? color,
        double? height}) =>
      CachedNetworkImage(
        imageUrl: baseUrl!?"${BaseService().baseUrlHost}$imageUrl":imageUrl,
        width: width,
        height: height,
        color: color,
        placeholder: (context, url) => Center(
          child: SizedBox(
            width: 30.px,
            height: 30.px,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(AppColors().white),
            ),
          ),
        ),
        errorWidget: (context, url, error) => Image.asset(placeholderImage,fit: BoxFit.cover,width: double.infinity,),
        fit: fit??BoxFit.cover,
      );
}
