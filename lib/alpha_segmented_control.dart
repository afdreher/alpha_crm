// This is borrowed from flat_segmented_control

import 'package:flutter/material.dart';

import 'alpha_elevation.dart';

class AlphaSegmentedControl extends StatefulWidget {
  final List<Widget> children;

  final List<Widget> tabChildren;

  /// Rounded, if desired
  final double borderRadius;

  final double scale;

  /// The color of the line that appears below the selected tab.
  ///
  /// Defaults to Theme's indicatorColor [Theme.of(context).indicatorColor].
  final Color indicatorColor;

  /// The color of selected tab labels.
  ///
  /// Defaults to text body2 color [Theme.of(context).textTheme.body2.color].
  final Color labelColor;

  /// The color of unselected tab labels.
  ///
  /// Defaults to text body2 color [Theme.of(context).textTheme.body2.color].
  final Color unselectedLabelColor;

  /// Whether the children can be swiped horizontally.
  ///
  /// Defaults to [false].
  final bool isChildrenSwipeable;

  /// Padding of tab menu, not tab children.
  ///
  /// Defaults to [EdgeInsets.zero]
  final EdgeInsetsGeometry tabBarPadding;

  /// Padding of tab menu, not tab children.
  ///
  /// Defaults to [EdgeInsets.zero]
  final EdgeInsetsGeometry tabBarMargin;

  /// The view padding.
  ///
  /// Defaults to [EdgeInsets.zero]
  final EdgeInsetsGeometry childrenPadding;

  /// The view margin.
  ///
  /// Defaults to [EdgeInsets.zero]
  final EdgeInsetsGeometry childrenMargin;

  /// Define the children width. Please change as desired.
  ///
  /// Defaults to device width.
  final double childrenWidth;

  /// Define the children height. Please change as desired.
  ///
  /// Defaults to device height.
  final double childrenHeight;

  AlphaSegmentedControl({
    Key key,
    @required this.children,
    @required this.tabChildren,
    this.borderRadius = 0,
    this.scale,
    this.indicatorColor,
    this.labelColor,
    this.isChildrenSwipeable = false,
    this.unselectedLabelColor,
    this.tabBarPadding,
    this.tabBarMargin,
    this.childrenPadding,
    this.childrenMargin,
    this.childrenWidth,
    this.childrenHeight,
  })  : assert(children != null),
        assert(tabChildren != null),
        assert(tabChildren.length == children.length),
        super(key: key);

  @override
  _AlphaSegmentedControlState createState() => _AlphaSegmentedControlState();
}

class _AlphaSegmentedControlState extends State<AlphaSegmentedControl> with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      vsync: this,
      length: widget.children.length,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _tabController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
            padding: widget.tabBarPadding ?? EdgeInsets.zero,
            margin: widget.tabBarMargin ?? EdgeInsets.zero,
            child: AlphaElevation(
              borderRadius: widget.borderRadius,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              scale: widget.scale,
              child: TabBar(
                  controller: _tabController,
                  tabs: widget.tabChildren,
                  isScrollable: true,
                  labelPadding: EdgeInsets.zero,
                  indicatorColor: widget.indicatorColor,
                  indicatorWeight: 4.0,
                  labelColor: widget.labelColor ??
                      Theme.of(context).textTheme.body2.color,
                  unselectedLabelColor: widget.unselectedLabelColor ??
                      Theme.of(context).textTheme.body2.color,
              ),
            )
        ),
        Container(
          height: widget.childrenHeight ?? MediaQuery.of(context).size.height,
          width: widget.childrenWidth ?? MediaQuery.of(context).size.width,
          padding: widget.childrenPadding ?? EdgeInsets.zero,
          margin: widget.childrenMargin ?? EdgeInsets.zero,
          child: TabBarView (
            controller: _tabController,
            physics: widget.isChildrenSwipeable
                ? ScrollPhysics()
                : NeverScrollableScrollPhysics(),
            children: widget.children,
          ),
        ),
      ],
    );
  }
}
