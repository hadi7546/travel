import 'package:flutter/material.dart';
import 'package:travel/utility/strings.dart';

class MyPage extends StatelessWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(AppTexts.profilePage),
    );
  }
}
