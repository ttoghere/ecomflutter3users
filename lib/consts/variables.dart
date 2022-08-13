import 'package:firebase_storage/firebase_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

String demoLogo =
    "https://scontent.fist2-3.fna.fbcdn.net/v/t39.30808-6/279418699_1464850347300483_3230164680752958616_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=C8QRyhqxzKkAX8-7fTs&_nc_ht=scontent.fist2-3.fna&oh=00_AT_SMjiG4mKYP7Dz1kTUsX9Lmbm8gTwHgXzdwMX5-7ujtA&oe=62FA6928";
SharedPreferences? sharedPreferences;

List<String> itemsImageList = [
  "images/login.png",
  "images/welcome.png",
];
