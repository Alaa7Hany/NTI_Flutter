// ignore_for_file: constant_identifier_names

import 'dart:ui';

import '../cache/cache_keys.dart';

abstract class TranslationKeys {
  static const Locale localeEN = Locale(CacheKeys.keyEN);
  static const Locale localeAR = Locale(CacheKeys.keyAR);
  static const welcomeToDoIt = "welcome To\nDo It !";
  static const readyToConquer =
      "Ready to conquer your tasks? Let's Do It together.";
  static const letStart = "Let’s Start";
  static const register = "Register";
  static const login = "login";
  static const hello = "hello";
  static const addTask = "addTask";
  static const title = "title";
  static const description = "description";
  static const group = "group";
  static const endDate = "endDate";
  static const settings = "Settings";
  static const language = "language";
  static const AR = "AR";
  static const EN = "EN";
  static const updateProfile = "Update Profile";
  static const changePassword = "Change Password";
}
