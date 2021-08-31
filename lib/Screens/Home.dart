import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ipad_wallpapers/Controller/WallpaperController.dart';
import 'package:ipad_wallpapers/Model/Wallpaper.dart';
import 'package:ipad_wallpapers/Screens/FullScreen.dart';
import 'package:ipad_wallpapers/colors.dart';
import 'package:paginate_firestore/paginate_firestore.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  WallpaperController wallpaperController = WallpaperController().to;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: Drawer(),
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          title: Text(
            'Wallpaper',
          ),
          actions: [
            IconButton(
                icon: Icon(
                  Icons.search,
                ),
                onPressed: () {})
          ],
        ),
        body: Container(
          margin: EdgeInsets.only(top: 8, left: 8, right: 8),
          child: PaginateFirestore(

            itemsPerPage: 12,
            initialLoader: Center(child: CircularProgressIndicator()),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio: 0.7),
            itemBuilder: (index, context, snapshot) {
              var data = snapshot.data() as Map;
              List<Wallpaper> list = [];
              /* list = data.entries
                  .map((element) =>
                      Wallpaper(element.key, element.key, element.key))
                  .toList();
              GetStorage().write('hell', data);*/
              // print('Length is ${data.length}');
              String wallpaperId = snapshot.id;

              Wallpaper wallpaper =
                  Wallpaper(wallpaperId, data['thumbnail'], data['image_url']);
              // print(wallpaperId);
              //  print(data.containsValue(wallpaperId));
              // print(data.containsKey(wallpaperId));
              // List<Wallpaper> ma = snapshot.data() as List<Wallpaper>;
              return GridTile(
                child: Stack(
                  fit: StackFit.expand,
                  alignment: Alignment.bottomRight,
                  children: [
                    FadeInImage(
                      placeholder: AssetImage('assets/loading_image.png'),
                      image: NetworkImage(data['thumbnail']),
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      bottom: 8,
                      right: 8,
                      child: IconButton(
                        icon: wallpaperController.isFav(wallpaperId)
                            ? Icon(Icons.favorite)
                            : Icon(Icons.favorite_border_rounded),
                        onPressed: () {
                          wallpaperController.isFav(wallpaperId)
                              ? wallpaperController.removeFromFav(wallpaper)
                              : wallpaperController.addToFav(wallpaper);
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
            query: FirebaseFirestore.instance
                .collection('Wallez')
                .orderBy('timestamp', descending: true),
            isLive: true,
            itemBuilderType: PaginateBuilderType.gridView,
          ),
        ),
      ),
    );
  }
}

/*StreamBuilder<QuerySnapshot>(
stream: FirebaseFirestore.instance.collection('Demo').snapshots(),
builder: (context, snapshot) {
final document = snapshot.data.docs;
if (snapshot.connectionState == ConnectionState.waiting) {
return Center(child: LinearProgressIndicator());
} else {
return GridView.builder(
itemCount: snapshot.data.docs.length,
gridDelegate:
SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
itemBuilder: (context, index) {
return GridTile(
child: Container(
margin: EdgeInsets.all(4),
padding: EdgeInsets.only(left: 16,top: 16),
color: Colors.deepPurpleAccent,
child: Stack(
children: [
Positioned(
right: 0,
bottom: 0,
child: IconButton(
icon: Icon(Icons.favorite_border),
onPressed: () {
setState(() {
});
},
color: Colors.black,
)),
Text(document[index].data()['image'],style: TextStyle(
color: Colors.white,
fontSize: 24,
fontWeight: FontWeight.w700
),),
],
),
),
);
},
);
}
},
),*/
