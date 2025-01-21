import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_details/features/user_details/presentation/manager/user_details_cubit.dart';

class UserDetailsPageCompactLayout extends StatelessWidget {
   const UserDetailsPageCompactLayout({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var userDetails =
    context.select((UserDetailsCubit b) => (b.state as UserDetailsSuccess));
    return

       Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Display user name and email
          Text(
            'Name: ${userDetails.name}',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            'Email: ${userDetails.email}',
            style: TextStyle(fontSize: 16),
          ),
        ],
      )
    ;
  }
}
