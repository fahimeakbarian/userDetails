import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_details/Core/Utils/config.dart';
import 'package:user_details/Core/service-locator/service_locator.dart';
import 'package:user_details/Core/service-locator/service_locator_imports.dart';
import 'package:user_details/Core/widgets/error_network_widget.dart';
import 'package:user_details/Core/widgets/loading_widget.dart';
import 'package:user_details/features/user_details/presentation/pages/compact_layout/user_details_page-compact-layout.dart';
import 'package:user_details/features/user_details/presentation/pages/expand_layout/user_details_page-expand-layout.dart';

class UserDetailsPage extends StatefulWidget {
  const UserDetailsPage({super.key});

  @override
  State<UserDetailsPage> createState() => _UserDetailsPageState();
}

class _UserDetailsPageState extends State<UserDetailsPage> {

  final _phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<UserDetailsCubit>()..getUserDetails(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('User Details'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BlocBuilder<UserDetailsCubit, UserDetailsState>(
                  builder: (context, state) {
                    if (state is UserDetailsLoading) {
                      return LoadingWidget();
                    } else if (state is UserDetailsSuccess) {
                      return ContentWidget();
                    } else  if( state is UserDetailsFailure){
                      return ErrorNetWorkWidget(
                          title: state.errorMessage
                        //retryFunc: () => context.read<UserDetailsBloc>()..add(GetUserDetails())
                      );
                    }else{
                      return Container();
                    }
                  },
                ),
                SizedBox(height: 20),
                // Phone number input
                TextFormField(
                  controller: _phoneController,
                  decoration: InputDecoration(
                    labelText: 'Phone Number',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    // Regex for validating Iranian phone number
                    final phoneRegex = RegExp(r'^(\+98|0)?9\d{9}$');
                    if (!phoneRegex.hasMatch(value ?? '')) {
                      return 'Please enter a valid Iranian phone number';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                // Submit button
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        // Call the method to submit the phone number
                        //context.read<UserDetailsCubit>().submitPhoneNumber(_phoneController.text);
                      }
                    },
                    child: Text('Submit'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ContentWidget extends StatelessWidget {
  const ContentWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < Config.maxWidth) {
          return  const UserDetailsPageCompactLayout();
        } else {
          return const UserDetailsPageExpandLayout();
        }
      },
    );
  }
}
