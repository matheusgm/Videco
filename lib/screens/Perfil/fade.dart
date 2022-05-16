import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';

enum AniProps { opacity, translateX }

class FadeIn extends StatelessWidget {
  final double delay;
  final Widget child;

  FadeIn(this.delay, this.child);

  @override
  Widget build(BuildContext context) {
    // final tween = MultiTrackTween([
    //   Track("opacity")
    //       .add(Duration(milliseconds: 500), Tween(begin: 0.0, end: 1.0)),
    //   Track("translateX").add(
    //       Duration(milliseconds: 500), Tween(begin: 130.0, end: 0.0),
    //       curve: Curves.easeOut)
    // ]);
    final tween = MultiTween<AniProps>()
      ..add(AniProps.opacity, 0.0.tweenTo(1.0), 500.milliseconds)
      ..add(AniProps.translateX, (130.0).tweenTo(0.0), 500.milliseconds,
          Curves.easeOut);

    return PlayAnimation(
      delay: Duration(milliseconds: (300 * delay).round()),
      duration: tween.duration,
      tween: tween,
      child: child,
    );
  }
}
