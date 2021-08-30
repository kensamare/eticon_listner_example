
import 'package:eticon_listner_example/global_utils/project_color.dart';
import 'package:eticon_listner_example/global_widget/buttons/main_button.dart';
import 'package:eticon_listner_example/global_widget/project_text_field.dart';
import 'package:eticon_listner_example/global_widget/texts/project_text_open_sans.dart';
import 'package:eticon_listner_example/screens/authorization_screen/cubit/authorization_screen_cubit.dart';
import 'package:eticon_listner_example/screens/authorization_screen/cubit/authorization_screen_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthorizationScreen extends StatefulWidget {

  @override
  _AuthorizationScreenState createState() => _AuthorizationScreenState();
}

class _AuthorizationScreenState extends State<AuthorizationScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _loginController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  FocusNode _loginFocus = FocusNode();
  FocusNode _passwordFocus = FocusNode();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        _loginFocus.unfocus();
        _passwordFocus.unfocus();
      },
      child: Scaffold(
        body: BlocListener<AuthorizationScreenCubit, AuthorizationScreenState>(
          listener: (context, state) {
            if (state is AuthorizationScreenLoadedState) {
              Navigator.of(context).pop();
            }
          },
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 47.w),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ProjectTextOpenSans(
                      text: 'Авторизация',
                      size: 24,
                      color: ProjectColors.violet,
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 30.w,
                          ),
                          ProjectTextField(
                            focusNode: _loginFocus,
                            controllerForm: _loginController,
                            hintText: 'Логин',
                            validate: (val) => val!.isEmpty
                                ? 'Поле не может быть пустым'
                                : null,
                          ),
                          SizedBox(
                            height: 12.w,
                          ),
                          ProjectTextField(
                            focusNode: _passwordFocus,
                            controllerForm: _passwordController,
                            hintText: 'Пароль',
                            validate: (val) => val!.isEmpty
                                ? 'Поле не может быть пустым'
                                : null,
                          ),
                          SizedBox(
                            height: 28.w,
                          ),
                        ],
                      ),
                    ),
                    MainButton(
                      text: 'Вход',
                      onPressed: () {
                        if(_formKey.currentState!.validate()){
                          _loginFocus.unfocus();
                          _passwordFocus.unfocus();
                          showDialog(
                            useRootNavigator: false,
                            context: context,
                            builder: (BuildContext context) {
                              return Center(child: CupertinoActivityIndicator());
                            },
                            barrierDismissible: false,
                            barrierColor: ProjectColors.white.withOpacity(0.3),
                          );
                          BlocProvider.of<AuthorizationScreenCubit>(context)
                              .sendData(login: this._loginController.text, password: this._passwordController.text);
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
