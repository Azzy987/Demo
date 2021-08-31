/*
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:ipad_wallpapers/Screens/Favourites.dart';
import 'package:ipad_wallpapers/Screens/FullScreen.dart';

class TodayWalls extends StatefulWidget {
  @override
  _TodayWallsState createState() => _TodayWallsState();
}

class _TodayWallsState extends State<TodayWalls> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(top: 8, left: 8, right: 8),
      child: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('Wallez').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            return StaggeredGridView.countBuilder(
              itemCount: snapshot.data.docs.length,
              crossAxisCount: 4,
              itemBuilder: (context, index) {
                String imgPath = snapshot.data.docs[index].data()['thumbnail'];
                return Material(

                  clipBehavior: Clip.hardEdge,
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  elevation: 8,
                  child: InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return FullScreen(imgPath);
                      }));
                    },
                    child: Hero(
                      tag: imgPath,
                      child: FadeInImage(
                        placeholder: AssetImage('assets/loading_image.png'),
                        image: NetworkImage(imgPath),
                        fit: BoxFit.cover,
                      ),
                      transitionOnUserGestures: true,
                    ),
                  ),
                );
              },
              staggeredTileBuilder: (int index) =>
                  new StaggeredTile.count(2, index.isEven ? 3 : 2),
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
            );
          }
        },
      ),
    );
  }
}
*/
