part of 'user_details_cubit.dart';

@immutable
abstract class UserDetailsState extends Equatable {
  const UserDetailsState();

  @override
  List<Object> get props => [];
}

class UserDetailsInitial extends UserDetailsState {}

class UserDetailsLoading extends UserDetailsState {}

class UserDetailsSuccess extends UserDetailsState {
  const UserDetailsSuccess({
    required this.id,
    required this.name,
    required this.email,
    required this.buttonLoading,
    required this.submitSuccess,
    required this.apiStatus,
  });

  final String name;
  final int id;
  final String email;
  final bool buttonLoading;
  final bool submitSuccess;
  final ApiStatus apiStatus;

  @override
  List<Object> get props =>
      [name, id, email, buttonLoading, submitSuccess, apiStatus];

  UserDetailsSuccess copyWith(
      {String? name,
      String? email,
      int? id,
      bool? buttonLoading,
      bool? submitSuccess,
      ApiStatus? apiStatus}) {
    return UserDetailsSuccess(
        name: name ?? this.name,
        email: email ?? this.email,
        id: id ?? this.id,
        buttonLoading: buttonLoading ?? this.buttonLoading,
        submitSuccess: submitSuccess ?? this.submitSuccess,
        apiStatus: apiStatus ?? this.apiStatus);
  }
}

class UserDetailsFailure extends UserDetailsState {
  const UserDetailsFailure({required this.errorMessage});

  final String errorMessage;

  @override
  List<Object> get props => [errorMessage];
}
