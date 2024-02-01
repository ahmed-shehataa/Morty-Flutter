import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:morty_flutter/morty/presentation/model/morty_ui_model.dart';

class MortyItem extends StatelessWidget {
  final MortyUIModel mortyUIModel;

  const MortyItem({super.key, required this.mortyUIModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: GestureDetector(
        onTap: () {},
        child: Container(
          padding: const EdgeInsets.all(20),
          height: 120,
          width: double.infinity,
          child: Row(
            children: [
              SizedBox(
                width: 100,
                height: 100,
                child: CachedNetworkImage(
                  imageUrl: mortyUIModel.image,
                  placeholder: (context, url) =>
                      const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                  imageBuilder: (context, imageProvider) {
                    return CircleAvatar(
                      backgroundImage: imageProvider,
                    );
                  },
                ),
              ),
              Text(
                mortyUIModel.status,
                style: const TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
    ;
  }
}
