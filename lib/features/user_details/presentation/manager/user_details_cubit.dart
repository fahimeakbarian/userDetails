import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:user_details/Core/Utils/enums.dart';
import 'package:user_details/Core/usecase/usecase.dart';
import 'package:user_details/features/user_details/data/models/user_details_model.dart';
import 'package:user_details/features/user_details/domain/use_cases/get_user_details_usecase.dart';
import 'package:user_details/features/user_details/domain/use_cases/submit_user_phone_number_usecase.dart';

part 'user_details_state.dart';

class UserDetailsCubit extends Cubit<UserDetailsState> {
  UserDetailsCubit(
      {required this.getUserDetailsUseCase,
      required this.submitUserPhoneNumberUseCase})
      : super(UserDetailsInitial());

  final GetUserDetailsUseCase getUserDetailsUseCase;
  final SubmitUserPhoneNumberUseCase submitUserPhoneNumberUseCase;

  Future<void> submitPhoneNumber(String phoneNumber) async {
    var currentState = state as UserDetailsSuccess;

    emit(currentState.copyWith(buttonLoading: true));
    final result = await submitUserPhoneNumberUseCase
        .call(UserParams(phoneNumber: phoneNumber));
    result.fold((l) {
      emit(currentState.copyWith(
          buttonLoading: false,
          submitSuccess: false,
          apiStatus: ApiStatus.finishWithError));
    }, (r) {
      emit(currentState.copyWith(
          buttonLoading: false,
          submitSuccess: true,
          apiStatus: ApiStatus.finishWithSuccess));
    });
  }

  Future<void> getUserDetails() async {
    emit(UserDetailsLoading());
    final userApiResponse = await getUserDetailsUseCase.call(NoParams());
    userApiResponse.fold((l) {
      emit(UserDetailsFailure(errorMessage: l.message ?? 'api error'));
    }, (r) {
      var user = r as UserDetailsModel;
      emit(UserDetailsSuccess(
          name: user.name,
          id: user.id,
          email: user.email,
          apiStatus: ApiStatus.non,
          buttonLoading: false,
          submitSuccess: false));
    });
  }
}
