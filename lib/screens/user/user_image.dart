import 'dart:io';

import 'package:MyFood/modules/user/components/general/user_initials.dart';
import 'package:MyFood/modules/user/models/user_dto.dart';
import 'package:MyFood/modules/user/store/action_creators.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../modules/user/components/general/select_user_image_bottom_sheet.dart';
import '../../modules/user/store/selectors.dart';

class UserImageScreen extends StatefulWidget {
  @override
  _UserImageScreenState createState() => _UserImageScreenState();
}

class _UserImageScreenState extends State<UserImageScreen> {
  File _selectedImage;

  set selectedImage(File value) {
    setState(() {
      _selectedImage = value;
    });
  }

  final _imagePicker = ImagePicker();

  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(
          Icons.edit_rounded,
          color: Colors.white,
        ),
        onPressed: openImageSourcePickerBottomSheet,
      ),
    ];
  }

  void _pickImageFromGallery() async {
    final image = await _imagePicker.getImage(
      source: ImageSource.gallery,
      imageQuality: 100,
    );
    if (image != null) {
      selectedImage = File(image.path);
    }
    //TODO: push image to api to save the change
  }

  void _pickImageFromCamera() async {
    final image = await _imagePicker.getImage(
      source: ImageSource.camera,
      imageQuality: 100,
    );
    if (image != null) {
      selectedImage = File(image.path);
    }
    //TODO: push image to api to save the change
  }

  void _removeImage() async {
    final user = getUser();
    await updateUser(
      UserDto(
        userId: user.userId,
        cpf: user.cpf,
        name: user.name,
        email: user.email,
        phone: user.phone,
        imageUrl: '',
      ),
    );

    // Changes the state to provoke a rebuild
    selectedImage = null;
  }

  void openImageSourcePickerBottomSheet() {
    final sheet = SelectUserImageBottomSheet(
      context: context,
      pickFromGallery: _pickImageFromGallery,
      pickFromCamera: _pickImageFromCamera,
      removeImage: _removeImage,
    );

    showModalBottomSheet(
      context: context,
      builder: (context) {
        return sheet.widget;
      },
    );
  }

  Widget buildUserImage() {
    final user = getUser();

    if (_selectedImage != null) {
      return Image.file(_selectedImage);
    } else if (user.imageUrl.isNotEmpty) {
      return Image.network(user.imageUrl);
    }

    return SizedBox(
      child: CircleAvatar(
        backgroundColor: Theme.of(context).primaryColor,
        child: UserInitials(color: Colors.white),
      ),
      height: 112,
      width: 112,
    );
  }

  @override
  Widget build(BuildContext context) {
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
                  child: buildUserImage(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
