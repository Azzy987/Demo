import 'package:flutter/material.dart';
import 'package:ipad_wallpapers/colors.dart';

class FullScreen extends StatelessWidget {
  String imageUrl;

  FullScreen(this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Hero(
            transitionOnUserGestures: true,
            tag: imageUrl,
            child: FadeInImage(
             placeholder: NetworkImage(imageUrl),
              image: NetworkImage(imageUrl),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                child: IconButton(
                    icon: Icon(
                      Icons.arrow_downward,
                      color: accentColor,
                    ),
                    onPressed: null),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(50))),
              ),
              FlatButton(
                onPressed: () {},
                padding: EdgeInsets.symmetric(horizontal: 50,vertical: 12),
                child: Text(
                  'SET AS',
                  style: TextStyle(color: Colors.white,fontSize: 16),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50))),
                color: accentColor,
              ),
              Container(
                child: IconButton(
                    icon: Icon(
                      Icons.favorite_border,
                      color: accentColor,
                    ),
                    onPressed: null),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(50))),
              ),
            ],
          )
        ],
      ),
    );
  }
}
