import 'package:flutter/material.dart';
import 'package:travel/utility/colors.dart';
import 'package:travel/gen/assets.gen.dart';
import 'package:travel/widgets/app_text.dart';

class ResponsiveButton extends StatelessWidget {
  final bool? isResponsive;
  final double? width;
  const ResponsiveButton({
    Key? key,
    this.isResponsive,
    this.width = 120,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        width: isResponsive! ? double.maxFinite : width,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.mainColor,
        ),
        child: Row(
          mainAxisAlignment: isResponsive!
              ? MainAxisAlignment.spaceAround
              : MainAxisAlignment.center,
          children: [
            Visibility(
              visible: isResponsive!,
              child: const AppText(
                text: "Book Trip Now",
                color: Colors.white,
              ),
            ),
            SizedBox(
              width: isResponsive! ? 30 : 0,
            ),
            Image.asset(Assets.images.buttonOne.path),
          ],
        ),
      ),
    );
  }
}
