/*
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:ipad_wallpapers/Screens/FullScreen.dart';

class Trending extends StatefulWidget {
  @override
  _TrendingState createState() => _TrendingState();
}

class _TrendingState extends State<Trending> {
  StreamSubscription<QuerySnapshot> subscription;
  List<DocumentSnapshot> wallpapersList;
  final CollectionReference collectionReference =
  FirebaseFirestore.instance.collection("Wallez");


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    subscription = collectionReference.snapshots().listen((datasnapshot) {
      setState(() {
        wallpapersList = datasnapshot.docs;
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    subscription?.cancel();
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: wallpapersList != null
            ? new StaggeredGridView.countBuilder(
          padding: const EdgeInsets.all(8.0),
          crossAxisCount: 4,
          itemCount: wallpapersList.length,
          itemBuilder: (context, i) {
            String imgPath = wallpapersList[i].data()['thumbnail'];
            return new Material(
              clipBehavior: Clip.antiAlias,
              elevation: 8.0,
              borderRadius:
              new BorderRadius.all(new Radius.circular(8.0)),
              child: new InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                       MaterialPageRoute(
                          builder: (context) =>
                           FullScreen(imgPath)));
                },
                child: Hero(
                  tag: imgPath,
                  child: FadeInImage(
                    image: NetworkImage(imgPath),
                    fit: BoxFit.cover,
                    placeholder: AssetImage("assets/loading_image.png"),
                  ),
                ),
              ),
            );
          },
          staggeredTileBuilder: (i) =>
          new StaggeredTile.count(2, i.isEven ? 2 : 3),
          mainAxisSpacing: 8.0,
          crossAxisSpacing: 8.0,
        )
            : Center(
          child: CircularProgressIndicator(),
        ));
  }
}*/
