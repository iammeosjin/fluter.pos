import 'package:flutter/material.dart';

class CustomListTiles {
  static Widget drawerListTile(BuildContext context, { IconData icon, String title, Function onTap }) {
    return Padding(
      padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
      child: InkWell(
        splashColor: Theme.of(context).primaryColor,
        onTap: onTap,
        child: Container(
          height: 40,
          child: Row(
            children: <Widget>[
              Icon(
                icon,
                color: Theme.of(context).primaryColor,
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Text(title),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Widget itemListTile(BuildContext context, { String image, String title }) {
    return Padding(
      padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
      child: InkWell(
        onTap: () {},
        child: Row(
          children: <Widget>[
            Image(
              image: AssetImage(image),
              fit: BoxFit.cover,
              height: 48.0,
              width: 48.0,
            ),
            SizedBox(width: 10.0),
            Expanded(
              child: Container(
                height: 48,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Container(
                          padding: EdgeInsets.only(right: 13.0),
                          child: Text(
                            title,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 17.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}