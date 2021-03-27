import 'package:flutter/material.dart';
import 'package:dashed_circle/dashed_circle.dart';

class story extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
  final VoidCallback press;

  const story({
    Key key,
    @required this.press,
  }) : super(key: key);
}

class _MyPageState extends State<story> with SingleTickerProviderStateMixin {
  /// Variables
  Animation gap;
  Animation base;
  Animation reverse;
  AnimationController controller;

  /// Init
  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 4));
    base = CurvedAnimation(parent: controller, curve: Curves.easeOut);
    reverse = Tween<double>(begin: 0.0, end: -1.0).animate(base);
    gap = Tween<double>(begin: 3.0, end: 0.0).animate(base)
      ..addListener(() {
        setState(() {});
      });
    controller.forward();
  }

  @override
  // TODO: implement widget

  /// Dispose
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  /// Widget
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.press,
      child: Row(children: [
        Container(
          alignment: Alignment.center,
          child: RotationTransition(
            turns: base,
            child: DashedCircle(
              gapSize: gap.value,
              dashes: 40,
              color: Color(0XFFED4634),
              child: RotationTransition(
                turns: reverse,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: CircleAvatar(
                    radius: 30.0,
                    backgroundImage: NetworkImage(
                        "https://images.unsplash.com/photo-1564564295391-7f24f26f568b"),
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 6,
        )
      ]),
    );
  }
}
