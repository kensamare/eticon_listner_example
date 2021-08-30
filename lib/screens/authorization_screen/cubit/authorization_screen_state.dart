abstract class AuthorizationScreenState {}

class AuthorizationScreenLoadingState extends AuthorizationScreenState{}
class AuthorizationScreenInitState extends AuthorizationScreenState{}
class AuthorizationScreenLoadedState extends AuthorizationScreenState{}
class AuthorizationScreenErrorState extends AuthorizationScreenState{
  final String errorText;

  AuthorizationScreenErrorState({required this.errorText});
}