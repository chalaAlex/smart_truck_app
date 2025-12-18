// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'assign_order_event.dart';
// import 'assign_order_state.dart';
// import 'package:easy_logistics/domain/usecase/assign_order_usecase.dart';

// class AssignOrderBloc extends Bloc<AssignOrderEvent, AssignOrderState> {
//   final AssignOrderUsecase assignOrderUsecase;

//   AssignOrderBloc(this.assignOrderUsecase) : super(AssignOrderInitial()) {
//     on<AssignOrderRequested>(_onAssignOrderRequested);
//   }

//   Future<void> _onAssignOrderRequested(
//     AssignOrderRequested event,
//     Emitter<AssignOrderState> emit,
//   ) async {
//     emit(AssignOrderLoading());

//     final result = await assignOrderUsecase(
//       AssignOrderUsecaseInput(event.carrierCode, event.orderCodes),
//     );

//     result.fold(
//       (failure) => emit(AssignOrderFailure(failure.message ?? "Unknown error")),
//       (success) => emit(AssignOrderSuccess(success)),
//     );
//   }
// }
