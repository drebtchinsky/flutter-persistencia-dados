import 'package:flutter/material.dart';

class FeatureItem extends StatelessWidget {
  const FeatureItem(
    String textButton,
    IconData icon, {
    Key key,
    @required Function onClick,
  })  : _textButton = textButton,
        _onClick = onClick,
        _icon = icon,
        super(key: key);

  final String _textButton;
  final Function _onClick;
  final IconData _icon;

  get name => _textButton;

  get icon => _icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 8.0),
      child: Material(
        color: Theme.of(context).primaryColor,
        child: InkWell(
          onTap: () => _onClick(),
          child: Container(
            padding: EdgeInsets.all(8.0),
            height: 100,
            width: 150,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Icon(
                  _icon,
                  color: Colors.white,
                  size: 48.0,
                ),
                Text(
                  _textButton,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
