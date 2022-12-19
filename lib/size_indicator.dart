import 'package:flutter/material.dart';

class SizeIndicator extends Decoration {
  const SizeIndicator({
    required this.width,
    required this.height,
    this.bottomMargin = 0.0,
    this.color = Colors.white,
  });

  final double width;
  final double height;
  final double bottomMargin;
  final Color color;

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _SizePainter(
      width: width,
      height: height,
      bottomMargin: bottomMargin,
      color: color,
      onChange: onChanged,
    );
  }
}

class _SizePainter extends BoxPainter {
  _SizePainter({
    required this.width,
    required this.height,
    required this.bottomMargin,
    required this.color,
    VoidCallback? onChange,
  })  : _paint = Paint()
          ..color = color
          ..style = PaintingStyle.fill,
        super(onChange);

  final Paint _paint;
  final double width;
  final double height;
  final double bottomMargin;
  final Color color;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    assert(configuration.size != null);
    final Rect rect = offset & configuration.size!;

    final customRect = Rect.fromCenter(
      center: Offset(rect.bottomCenter.dx, rect.bottomCenter.dy - bottomMargin),
      width: width,
      height: height,
    );
    canvas.drawRect(customRect, _paint);
  }
}
