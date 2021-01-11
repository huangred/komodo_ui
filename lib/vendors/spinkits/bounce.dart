import 'package:flutter/widgets.dart';
import 'dart:math' as math show sin, pi;

class SpinKitBounce extends StatefulWidget {
  const SpinKitBounce({
    Key key,
    this.color,
    this.size = 50.0,
    this.count = 4,
    this.itemBuilder,
    this.duration = const Duration(milliseconds: 1400),
    this.center = true,
    this.controller,
  })  : assert(!(itemBuilder is IndexedWidgetBuilder && color is Color) && !(itemBuilder == null && color == null),
            'You should specify either a itemBuilder or a color'),
        assert(size != null),
        super(key: key);

  final Color color;
  final double size;
  final int count;
  final IndexedWidgetBuilder itemBuilder;
  final Duration duration;
  final AnimationController controller;
  final bool center;
  @override
  _SpinKitBounceState createState() => _SpinKitBounceState();
}

class _SpinKitBounceState extends State<SpinKitBounce> with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = (widget.controller ?? AnimationController(vsync: this, duration: widget.duration))..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget current = SizedBox.fromSize(
      size: Size(widget.size * 4, widget.size),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(widget.count, (i) {
          return ScaleTransition(
            scale: _DelayTween(begin: 0.0, end: 1.0, delay: i * .2).animate(_controller),
            child: SizedBox.fromSize(size: Size.square(widget.size * 0.5), child: _itemBuilder(i)),
          );
        }),
      ),
    );

    if (widget.center) current = Center(child: current);

    return current;
  }

  Widget _itemBuilder(int index) => widget.itemBuilder != null
      ? widget.itemBuilder(context, index)
      : DecoratedBox(decoration: BoxDecoration(color: widget.color, shape: BoxShape.circle));
}

class _DelayTween extends Tween<double> {
  _DelayTween({double begin, double end, this.delay}) : super(begin: begin, end: end);

  final double delay;

  @override
  double lerp(double t) => super.lerp((math.sin((t - delay) * 2 * math.pi) + 1) / 2);

  @override
  double evaluate(Animation<double> animation) => lerp(animation.value);
}
