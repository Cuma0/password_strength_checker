import 'package:flutter/material.dart';
import 'components/fade_in_animation_widget.dart';
import 'utils/color_scheme.dart';
import 'utils/context_extensions.dart';
import 'utils/text_theme.dart';

import 'components/outlined_button_widget.dart';
import 'components/square_button_widget.dart';
import 'components/text_form_widget.dart';

class SignUpPageView extends StatefulWidget {
  const SignUpPageView({super.key});

  @override
  State<SignUpPageView> createState() => _SignUpPageViewState();
}

class _SignUpPageViewState extends State<SignUpPageView> {
  double? _strength = 0.0;
  bool _obsecureText = true;
  static final RegExp numReg = RegExp(r".*[0-9].*");
  static final RegExp letterReg = RegExp(r".*[A-Za-z].*");
  static final RegExp specialReg = RegExp(r'[!?,.#@$%^&*()]');

  void _checkPassword(String value) {
    if (value.length < 6) {
      setState(() {
        _strength = 0;
      });
    } else if (value.length >= 6) {
      setState(() {
        _strength = 1 / 3;
      });
      if (letterReg.hasMatch(value) && numReg.hasMatch(value)) {
        setState(() {
          _strength = 2 / 3;
        });
        if (specialReg.hasMatch(value)) {
          setState(() {
            _strength = 1;
          });
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.paddingNormal.horizontal,
            vertical: context.paddingLow.vertical,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              context.mediumSizedBoxVertical,
              backButtonWidget(context),
              context.mediumSizedBoxVertical,
              signUpText(),
              context.mediumSizedBoxVertical,
              formWidget(context),
              strengthCheckerWidget(),
              context.mediumSizedBoxVertical,
              context.normalSizedBoxVertical,
              nextButtonWidget(context),
              context.mediumSizedBoxVertical,
              context.mediumSizedBoxVertical,
              context.mediumSizedBoxVertical,
              createAccountText(),
              context.normalSizedBoxVertical,
              context.lowSizedBoxVertical,
              signUpMethodsWidget(context),
              context.normalSizedBoxVertical,
              context.lowSizedBoxVertical,
              alreadyHaveAccountText(),
            ],
          ),
        ),
      ),
    );
  }

  Widget backButtonWidget(BuildContext context) {
    return FadeInAnimationWidget(
      isUp: true,
      milliseconds: 500,
      widget: squareButtonWidget(
        context: context,
        buttonColor: ColorSchemeLight.instance!.lightGrey,
        icon: Icons.arrow_back_ios_new_rounded,
        iconColor: ColorSchemeLight.instance!.lightBlack,
      ),
    );
  }

  Widget signUpText() {
    return FadeInAnimationWidget(
      isUp: true,
      milliseconds: 500,
      widget: Text(
        "Sign Up",
        style: TextThemeLight.instance!.titleLarge,
      ),
    );
  }

  Widget formWidget(BuildContext context) {
    return FadeInAnimationWidget(
      isUp: true,
      milliseconds: 550,
      widget: Form(
        child: Column(
          children: [
            textFormWidget(context: context, hintText: "Name"),
            context.normalSizedBoxVertical,
            textFormWidget(context: context, hintText: "Email"),
            context.normalSizedBoxVertical,
            textFormWidget(
              context: context,
              hintText: "Password",
              obsecureText: _obsecureText,
              onChanged: (value) {
                _checkPassword(value);
              },
              suffixIcon: IconButton(
                icon: Icon(
                  _obsecureText == true
                      ? Icons.visibility
                      : Icons.visibility_off,
                  color: ColorSchemeLight.instance!.lightBlack,
                ),
                onPressed: () {
                  setState(() {
                    _obsecureText = !_obsecureText;
                  });
                },
              ),
            ),
            context.lowSizedBoxVertical,
          ],
        ),
      ),
    );
  }

  Widget strengthCheckerWidget() {
    return FadeInAnimationWidget(
      isUp: true,
      milliseconds: 550,
      widget: Row(
        children: [
          Expanded(
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                _strength == 0
                    ? "Must be at least 6 charachter"
                    : _strength == 1 / 3
                        ? "Weak"
                        : _strength == 2 / 3
                            ? "So so"
                            : _strength == 1
                                ? "Strong"
                                : "",
                style: TextThemeLight.instance!.bodySmall,
              ),
            ),
          ),
          _strength == 0
              ? const SizedBox()
              : Expanded(
                  flex: 5,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    child: LinearProgressIndicator(
                      minHeight: 8,
                      value: _strength,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        ColorSchemeLight.instance!.grey,
                      ),
                      backgroundColor: ColorSchemeLight.instance!.lightGrey,
                    ),
                  ),
                ),
        ],
      ),
    );
  }

  Widget nextButtonWidget(BuildContext context) {
    return FadeInAnimationWidget(
      isUp: true,
      milliseconds: 500,
      widget: Align(
        alignment: Alignment.centerRight,
        child: squareButtonWidget(
            context: context,
            icon: Icons.arrow_forward_ios_rounded,
            buttonColor: ColorSchemeLight.instance!.blue,
            iconColor: Colors.white),
      ),
    );
  }

  Widget alreadyHaveAccountText() {
    return FadeInAnimationWidget(
      isUp: false,
      milliseconds: 500,
      widget: Align(
        alignment: Alignment.center,
        child: Text(
          "Already have an account? Sign in",
          style: TextThemeLight.instance!.button
              .copyWith(fontWeight: FontWeight.w600),
        ),
      ),
    );
  }

  Widget signUpMethodsWidget(BuildContext context) {
    return FadeInAnimationWidget(
      isUp: false,
      milliseconds: 500,
      widget: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          outlinedButtonWidget(
              context: context, icon: "facebook", item: "Facebook"),
          outlinedButtonWidget(
              context: context, icon: "google", item: "Google"),
        ],
      ),
    );
  }

  Widget createAccountText() {
    return FadeInAnimationWidget(
      isUp: true,
      milliseconds: 500,
      widget: Text(
        "Create an account using:",
        style: TextThemeLight.instance!.titleMedium,
      ),
    );
  }
}
