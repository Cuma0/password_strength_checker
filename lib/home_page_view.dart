import 'package:flutter/material.dart';
import 'components/square_button_widget.dart';
import 'utils/context_extensions.dart';
import 'utils/text_theme.dart';
import 'sign_up_page_view.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff38519C),
      body: _scaffoldBody(context),
    );
  }

  Padding _scaffoldBody(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: context.paddingMedium.horizontal,
          vertical: context.paddingMedium.vertical),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _profilePicWidget(),
          context.mediumSizedBoxVertical,
          _titleText(),
          context.lowSizedBoxVertical,
          _subtitleText(),
          context.mediumSizedBoxVertical,
          _getStartedButtonWidget(context),
        ],
      ),
    );
  }

  Align _getStartedButtonWidget(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: squareButtonWidget(
        context: context,
        buttonColor: const Color(0xff1C3683),
        iconColor: Colors.white,
        icon: Icons.arrow_forward_ios_rounded,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const SignUpPageView(),
            ),
          );
        },
      ),
    );
  }

  Text _subtitleText() {
    return Text(
      "Password strength checker.",
      style: TextThemeLight.instance!.titleLarge.copyWith(
        color: Colors.white,
        fontWeight: FontWeight.w800,
        fontSize: 32,
      ),
    );
  }

  Text _titleText() {
    return Text(
      "Hi!",
      style: TextThemeLight.instance!.titleLarge.copyWith(
        color: Colors.white,
        fontWeight: FontWeight.w900,
        fontSize: 46,
      ),
    );
  }

  ClipRRect _profilePicWidget() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Image.asset(
        "assets/images/profile.jpeg",
        height: 100,
        width: 100,
      ),
    );
  }
}
