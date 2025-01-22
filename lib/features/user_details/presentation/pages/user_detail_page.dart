import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_details/Core/Utils/config.dart';
import 'package:user_details/Core/Utils/enums.dart';
import 'package:user_details/Core/service-locator/service_locator.dart';
import 'package:user_details/Core/widgets/error_network_widget.dart';
import 'package:user_details/Core/widgets/loading_widget.dart';
import 'package:user_details/features/user_details/presentation/manager/user_details_cubit.dart';

import 'package:user_details/features/user_details/presentation/pages/compact_layout/user_details_page-compact-layout.dart';
import 'package:user_details/features/user_details/presentation/pages/expand_layout/user_details_page-expand-layout.dart';

class UserDetailsPage extends StatefulWidget {
  const UserDetailsPage({super.key});

  @override
  State<UserDetailsPage> createState() => _UserDetailsPageState();
}

class _UserDetailsPageState extends State<UserDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<UserDetailsCubit>()..getUserDetails(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('User Details'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              BlocListener<UserDetailsCubit, UserDetailsState>(
                listener: (context, state) {
                  if (state is UserDetailsSuccess &&
                      state.submitSuccess &&
                      state.apiStatus == ApiStatus.finishWithSuccess) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('User Phone submitted successfully'),
                      ),
                    );
                  } else if (state is UserDetailsSuccess &&
                      !state.submitSuccess &&
                      state.apiStatus == ApiStatus.finishWithError) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('User Phone submission failed'),
                      ),
                    );
                  }
                },
                child: BlocBuilder<UserDetailsCubit, UserDetailsState>(
                  builder: (context, state) {
                    if (state is UserDetailsLoading) {
                      return const LoadingWidget();
                    } else if (state is UserDetailsSuccess) {
                      return const ContentWidget();
                    } else if (state is UserDetailsFailure) {
                      return ErrorNetWorkWidget(
                        title: state.errorMessage,
                      );
                    } else {
                      return Container();
                    }
                  },
                ),
              ),
            ],
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
          return const UserDetailsPageCompactLayout();
        } else {
          return const UserDetailsPageExpandLayout();
        }
      },
    );
  }
}
