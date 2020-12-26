import 'package:MyFood/modules/user/components/auth_screen_image.dart';
import 'package:flutter/material.dart';

import '../routes.dart';

class OnBoardingScreen extends StatefulWidget {
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  Widget get title {
    final theme = Theme.of(context);
    final textColor = Colors.white;

    return Row(
      children: [
        Icon(
          Icons.local_bar_rounded,
          color: textColor,
        ),
        SizedBox(width: 8),
        Text(
          'MyFood',
          style: theme.textTheme.headline6.copyWith(
            color: textColor,
          ),
        ),
      ],
    );
  }

  Widget get subtitle {
    final theme = Theme.of(context);
    final textColor = Colors.white;

    return Text(
      'Uma verdadeira experiência de beber.',
      style: theme.textTheme.headline5.copyWith(
        color: textColor,
        fontWeight: FontWeight.normal,
      ),
    );
  }

  Widget get image {
    final imageSize = 320.0;
    return Hero(
      tag: 'app_logo',
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: imageSize,
          maxWidth: imageSize,
        ),
        child: AuthScreenImage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textColor = Colors.white;
    return Scaffold(
      backgroundColor: theme.primaryColor,
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 72, horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                title,
                SizedBox(height: 32),
                subtitle,
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 32),
              child: image,
            ),
            SizedBox(
              height: 56,
              child: RaisedButton.icon(
                elevation: 0,
                color: theme.accentColor,
                textColor: textColor,
                icon: Icon(Icons.send_rounded),
                label: Text('ENTRAR'),
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed(loginRoute);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
