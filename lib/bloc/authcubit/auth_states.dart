import 'package:flutter/material.dart';

sealed class AuthStates {}
final class AuthInitial extends AuthStates {}
final class Authloading extends AuthStates{}
final class AuthSuccess extends AuthStates{}
final class Authfailure extends AuthStates{
  String errMessage;

  Authfailure({required this.errMessage});
}
