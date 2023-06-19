import 'package:flutter/material.dart';
import 'package:flutter_proj/screens/signin_screen.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:flutter_proj/screen_quiz/welcome/welcome_screen.dart';
import 'package:camera/camera.dart';
import 'models/Questions.dart';
import 'vision_detector_views/pose_detector_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter_proj/dino/vision_detector_views/pose_detector_view_dino.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:flame/flame.dart';
import 'package:path_provider/path_provider.dart';

import 'package:flutter_proj/dino/old_main.dart';
import 'package:flutter_proj/dino/models/settings.dart';
import 'package:flutter_proj/dino/models/player_data.dart';

import 'package:camera/camera.dart';

List<CameraDescription> cameras = [];
final Changer changer = Changer();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Flame.device.fullScreen();
  Flame.device.setPortrait();

  await Firebase.initializeApp(
    //options: DefaultFirebaseOptions.currentPlatform,
  );
  cameras = await availableCameras();

  runApp(const MyApp());
  await initHive();
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

JustDinomain() {
  runApp(const JustStyle());
}

class JustStyle extends StatelessWidget {
  const JustStyle({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: Column(
        children: [
          const SizedBox(
            width: 384,
            height: 500,
            child: DinoRunApp(),
          ),
          SizedBox(
            width: 384,
            height: 300,
            child: PoseDetectorViewDino(),
          ),
        ],
      )),
    );
  }
}

Future<void> initHive() async {
  // For web hive does not need to be initialized.
  if (!kIsWeb) {
    final dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
  }

  Hive.registerAdapter<PlayerData>(PlayerDataAdapter());
  Hive.registerAdapter<Settings>(SettingsAdapter());
}

class Changer extends ChangeNotifier {
  int btnPressed = -1;
  bool positionCapture = false;
  double poseStanding = 0;

  int selectedOpt_quiz = -1; //
  int selectedOpt_dino = 0;

  int frame = 0;
  double noseFix = 0;
  bool valueFixed = false;
  bool once = true;

  bool headUp = false;
  bool skip = false;
  int skipFrame = 0;
  late Question myQuestion; //

  void notify() {
    notifyListeners();
  }
}
