import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_details/Core/Utils/validation_util.dart';
import 'package:user_details/features/user_details/presentation/manager/user_details_cubit.dart';

class UserDetailsPageCompactLayout extends StatefulWidget {
  const UserDetailsPageCompactLayout({
    super.key,
  });

  @override
  State<UserDetailsPageCompactLayout> createState() =>
      _UserDetailsPageCompactLayoutState();
}

class _UserDetailsPageCompactLayoutState
    extends State<UserDetailsPageCompactLayout> {
  final _phoneController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var userDetailsState =
        context.select((UserDetailsCubit b) => (b.state as UserDetailsSuccess));
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Display user name and email
          Text(
            'Name: ${userDetailsState.name}',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            'Email: ${userDetailsState.email}',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 20),
          // Phone number input field
          TextFormField(
            controller: _phoneController,
            decoration: const InputDecoration(
              labelText: 'Phone Number',
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.phone,
            validator: validationMobile,
          ),
          const SizedBox(height: 20),
          // Submit button
          Center(
              child: ElevatedButton(
            onPressed: userDetailsState.buttonLoading
                ? null
                : () {
                    if (_formKey.currentState?.validate() ?? false) {
                      context.read<UserDetailsCubit>().submitPhoneNumber(
                            _phoneController.text,
                          );
                    }
                  },
            child: userDetailsState.buttonLoading
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Colors.white,
                    ),
                  )
                : const Text('Submit'),
          )),
        ],
      ),
    );
  }
}
