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

  const UserDetailsSuccess(this.name, this.id);
  final String name;
  final int id;

  @override
  List<Object> get props => [name, id];
}

class UserDetailsFailure extends UserDetailsState {

  const UserDetailsFailure(this.errorMessage);
  final String errorMessage;

  @override
  List<Object> get props => [errorMessage];
}