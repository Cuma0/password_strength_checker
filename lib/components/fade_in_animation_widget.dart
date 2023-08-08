import 'package:flutter/material.dart';

class FadeInAnimationWidget extends StatefulWidget {
  final Widget widget;
  final bool isUp;
  final int milliseconds;
  const FadeInAnimationWidget(
      {super.key,
      required this.widget,
      required this.isUp,
      required this.milliseconds});

  @override
  State<FadeInAnimationWidget> createState() => _FadeInAnimationWidgetState();
}

class _FadeInAnimationWidgetState extends State<FadeInAnimationWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> _fadeIn;
  late Animation<double> _transform;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      value: 0,
      vsync: this,
      duration: Duration(
        milliseconds: widget.milliseconds,
      ),
    )..addListener(() => setState(() {}));
    _fadeIn = Tween<double>(begin: 0.0, end: 1.0).animate(controller);
    _transform =
        Tween<double>(begin: widget.isUp == true ? 15.0 : -15.0, end: 0.0)
            .animate(controller);
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FadeTransition(
          opacity: _fadeIn,
          child: Transform.translate(
              offset: Offset(
                0,
                _transform.value,
              ),
              child: widget.widget),
        ),
      ],
    );
  }
}
