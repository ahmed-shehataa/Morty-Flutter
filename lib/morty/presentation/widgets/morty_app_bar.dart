import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MortyAppBar extends StatefulWidget implements PreferredSizeWidget {
  const MortyAppBar({
    super.key,
    required this.onSettingPressed,
    required this.scrollController,
  });

  final ScrollController scrollController;
  final VoidCallback onSettingPressed;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  State<MortyAppBar> createState() => _MortyAppBarState();
}

class _MortyAppBarState extends State<MortyAppBar> {
  bool _showAppbar = true;
  bool isScrollingDown = false;

  _scrollListener() {
    if (widget.scrollController.position.userScrollDirection ==
        ScrollDirection.reverse) {
      if (!isScrollingDown) {
        isScrollingDown = true;
        _showAppbar = false;
        setState(() {});
      }
    }

    if (widget.scrollController.position.userScrollDirection ==
        ScrollDirection.forward) {
      if (isScrollingDown) {
        isScrollingDown = false;
        _showAppbar = true;
        setState(() {});
      }
    }
  }

  @override
  void initState() {
    super.initState();
    widget.scrollController.addListener(_scrollListener);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: _showAppbar ? Scaffold.of(context).appBarMaxHeight : 0.0,
      duration: const Duration(milliseconds: 200),
      child: AppBar(
        title: Text(
          "morty_title".tr(),
          style: Theme.of(context).textTheme.displayMedium,
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        actions: [
          IconButton(
            onPressed: widget.onSettingPressed,
            icon: Icon(
              Icons.settings,
              color: Theme.of(context).colorScheme.background,
            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(_scrollListener);
    widget.scrollController.dispose();
    super.dispose();
  }
}