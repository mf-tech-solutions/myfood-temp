import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../modules/user/components/general/select_user_image_bottom_sheet.dart';
import '../../modules/user/store/selectors.dart';

class UserImageScreen extends StatefulWidget {
  @override
  _UserImageScreenState createState() => _UserImageScreenState();
}

class _UserImageScreenState extends State<UserImageScreen> {
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(
          Icons.camera_alt_rounded,
          color: Colors.white,
        ),
        onPressed: openImageSourcePickerBottomSheet,
      ),
    ];
  }

  void openImageSourcePickerBottomSheet() {
    final sheet = SelectUserImageBottomSheet(
      context: context,
    );

    showModalBottomSheet(
      context: context,
      builder: (context) {
        return sheet.widget;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final user = getUser();

    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          AppBar(
            backgroundColor: Colors.transparent,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_rounded,
                color: Colors.white,
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
            title: Text('Foto de perfil'),
            actions: buildActions(context),
          ),
          Expanded(
            child: Center(
              child: InteractiveViewer(
                child: Hero(
                  tag: 'user_img',
                  child: Image.network(user.imageUrl),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
