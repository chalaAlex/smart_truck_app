import 'package:equatable/equatable.dart';

class AssignOrderGroupResponseModel extends Equatable {
  final AssignOrderGroupResponseDataModel? data;

  const AssignOrderGroupResponseModel(
    this.data,
  );

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class AssignOrderGroupResponseDataModel extends Equatable {
  final String? assignmentCode;
  final List<String?> orderGroups;

  const AssignOrderGroupResponseDataModel(
    this.assignmentCode,
    this.orderGroups,
  );

  @override
  // TODO: implement props
  List<Object?> get props => [assignmentCode, orderGroups];
}
