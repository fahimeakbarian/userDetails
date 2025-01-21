import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:user_details/Core/usecase/usecase.dart';
import 'package:user_details/features/user_details/domain/use_cases/get_user_details_usecase.dart';
import 'package:user_details/features/user_details/domain/use_cases/submit_user_phone_number_usecase.dart';

part 'user_details_state.dart';

class UserDetailsCubit extends Cubit<UserDetailsState> {
  UserDetailsCubit(
      {required this.getUserDetailsUseCase,required this.submitUserPhoneNumberUseCase})
      : super(UserDetailsInitial());


  final GetUserDetailsUseCase getUserDetailsUseCase;
  final SubmitUserPhoneNumberUseCase submitUserPhoneNumberUseCase;


  // Future<void> submitPhoneNumber(String phoneNumber) async {
  //   emit(UserDetailsLoading());
  //
  //   try {
  //     // Execute the use case
  //     final result = await submitUserPhoneNumberUseCase(phoneNumber);
  //
  //     // On success
  //     emit(UserDetailsSuccess(result));
  //   } catch (error) {
  //     // On failure
  //     emit(UserDetailsFailure(error.toString()));
  //   }
  // }

  Future<void> getUserDetails() async {
    emit(UserDetailsLoading());

    try {

      final user = await getUserDetailsUseCase.call(NoParams());
      // emit(UserDetailsSuccess());
    } catch (error) {
      emit(UserDetailsFailure(error.toString()));
    }
  }
}
