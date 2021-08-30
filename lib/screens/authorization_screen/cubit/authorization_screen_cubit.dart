
// import 'package:eticon_ping_pong/api/api.dart';
// import 'package:eticon_ping_pong/api/api_exception.dart';
import 'package:eticon_api/api_errors.dart';
import 'package:eticon_api/eticon_api.dart';
import 'package:eticon_listner_example/screens/authorization_screen/cubit/authorization_screen_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthorizationScreenCubit extends Cubit<AuthorizationScreenState>{
  AuthorizationScreenCubit() : super(AuthorizationScreenInitState());

  Future<void> sendData({required String login, required String password}) async{
    try{
      Map<String, dynamic> response = await Api.post(method: 'auth/', body: {'login': login, 'password': password}, testMode: true);
      if(response.containsKey('code')){
        if(response['code'] == 1){
          emit(AuthorizationScreenErrorState(errorText: 'Неверный логин или пароль'));
        }
        return;
      }
      await Api.setToken(response['token']);
      emit(AuthorizationScreenLoadedState());
    } on APIException catch(error){
      if(error.code == 0)
        emit(AuthorizationScreenErrorState(errorText: 'Нет соединения с Интернетом'));
      else{
        emit(AuthorizationScreenErrorState(errorText: 'Что-то пошло не так'));
      }
    }
  }

}