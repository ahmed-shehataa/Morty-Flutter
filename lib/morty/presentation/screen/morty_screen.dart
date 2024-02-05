import 'package:flutter/material.dart';
import 'package:morty_flutter/base/pagination/base_list_view.dart';
import 'package:morty_flutter/di/app_module.dart';
import 'package:morty_flutter/morty/presentation/model/morty_ui_model.dart';

import '../widgets/morty_item.dart';

class MortyScreen extends StatelessWidget {
  const MortyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
        child: BaseListView<MortyUIModel>(
            pagingSource: getIt.get(),
            item: (model) {
              return MortyItem(
                mortyUIModel: model as MortyUIModel,
              );
            }));
  }
}
