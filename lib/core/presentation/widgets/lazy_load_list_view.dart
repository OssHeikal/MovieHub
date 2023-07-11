import 'package:flutter/material.dart';

class LazyLoadListView extends StatefulWidget {
  const LazyLoadListView({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
    required this.onScrollDidReachEnd,
  });

  final int itemCount;
  final Widget Function(BuildContext context, int index) itemBuilder;
  final Function onScrollDidReachEnd;

  @override
  State<LazyLoadListView> createState() => _LazyLoadListViewState();
}

class _LazyLoadListViewState extends State<LazyLoadListView> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.atEdge) {
      if (_scrollController.position.pixels != 0) {
        widget.onScrollDidReachEnd();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      controller: _scrollController,
      itemCount: widget.itemCount,
      separatorBuilder: (context, index) => const Divider(height: 0),
      itemBuilder: widget.itemBuilder,
    );
  }
}
