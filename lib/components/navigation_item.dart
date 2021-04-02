import 'package:flutter/material.dart';

class NavigationItem extends StatelessWidget {
  const NavigationItem({
    Key key,
    @required String textButton,
    @required Widget screen,
    @required IconData icon,
  })  : _textButton = textButton,
        _screen = screen,
        _icon = icon,
        super(key: key);

  final String _textButton;
  final Widget _screen;
  final IconData _icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 8.0),
      child: Material(
        color: Theme.of(context).primaryColor,
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => _screen,
            ));
          },
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
