import 'package:equatable/equatable.dart';

abstract class AssignOrderEvent extends Equatable {
  const AssignOrderEvent();

  @override
  List<Object?> get props => [];
}

class AssignOrderRequested extends AssignOrderEvent {
  final String carrierCode;
  final List<String> orderCodes;

  const AssignOrderRequested(this.carrierCode, this.orderCodes);

  @override
  List<Object?> get props => [carrierCode, orderCodes];
}
