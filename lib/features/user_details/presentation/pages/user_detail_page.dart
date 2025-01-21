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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'UserDetails',
        ),
      ),
      body: BlocProvider(
        create: (context) => getIt<UserDetailsCubit>()..getUserDetails(),
        child: BlocConsumer<UserDetailsCubit, UserDetailsState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            Widget contentWidget = Container();
            if (state is UserDetailsLoading) {
              contentWidget = const LoadingWidget();
            }
            else if (state is UserDetailsSuccess) {
              contentWidget =  ContentWidget();
            }
            else if (state is UserDetailsFailure) {
              contentWidget = ErrorNetWorkWidget(
                  title: state.errorMessage
                  //retryFunc: () => context.read<UserDetailsBloc>()..add(GetUserDetails())
                  );
            }
            return contentWidget;
          },
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
          return  UserDetailsPageCompactLayout();
        } else {
          return const UserDetailsPageExpandLayout();
        }
      },
    );
  }
}
