// import 'package:dartz/dartz.dart';
// import 'package:easy_logistics/data/network/failure.dart';
// import 'package:easy_logistics/data/requests/assign_order_group_request.dart';
// import 'package:easy_logistics/domain/model/assign_order_group_model.dart';
// import 'package:easy_logistics/domain/repository/repository.dart';
// import 'package:easy_logistics/domain/usecase/base_usecase.dart';

// class AssignOrderGroupUsecase
//     implements
//         BaseUseCase<AssignOrderGroupUsecaseInput,
//             AssignOrderGroupResponseModel> {
//   Repository _repository;

//   AssignOrderGroupUsecase(this._repository);

//   @override
//   Future<Either<Failure, AssignOrderGroupResponseModel>> call(
//       AssignOrderGroupUsecaseInput input) async {
//     return await _repository.assignOrderGroups(
//       AssignOrderGroupRequest(
//         input.carriercode,
//         input.orderGroupcodes,
//       ),
//     );
//   }
// }

// class AssignOrderGroupUsecaseInput {
//   String? carriercode;
//   List<String>? orderGroupcodes;

//   AssignOrderGroupUsecaseInput(
//     this.carriercode,
//     this.orderGroupcodes,
//   );
// }
