import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ipad_wallpapers/Controller/WallpaperController.dart';
import 'package:ipad_wallpapers/Model/Wallpaper.dart';

class Favourites extends StatefulWidget {
  @override
  _FavouritesState createState() => _FavouritesState();
}

class _FavouritesState extends State<Favourites> {
  WallpaperController wallpaperController = WallpaperController().to;

  @override
  Widget build(BuildContext context) {
    var wallpaperList = GetStorage().read('MyFavWalls');

    return Scaffold(
      body: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.7,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8
      ),
          itemCount: wallpaperList.length,
          itemBuilder: (context,index){
        return GridTile(
          child: Stack(
            fit: StackFit.expand,
            alignment: Alignment.bottomRight,
            children: [
              FadeInImage(
                placeholder: AssetImage('assets/loading_image.png'),
                image: NetworkImage(wallpaperList.elementAt(index).thumbnail),
                fit: BoxFit.cover,
              ),
              Positioned(
                bottom: 8,
                right: 8,
                child: IconButton(
                  icon: wallpaperController.isFav(wallpaperList.elementAt(index).wallpaperId)
                      ? Icon(Icons.favorite)
                      : Icon(Icons.favorite_border_rounded),
                  onPressed: () {
                       // wallpaperController.removeFromFav(wallpaper);
                  },
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
