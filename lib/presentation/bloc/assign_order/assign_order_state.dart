import 'package:equatable/equatable.dart';
import 'package:easy_logistics/domain/model/assign_order_model.dart';

abstract class AssignOrderState extends Equatable {
  const AssignOrderState();

  @override
  List<Object?> get props => [];
}

class AssignOrderInitial extends AssignOrderState {}

class AssignOrderLoading extends AssignOrderState {}

class AssignOrderSuccess extends AssignOrderState {
  final AssignOrderModel result;

  const AssignOrderSuccess(this.result);

  @override
  List<Object?> get props => [result];
}

class AssignOrderFailure extends AssignOrderState {
  final String message;

  const AssignOrderFailure(this.message);

  @override
  List<Object?> get props => [message];
}
