import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ipad_wallpapers/Model/Wallpaper.dart';

class WallpaperController extends GetxController {
  WallpaperController get to => Get.find<WallpaperController>();

  GetStorage _getStorage = GetStorage();
  String listName = 'MyFavWalls';
  RxList<Wallpaper> favWalls = RxList<Wallpaper>.empty(growable: true);

  @override
  void onInit() {
    super.onInit();
    _getStorage.writeIfNull(listName, favWalls);
  }

  void addToFav(Wallpaper wallpaper) {
    var list = _getStorage.read(listName);
    if (!list.contains(wallpaper.wallpaperId)) {
      list.add(wallpaper);
      _getStorage.write(listName, list);
    }
    // FirebaseFirestore.instance
    //     .collection('Users')
    //     .doc('TestUserID')
    //     .collection('Favourites')
    //     .doc(wallpaperId)
    //     .set({
    //       'thumbnail': thumbnail,
    //       'image_url': imageUrl,
    //       'source': source,
    //     })
    //     .then((onValue) => print('Wallpaper added to favourites'))
    //     .catchError((onError) => print('Error Occured'));
  }

  void removeFromFav(Wallpaper wallpaper) {
    var list = _getStorage.read(listName);
    if (!list.contains(wallpaper.wallpaperId)) {
      list.remove(wallpaper);
      _getStorage.write(listName, list);
    }
    // FirebaseFirestore.instance
    //     .collection('Users')
    //     .doc('TestUserID')
    //     .collection('Favourites')
    //     .doc(wallpaper)
    //     .delete();

    print('wallpaper removed');
  }

  bool isFav(String wallpaperId) {
    return _getStorage.read(listName).contains(wallpaperId) ?? false;
  }
}
