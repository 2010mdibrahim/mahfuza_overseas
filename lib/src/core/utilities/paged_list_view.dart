import 'package:flutter/material.dart';
import 'package:mahfuza_overseas/src/core/extensions/extensions.dart';
import 'package:mahfuza_overseas/src/core/utilities/theme_config.dart';


import 'common_methods.dart';

typedef PagedWidgetBuilder<T> = Widget Function(
    BuildContext context, T item, int index);

class PagedListView<T> extends StatelessWidget {
  final PagedWidgetBuilder<T> itemBuilder;
  final List<T> items;
  final bool isLoading;
  final _scrollController = ScrollController();
  final Function(List<T>, int) onNewLoad;
  final int totalPage;
  final int totalSize;
  final int itemPerPage;
  final bool isFromClosingTheLoop;

  PagedListView({
    super.key,
    required this.items,
    required this.itemBuilder,
    required this.isLoading,
    required this.onNewLoad,
    required this.totalPage,
    required this.totalSize,
    required this.itemPerPage,
    required this.isFromClosingTheLoop,
  });

  @override
  Widget build(BuildContext context) {
    _scrollController.addListener(() {
      // if loader is visible then previous execution is not completed
      // or duplicate execution is about to happen
      // so we stop it by return
      // also if total page is 1 or total size is less equal item per page
      // so we don't need to call newLoad any more
      if (isLoading || totalPage == 1 || totalSize <= itemPerPage) return;

      if (_scrollController.position.atEdge &&
          _scrollController.position.pixels > 0) {
        // this condition will be execute when you are in bottom of the list
        // then callback function will be trigger which we pass through parameter
        // will be execute for loading more data
        int newLength = totalSize % itemPerPage == 0
            ? (totalSize - 1) - items.length
            : totalSize - items.length;
        if (newLength > itemPerPage) {
          int nextPage = totalPage - (newLength / itemPerPage).floor();
          this.onNewLoad(items, nextPage);
        } else {
          if (newLength <= 0) return;
          this.onNewLoad(items, totalPage);
        }
      }
    });

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (items.isNotEmpty)
          Flexible(
            flex: 1,
            child: ListView.builder(
              physics: const AlwaysScrollableScrollPhysics(),
              controller: _scrollController,
              itemCount: items.isEmpty ? 0 : items.length,
              itemBuilder: (context, index) {
                return itemBuilder(context, items[index], index + 1);
              },
            ),
          )
        else
          Flexible(
            child: CommonMethods.notFoundArc(),
          ),
        isLoading
            ? Column(
                children: [
                  // ShimmerLoaderView(
                  //     one: true, isClosingTheLoop: isFromClosingTheLoop),
                  Center(
                    child: CircularProgressIndicator(backgroundColor: ThemeConfig.logoColor),
                  ),
                  10.ph,
                ],
              )
            : const SizedBox(),
      ],
    );
  }
}
