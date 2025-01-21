import 'package:flutter/material.dart';
import 'package:user_details/Core/network/failure.dart';

class ErrorNetWorkWidget extends StatelessWidget {
  const ErrorNetWorkWidget(
      {super.key, this.title,
        //required this.retryFunc,
        this.failure});

  final String? title;
  //final Function retryFunc;
  final Failure? failure;

  @override
  Widget build(BuildContext context) {
    TextTheme txtTheme = Theme.of(context).textTheme;
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.cloud_off,
            size: 120,
            color: colorScheme.primary,
          ),
          Text(
            title ?? 'app.Error',
            style: txtTheme.titleLarge!.copyWith(color: colorScheme.primary),
          ),
          // Text(
          //  failure.toString() ,
          //   style: txtTheme.titleLarge!.copyWith(color: colorScheme.primary),
          // ),
          Text(
            'app.ErrorDescription',
            style: txtTheme.bodySmall!.copyWith(color: colorScheme.primary),
          ),
          SizedBox(
            width: 150,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
              child: FilledButton(
                  onPressed: () {},
                  child: const Row(
                    children: [
                      Icon(
                        Icons.refresh,
                        size: 18,
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Text('global.actions.refresh')
                    ],
                  )),
            ),
          )
        ],
      ),
    );
  }
}
