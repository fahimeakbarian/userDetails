import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_details/Core/Utils/config.dart';
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
      // body: BlocProvider(
      //   create: (context) => getIt<BrandBloc>()..add(GetUserDetails()),
      //   child: BlocConsumer<BrandBloc, UserDetailstate>(
      //     listener: (context, state) {
      //       // TODO: implement listener
      //     },
      //     builder: (context, state) {
      //       Widget contentWidget = Container();
      //       if (state is BrandLoading) {
      //         contentWidget = const LoadingWidget();
      //       }
      //       else if (state is UserDetailsuccess) {
      //         contentWidget = const ContentWidget();
      //       }
      //       else if (state is BrandFailure) {
      //         contentWidget = ErrorNetWorkWidget(
      //             failure: state.failure,
      //             retryFunc: () => context.read<BrandBloc>()..add(GetUserDetails()));
      //       }
      //       return contentWidget;
      //     },
      //   ),
      // ),
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