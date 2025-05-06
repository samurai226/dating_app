part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  static const ONBOARDING = _Paths.ONBOARDING;
  static const HOME = _Paths.HOME;
  static const LOGIN = _Paths.LOGIN;
  static const REGISTER = _Paths.REGISTER;
  static const PROFILE = _Paths.PROFILE;
  static const MATCHING_DISCOVER = _Paths.MATCHING_DISCOVER;
  static const CHAT_CONVERSATION = _Paths.CHAT_CONVERSATION;
  static const AUTH_LOGIN = _Paths.AUTH_LOGIN;
}

abstract class _Paths {
  _Paths._();

  static const ONBOARDING = '/onboarding';
  static const HOME = '/home';
  static const LOGIN = '/auth/login';
  static const REGISTER = '/auth/register';
  static const PROFILE = '/auth/profile';
  static const MATCHING_DISCOVER = '/matching/discover';
  static const CHAT_CONVERSATION = '/chat/conversation';
  static const AUTH_LOGIN = '/auth/login';
}
