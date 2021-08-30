import 'package:eticon_listner_example/screens/authorization_screen/authorization_scren.dart';
import 'package:eticon_listner_example/screens/authorization_screen/cubit/authorization_screen_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthorizationScreenProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthorizationScreenCubit>(
      create: (context) => AuthorizationScreenCubit(),
      child: AuthorizationScreen(),
    );
  }
}
