import 'package:eticon_api/eticon_api.dart';
import 'package:eticon_listner_example/screens/authorization_screen/authorization_screen_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  Api.init(baseUrl: 'https://eticon-pingpong-api.herokuapp.com/', bearerToken: false);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 667),
      builder:()=> MaterialApp(
        localizationsDelegates: [
          DefaultMaterialLocalizations.delegate,
          DefaultWidgetsLocalizations.delegate,
        ],
        debugShowCheckedModeBanner: false,
        home: AuthorizationScreenProvider(),
      ),
    );
  }
}

