import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel/utility/colors.dart';
import 'package:travel/cubit/travel_cubit_states.dart';
import 'package:travel/cubit/travel_cubits.dart';
import 'package:travel/utility/strings.dart';
import 'package:travel/widgets/app_buttons.dart';
import 'package:travel/widgets/app_large_text.dart';
import 'package:travel/widgets/app_text.dart';
import 'package:travel/widgets/responsive_button.dart';

class DetailPage extends StatefulWidget {
  DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int gottenStar = 4;
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TravelCubits, TravelCubitStates>(
        builder: (context, state) {
      DetailState data = state as DetailState;
      return Scaffold(
        body: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          child: Stack(
            children: [
              Positioned(
                left: 0,
                right: 0,
                child: Container(
                  width: double.maxFinite,
                  height: 300,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        AppUrls.baseUrl +
                            AppUrls.uploads +
                            "/" +
                            data.place.img,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        BlocProvider.of<TravelCubits>(context).goHome();
                      },
                      icon: const Icon(Icons.arrow_back_ios_new),
                      iconSize: 30,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 270,
                child: Container(
                  padding: const EdgeInsets.only(right: 20, left: 20, top: 20),
                  width: MediaQuery.of(context).size.width,
                  height: 500,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppLargeText(
                            text: data.place.name,
                            color: Colors.black.withOpacity(0.8),
                          ),
                          AppLargeText(
                            text: "\$ " + data.place.price.toString(),
                            color: AppColors.mainColor,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.location_on,
                            color: AppColors.mainColor,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          AppText(
                            text: data.place.location,
                            color: AppColors.textColor1,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Wrap(
                            children: List.generate(
                              5,
                              (index) {
                                return Icon(
                                  Icons.star,
                                  color: index < data.place.stars
                                      ? AppColors.starColor
                                      : AppColors.textColor2,
                                );
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          AppText(
                            text: "(${data.place.stars},0)",
                            color: AppColors.textColor2,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      AppLargeText(
                        text: AppTexts.people,
                        size: 20,
                        color: Colors.black.withOpacity(0.8),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const AppText(
                        text: AppTexts.peopleLong,
                        color: AppColors.mainTextColor,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Wrap(
                        children: List.generate(
                          5,
                          (index) {
                            return InkWell(
                              onTap: () => setState(() {
                                selectedIndex = index;
                              }),
                              child: Container(
                                margin: const EdgeInsets.only(
                                  right: 10,
                                ),
                                child: AppButtons(
                                  color: selectedIndex == index
                                      ? Colors.white
                                      : Colors.black,
                                  backgroundColor: selectedIndex == index
                                      ? Colors.black
                                      : AppColors.buttonBackground,
                                  size: 50,
                                  borderColor: selectedIndex == index
                                      ? Colors.black
                                      : AppColors.buttonBackground,
                                  textColor: selectedIndex == index
                                      ? Colors.white
                                      : Colors.black,
                                  text: (index + 1).toString(),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      AppLargeText(
                        text: AppTexts.description,
                        color: Colors.black.withOpacity(0.8),
                        size: 20,
                      ),
                      const AppText(
                        text: AppTexts.descriptionLong,
                        color: AppColors.mainTextColor,
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                  bottom: 20,
                  left: 20,
                  right: 20,
                  child: Row(
                    children: const [
                      AppButtons(
                        color: AppColors.textColor2,
                        backgroundColor: Colors.white,
                        size: 60,
                        borderColor: AppColors.textColor2,
                        isIcon: true,
                        icon: Icons.favorite_border,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      ResponsiveButton(
                        isResponsive: true,
                      ),
                    ],
                  ))
            ],
          ),
        ),
      );
    });
  }
}
