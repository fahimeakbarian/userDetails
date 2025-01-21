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

  const UserDetailsSuccess({required this.id,  required this.name, required this.email});
  final String name;
  final int id;
  final String email;

  @override
  List<Object> get props => [name, id,email];

  UserDetailsSuccess copyWith({
    String? name,
    String? email,
    int? id,

  }) {
    return UserDetailsSuccess(
      name: name ?? this.name,
      email: email ?? this.email,
      id: id ?? this.id,

    );
  }
}

class UserDetailsFailure extends UserDetailsState {

  const UserDetailsFailure({required this.errorMessage});
  final String errorMessage;

  @override
  List<Object> get props => [errorMessage];
}