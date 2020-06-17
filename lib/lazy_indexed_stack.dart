library lazy_indexed_stack;

import 'package:flutter/widgets.dart';

/// Lazy animated IndexedStack. The widgets are created lazily when the index changes.
class LazyIndexedStack extends StatefulWidget {
  final AlignmentGeometry alignment;
  final TextDirection textDirection;
  final StackFit sizing;
  final int index;

  /// If false then the [itemBuilder] will be called each time the index changes.
  final bool reuse;

  final int itemCount;
  final IndexedWidgetBuilder itemBuilder;

  /// The duration of the fade animation when switching between widgets.
  /// By default the [duration] is set to 0, so the switch is instant.
  final Duration duration;

  const LazyIndexedStack({
    Key key,
    this.alignment = AlignmentDirectional.topStart,
    this.textDirection,
    this.sizing = StackFit.loose,
    this.index,
    this.reuse = true,
    @required this.itemBuilder,
    this.itemCount = 0,
    this.duration = const Duration(milliseconds: 0),
  }) : super(key: key);

  @override
  _LazyIndexedStackState createState() => _LazyIndexedStackState();
}

class _LazyIndexedStackState extends State<LazyIndexedStack>
    with SingleTickerProviderStateMixin {
  List<Widget> _children;
  List<bool> _loaded;
  AnimationController _controller;

  @override
  void initState() {
    _loaded = [];
    _children = [];
    for (int i = 0; i < widget.itemCount; ++i) {
      if (i == widget.index) {
        _children.add(widget.itemBuilder(context, i));
        _loaded.add(true);
      } else {
        _children.add(Container());
        _loaded.add(false);
      }
    }

    _controller = AnimationController(vsync: this, duration: widget.duration);
    _controller.forward();
    super.initState();
  }

  @override
  void didUpdateWidget(LazyIndexedStack oldWidget) {
    for (int i = 0; i < widget.itemCount; ++i) {
      if (i == widget.index) {
        if (!_loaded[i]) {
          _children[i] = widget.itemBuilder(context, i);
          _loaded[i] = true;
        } else {
          if (!widget.reuse) {
            _children[i] = widget.itemBuilder(context, i);
          }
        }
      }
    }
    if (widget.index != oldWidget.index) {
      _controller.forward(from: 0.0);
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _controller,
      child: IndexedStack(
        index: widget.index,
        alignment: widget.alignment,
        textDirection: widget.textDirection,
        sizing: widget.sizing,
        children: _children,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
