import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:morty_flutter/morty/presentation/model/morty_ui_model.dart';

class MortyDetailsScreen extends StatelessWidget {
  final MortyUIModel _mortyUIModel;

  final VoidCallback _onClose;
  final VoidCallback _onOpen;

  const MortyDetailsScreen({
    super.key,
    required MortyUIModel mortyUIModel,
    required void Function() onClose,
    required void Function() onOpen,
  })  : _onOpen = onOpen,
        _mortyUIModel = mortyUIModel,
        _onClose = onClose;

  @override
  Widget build(BuildContext context) {
    return Wrap(children: [
      Padding(
        padding: const EdgeInsets.all(8),
        child: Stack(children: [
          Transform.translate(
            offset: const Offset(0, -50),
            child: Align(
                alignment: Alignment.topCenter,
                child: Flexible(
                  child: Column(
                    children: [
                      SizedBox(
                        width: 100,
                        height: 100,
                        child: CachedNetworkImage(
                          imageUrl: _mortyUIModel.image,
                          placeholder: (context, url) =>
                              const Icon(Icons.downloading),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                          imageBuilder: (context, imageProvider) {
                            return CircleAvatar(
                              backgroundImage: imageProvider,
                            );
                          },
                        ),
                      ),
                      Text(
                        _mortyUIModel.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: Theme.of(context).colorScheme.onSecondary),
                      ),
                      Text(
                        _mortyUIModel.gender,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Theme.of(context).colorScheme.onSecondary),
                      ),
                      Text(
                        _mortyUIModel.status,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Theme.of(context).colorScheme.onSecondary),
                      ),
                      Text(
                        _mortyUIModel.getFormattedDate(),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Theme.of(context).colorScheme.onSecondary),
                      ),
                    ],
                  ),
                )),
          ),
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              onPressed: _onClose,
              icon: const Icon(
                Icons.close,
                color: Colors.white,
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: IconButton(
              onPressed: _onOpen,
              icon: const Icon(
                Icons.share,
                color: Colors.white,
              ),
            ),
          )
        ]),
      ),
    ]);
  }
}
