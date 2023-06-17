import 'package:equatable/equatable.dart';
import 'package:forsa/core/models/error_model.dart';

abstract class Failure extends Equatable {
  final ErrorModel? errorModel;

  Failure({this.errorModel});
  @override
  List<Object?> get props => [];
}

class ServerFailure extends Failure {
  ServerFailure({super.errorModel});

}

class CacheFailure extends Failure {
  CacheFailure({super.errorModel});
}