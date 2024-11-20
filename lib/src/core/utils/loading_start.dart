import 'package:flutter/material.dart';

class LoadingStart extends StatefulWidget {
  const LoadingStart({
    super.key,
    required this.onInit,
    required this.child,
    this.onDispose,
    this.delayInitDuration,
  });

  final Function onInit;
  final Widget child;
  final Function? onDispose;

  final int? delayInitDuration;

  @override
  State<LoadingStart> createState() => _LoadingStartState();
}

class _LoadingStartState extends State<LoadingStart> {
  bool _isInit = false;
  late BuildContext buildContext;

  @override
  void didChangeDependencies() {
    _initialize();
    super.didChangeDependencies();
  }

  _initialize() async {
    if (!_isInit) {
      final duration = widget.delayInitDuration ?? 200;
      if (duration > 0) {
        await Future.delayed(Duration(milliseconds: duration));
      }
      if (!mounted) return;
      widget.onInit();
      buildContext = context;
      _isInit = true;
    }
  }

  @override
  void dispose() {
    if (widget.onDispose != null) {
      widget.onDispose!();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
