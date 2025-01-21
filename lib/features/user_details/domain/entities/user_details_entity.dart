import 'package:equatable/equatable.dart';

class UserDetailsEntity  extends Equatable {

  const UserDetailsEntity({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.phone,

  });

  final int id;
  final String name;
  final String username;
  final String email;
  final String phone;

  @override
  List<Object?> get props => [id,name,username,email,phone];

}
