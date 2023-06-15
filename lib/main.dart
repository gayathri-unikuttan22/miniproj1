import 'package:flutter/material.dart';
import 'package:flutter_proj/screens/signin_screen.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:flutter_proj/screen_quiz/welcome/welcome_screen.dart';
import 'package:camera/camera.dart';
import 'models/Questions.dart';
import 'vision_detector_views/pose_detector_view.dart';
import 'package:firebase_core/firebase_core.dart';


List<CameraDescription> cameras = [];
final Changer changer = Changer();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  cameras = await availableCameras();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const SignInScreen(),
    );
  }
}

class Changer extends ChangeNotifier {
  bool positionCapture = false;
  double poseStanding = 0;
  int selectedOpt = -1; //
  late Question myQuestion; //

  void notify() {
    notifyListeners();
  }
}
