import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:morty_flutter/core/extensions/strings.dart';
import 'package:morty_flutter/di/app_module.dart';
import 'package:morty_flutter/morty/presentation/model/morty_ui_model.dart';

import '../../../base/pagination/widgets/base_list_view_bloc.dart';
import '../../../morty_details/morty_details_screen.dart';
import '../../../settings/presentation/screen/setting_screen.dart';
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
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const SettingScreen()));
          },
          scrollController: scrollController,
        ),
        body: BaseListViewBloc<MortyUIModel>(
            scrollController: scrollController,
            pagingSource: getIt.get(),
            item: (model) {
              return MortyItem(
                mortyUIModel: model as MortyUIModel,
                onPressed: (morty) {
                  showMaterialModalBottomSheet(
                    elevation: 2,
                    backgroundColor:
                        Theme.of(context).colorScheme.primary.withOpacity(0.7),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            topLeft: Radius.circular(20))),
                    expand: false,
                    context: context,
                    builder: (context) => MortyDetailsScreen(
                      mortyUIModel: morty,
                      onClose: () {
                        Navigator.pop(context);
                      },
                      onOpen: () {
                        model.url.openURL();
                      },
                    ),
                  );
                },
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
