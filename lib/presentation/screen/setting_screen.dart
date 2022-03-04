import 'package:bloc_training_flutterly/logic/cubit/setting_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Setting'),
      ),
      body: BlocListener<SettingCubit, SettingState>(
        listener: (context, state) {
          final notificationSnackBar = SnackBar(
            content: Text('App: ' +
                state.appNotification.toString().toUpperCase() +
                '  ,  Email: ' +
                state.emailNotification.toString().toUpperCase()),
            duration: Duration(milliseconds: 700),
          );
          ScaffoldMessenger.of(context).showSnackBar(notificationSnackBar);
          // TODO: implement listener}
        },
        child: BlocBuilder<SettingCubit, SettingState>(
          builder: (context, state) {
            return Container(
              child: Column(
                children: [
                  SwitchListTile(
                    value: state.appNotification,
                    onChanged: (newValue) {
                      context
                          .read<SettingCubit>()
                          .toggleAppNotification(newValue);
                    },
                    title: Text('App Notification'),
                  ),
                  SwitchListTile(
                    value: state.emailNotification,
                    onChanged: (newValue) {
                      context
                          .read<SettingCubit>()
                          .toggleEmailNotification(newValue);
                    },
                    title: Text('Email Notification'),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
