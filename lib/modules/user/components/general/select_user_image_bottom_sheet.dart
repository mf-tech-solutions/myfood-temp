import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../constants.dart';
import 'list_tile.dart';

class SelectUserImageBottomSheet {
  final BuildContext context;
  final Function pickFromGallery;
  final Function pickFromCamera;
  final Function removeImage;

  Widget get widget {
    return _material();
  }

  const SelectUserImageBottomSheet({
    @required this.context,
    @required this.pickFromGallery,
    @required this.pickFromCamera,
    @required this.removeImage,
  });

  Widget _material() {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Escolha sua foto de perfil',
                style: textTheme.headline6,
              ),
              IconButton(
                icon: Icon(Icons.close_rounded),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          ),
          SizedBox(height: 16),
          MyListTile(
            leading: CircleAvatar(
              child: Icon(
                Icons.insert_photo_rounded,
                color: Colors.white,
              ),
              backgroundColor: theme.primaryColor,
            ),
            title: 'Galeria',
            onTap: () {
              pickFromGallery();
              Navigator.of(context).pop();
            },
          ),
          MyListTile(
            leading: CircleAvatar(
              child: Icon(
                Icons.camera_alt_rounded,
                color: Colors.white,
              ),
              backgroundColor: theme.primaryColor,
            ),
            title: 'Câmera',
            onTap: () {
              pickFromCamera();
              Navigator.of(context).pop();
            },
          ),
          MyListTile(
            leading: CircleAvatar(
              child: Icon(
                Icons.delete_rounded,
                color: Colors.red,
              ),
              backgroundColor: Constants.scaffoldBackgroundColor,
            ),
            title: 'Remover foto',
            onTap: () {
              removeImage();
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
