import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel/utility/colors.dart';
import 'package:travel/cubit/travel_cubits.dart';
import 'package:travel/gen/assets.gen.dart';
import 'package:travel/utility/strings.dart';
import 'package:travel/widgets/app_large_text.dart';
import 'package:travel/widgets/app_text.dart';
import 'package:travel/widgets/responsive_button.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List<String> images = [
    Assets.images.welcomeOne.path,
    Assets.images.welcomeTwo.path,
    Assets.images.welcomeThree.path,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 3,
        itemBuilder: (_, index) {
          return Container(
            width: double.maxFinite,
            height: double.maxFinite,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  images[index],
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              margin: const EdgeInsets.only(top: 150, left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const AppLargeText(
                        text: AppTexts.trips,
                      ),
                      const AppText(
                        text: AppTexts.mountain,
                        size: 30,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const SizedBox(
                        width: 150,
                        child: AppText(
                          text: AppTexts.mountainLong,
                          color: AppColors.textColor2,
                          size: 14,
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      GestureDetector(
                        onTap: () {
                          BlocProvider.of<TravelCubits>(context).getData();
                        },
                        child: const ResponsiveButton(
                          isResponsive: false,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: List.generate(
                      3,
                      (dotsIndex) {
                        return Container(
                          margin: const EdgeInsets.only(bottom: 2),
                          width: 14,
                          height: index == dotsIndex ? 30 : 14,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: index == dotsIndex
                                ? AppColors.mainColor
                                : AppColors.mainColor.withOpacity(0.3),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
