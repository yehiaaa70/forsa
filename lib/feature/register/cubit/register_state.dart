part of 'register_cubit.dart';

@immutable
abstract class RegisterState {}

class RegisterInitial extends RegisterState {}


class RegisterCitiesLoading extends RegisterState {}
class RegisterCitiesLoaded extends RegisterState {}
class RegisterCitiesError extends RegisterState {}


class PickImageSuccess extends RegisterState {}

class GetUserDataLoading extends RegisterState {}
class GetUserDataLoaded extends RegisterState {}
class ProfileUpdateLoading extends RegisterState {}


class RegisterCompleteLoading extends RegisterState {}
class RegisterCompleteLoaded extends RegisterState {}
class RegisterCompleteError extends RegisterState {}

class RegisterNewLoading extends RegisterState {}
class RegisterNewLoaded extends RegisterState {}
class RegisterNewError extends RegisterState {}
