import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ipad_wallpapers/Controller/WallpaperController.dart';
import 'package:ipad_wallpapers/Screens/Categories.dart';
import 'package:ipad_wallpapers/Screens/Favourites.dart';
import 'package:ipad_wallpapers/Screens/Home.dart';
import 'package:ipad_wallpapers/colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  Get.put(WallpaperController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark
      ),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int _selectedItemIndex = 0;
  final _selectedPage = [
    Home(),
    Categories(),
    Favourites()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _selectedPage[_selectedItemIndex],
      bottomNavigationBar: Row(
        children: [
          BottomNavigationItem(icon: Icons.home, index: 0),
          BottomNavigationItem(icon: Icons.dashboard, index: 1),
          BottomNavigationItem(icon: Icons.favorite, index: 2),
        ],
      )
      /*BottomNavigationBar(items: [

      ],
      selectedItemColor: accentColor,
      unselectedItemColor: secondaryColor,
      showUnselectedLabels: false,
      showSelectedLabels: false,
        currentIndex: _currentIndex,
        onTap: (index){
       setState(() {
         _currentIndex = index;
       });
        },
      ),*/
    );
  }
  Widget BottomNavigationItem({required IconData icon,required int index}){
    return InkWell(
      onTap: (){
        setState(() {
          _selectedItemIndex = index;
        });
      },
      child: Container(
        height: 56,
        width: MediaQuery.of(context).size.width/3,
        decoration: index == _selectedItemIndex ? BoxDecoration(
          gradient: LinearGradient(colors: [
            accentColor.withOpacity(0.40),
            accentColor.withOpacity(0.10),
          ],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter),
          color: index == _selectedItemIndex ? secondaryColor : Colors.white,
          border: Border(
            bottom: BorderSide(
              width: 3,
              color: accentColor
            )
          )
        ) : null,
        child: Icon(icon, color: index == _selectedItemIndex ? accentColor : secondaryTextColor,),
      ),
    );
  }

}


