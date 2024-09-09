import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../logic/cubit/dot_indicator_cubit/dot_indicator_cubit.dart';
import '../../utils/constants/app_colors.dart';

class BannerSlider extends StatelessWidget {
  var listBanner;

   List<String> listBannerImage = [
    "https://d1csarkz8obe9u.cloudfront.net/posterpreviews/food-menu-promotion-banner-2x6-design-template-829dd4c0a9901048bf81549ea076baa7_screen.jpg?ts=1633750162",
    "https://d1csarkz8obe9u.cloudfront.net/posterpreviews/food-offer-banner-design-template-ef081783b8a58d80662aae948311ef45_screen.jpg?ts=1615117868",
    "https://www.shutterstock.com/image-vector/banner-template-burger-restaurant-260nw-1708635589.jpg",
    "https://fiverr-res.cloudinary.com/images/t_main1,q_auto,f_auto,q_auto,f_auto/gigs/359597152/original/714951ac39e1251552fa8ba233d55f7d3c3a1341/design-food-drink-product-banner-and-restaurant-banners.png",
    "https://img.freepik.com/free-vector/flat-design-food-sale-banner-with-special-offer_23-2149113276.jpg",
  ];
  BannerSlider({Key? key, this.listBanner}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DotIndicatorCubit(0),
      child: Builder(builder: (context) {
        return BlocBuilder<DotIndicatorCubit, int>(
          builder: (context, state) {
            return Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 0.px),
                  // height: 160.px,
                  child:
                      // listBanner.isEmpty
                      // ? SizedBox(
                      // width: MediaQuery.of(context).size.width,
                      // height: MediaQuery.of(context).size.width / 2.5.px,
                      // child: SvgPicture.asset(
                      //   AppImages.product_placeholder,
                      //   fit: BoxFit.cover,
                      // ))
                      // :
                      CarouselSlider.builder(
                    options: CarouselOptions(
                        autoPlay: true,
                        enlargeCenterPage: true,
                        viewportFraction: .85,
                        aspectRatio: 16 / 6.6,
                        initialPage: 0,
                        enlargeFactor: 0.28,
                        onPageChanged: (index, reason) {
                          context
                              .read<DotIndicatorCubit>()
                              .onIndicatorChange(index);
                        },
                        autoPlayCurve: Curves.ease),
                    itemCount: listBannerImage.length,
                    itemBuilder:
                        (BuildContext context, int index, int realIndex) {
                      return InkWell(
                        onTap: () {},
                        child: Container(
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                            color: AppColors().white,
                            borderRadius: BorderRadius.circular(10.px),
                          ),
                          child: CachedNetworkImage(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.width / 2.5.px,
                            imageUrl:
                                "${listBannerImage[index]}",
                            placeholder: (context, url) => Center(
                              child: SizedBox(
                                width: 30.px,
                                height: 30.px,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      AppColors().white),
                                ),
                              ),
                            ),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.image_not_supported_outlined),
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Positioned(
                  bottom: 10,
                  left: 0,
                  right: 0,
                  child: DotsIndicator(
                    dotsCount: listBannerImage.length,
                    position: context.read<DotIndicatorCubit>().currentIndex * 1,
                    decorator: DotsDecorator(
                      spacing: const EdgeInsets.only(
                        left: 5,
                      ),
                      activeColor: AppColors().red,
                      color: AppColors().grey,
                    ),
                  ),
                ),
              ],
            );
          },
        );
      }),
    );
  }
}
