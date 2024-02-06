import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:morty_flutter/base/pagination/base_list_view.dart';
import 'package:morty_flutter/di/app_module.dart';
import 'package:morty_flutter/morty/presentation/model/morty_ui_model.dart';

import '../widgets/morty_app_bar.dart';
import '../widgets/morty_item.dart';

class MortyScreen extends StatefulWidget {
  const MortyScreen({super.key});

  @override
  State<MortyScreen> createState() => _MortyScreenState();
}

class _MortyScreenState extends State<MortyScreen> {
  final ScrollController scrollController = ScrollController();

  bool _isFabVisible = false;

  _fabVisibility() {
    if (scrollController.hasClients && scrollController.position.pixels != 0) {
      setState(() {
        _isFabVisible = true;
      });
    } else {
      setState(() {
        _isFabVisible = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    scrollController.addListener(_fabVisibility);
  }

  _fabWidget() {
    return FloatingActionButton(
      //shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(50))),
      child: IconButton(
        onPressed: null,
        icon: Icon(
          Icons.keyboard_arrow_up,
          color: Theme.of(context).colorScheme.background,
        ),
      ),
      onPressed: () {
        scrollController.animateTo(
          0.0,
          curve: Curves.easeOut,
          duration: const Duration(milliseconds: 300),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: AnimatedOpacity(
          opacity: _isFabVisible ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 200),
          child: _fabWidget(),
        ),
        appBar: MortyAppBar(
          onSettingPressed: () {
            Fluttertoast.showToast(
                msg: "TODO open setting screen", gravity: ToastGravity.CENTER);
          },
          scrollController: scrollController,
        ),
        body: BaseListView<MortyUIModel>(
            scrollController: scrollController,
            pagingSource: getIt.get(),
            item: (model) {
              return MortyItem(
                mortyUIModel: model as MortyUIModel,
              );
            }));
  }

  @override
  void dispose() {
    scrollController.removeListener(_fabVisibility);
    scrollController.dispose();
    super.dispose();
  }
}
