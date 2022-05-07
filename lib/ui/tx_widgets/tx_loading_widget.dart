
import 'package:flutter/material.dart';

import '../../res/R.dart';

class TXLoadingWidget extends StatelessWidget {
  final Stream<bool> loadingStream;
  final bool initialData;
  final Color? backgroundColor;
  final double height;

  const TXLoadingWidget({
    Key? key,
    required this.loadingStream,
    this.initialData = false,
    this.backgroundColor,
    this.height = double.infinity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Center(
        child: StreamBuilder<bool>(
          stream: loadingStream,
          initialData: initialData,
          builder: (_, snapshot) {
            if (snapshot.data!) {
              return _TXLoadingFullScreen(
                backgroundColor: backgroundColor,
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}

class _TXLoadingFullScreen extends StatelessWidget {
  final double dimension;
  final bool dimBackground;
  final Color? backgroundColor;

  const _TXLoadingFullScreen({
    Key? key,
    this.dimension = 45,
    this.dimBackground = true,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor ?? const Color(0x8A656C79),
      child: AbsorbPointer(
        child: Center(
          child: SizedBox(
            width: dimension,
            height: dimension,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(R.color.primaryColor),
              strokeWidth: 3,
              backgroundColor: null,
            ),
          ),
        ),
      ),
    );
  }
}
