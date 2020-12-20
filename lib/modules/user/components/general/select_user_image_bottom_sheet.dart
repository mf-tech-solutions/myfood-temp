import 'package:MyFood/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'list_tile.dart';

class SelectUserImageBottomSheet {
  final bool isCupertino;
  final BuildContext context;

  Widget get widget {
    return isCupertino ? _cupertino() : _material();
  }

  const SelectUserImageBottomSheet({
    @required this.context,
    this.isCupertino = false,
  });

  Widget _cupertino() {
    return CupertinoActionSheet(
      title: Text('Foto de perfil'),
      message: Text('Escolha sua foto de perfil'),
      actions: [
        CupertinoActionSheetAction(
          isDefaultAction: true,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.insert_photo_rounded),
              SizedBox(width: 8),
              Text(
                'Galeria',
                style: TextStyle(color: Colors.black87),
              ),
            ],
          ),
          onPressed: () {},
        ),
        CupertinoActionSheetAction(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.camera_alt_rounded),
              SizedBox(width: 8),
              Text(
                'Camera',
                style: TextStyle(color: Colors.black87),
              ),
            ],
          ),
          onPressed: () {},
        ),
        CupertinoActionSheetAction(
          isDestructiveAction: true,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.delete_rounded,
                color: Colors.red,
              ),
              SizedBox(width: 8),
              Text('Remover foto'),
            ],
          ),
          onPressed: () {},
        ),
      ],
      cancelButton: CupertinoActionSheetAction(
        child: Text(
          'Cancelar',
          style: TextStyle(color: Colors.black87),
        ),
        onPressed: () => Navigator.of(context).pop(),
      ),
    );
  }

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
                'Escolha sua de perfil',
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
            onTap: () {},
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
            onTap: () {},
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
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
