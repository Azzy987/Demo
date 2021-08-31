import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class Wallpaper {
 String wallpaperId;
 String thumbnail;
 String image_url;

 Wallpaper(this.wallpaperId, this.thumbnail, this.image_url);

 Wallpaper.fromDocumentSnapshot(DocumentSnapshot snapshot)
 : this.wallpaperId = snapshot.id,
   this.thumbnail = snapshot['thumbnail'],
   this.image_url = snapshot['image_url'];


 var isFav = false.obs;
}