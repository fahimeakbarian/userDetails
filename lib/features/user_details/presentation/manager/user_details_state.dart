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

  const UserDetailsSuccess(

      {required this.id,
        required this.name,
        required this.email,
        required this.buttonLoading,
        required this.submitSuccess,
     });

  final String name;
  final int id;
  final String email;
  final bool buttonLoading;
  final bool submitSuccess;


  @override
  List<Object> get props => [name, id, email,buttonLoading,submitSuccess];

  UserDetailsSuccess copyWith({
    String? name,
    String? email,
    int? id,
    bool? buttonLoading,
    bool? submitSuccess

  }) {
    return UserDetailsSuccess(
      name: name ?? this.name,
      email: email ?? this.email,
      id: id ?? this.id,
      buttonLoading: buttonLoading ?? this.buttonLoading,
      submitSuccess: submitSuccess ?? this.submitSuccess,
    );
  }
}

class UserDetailsFailure extends UserDetailsState {

  const UserDetailsFailure({required this.errorMessage});

  final String errorMessage;

  @override
  List<Object> get props => [errorMessage];
}