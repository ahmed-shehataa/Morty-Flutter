import 'package:flutter/material.dart';
import 'package:morty_flutter/base/pagination/base_list_view.dart';
import 'package:morty_flutter/morty/presentation/model/morty_ui_model.dart';

import '../../di/morty_di.dart';
import '../widgets/morty_item.dart';

class MortyScreen extends StatelessWidget {
  const MortyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
        child: BaseListView<MortyUIModel>(
            pagingSource: MortyDI.getPaging(),
            item: (BasePagingModel) {
              var model = BasePagingModel as MortyUIModel;
              return MortyItem(
                mortyUIModel: model,
              );
            }));
  }
}
