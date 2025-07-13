import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_1/bloc/switch/switch_bloc.dart';
import 'package:flutter_bloc_1/bloc/switch/switch_event.dart';
import 'package:flutter_bloc_1/bloc/switch/switch_state.dart';

class SwitchScreen extends StatefulWidget {
  const SwitchScreen({super.key});

  @override
  State<SwitchScreen> createState() => _SwitchScreenState();
}

class _SwitchScreenState extends State<SwitchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<SwitchBloc, SwitchState>(
                buildWhen: (previous, current) =>
                    previous.isSwitch != current.isSwitch,
                builder: (context, state) {
                  print('switcgggg');

                  return Switch(
                    value: state.isSwitch,
                    onChanged: (n) {
                      context
                          .read<SwitchBloc>()
                          .add(EnableorDisableNotification());
                    },
                  );
                },
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          BlocBuilder<SwitchBloc, SwitchState>(
            buildWhen: (previous, current) => previous.slider != current.slider,
            builder: (context, state) {
              print('containerrr');
              return Container(
                height: 200,
                width: 360,
                color: Colors.red.withOpacity(state.slider),
              );
            },
          ),
          const SizedBox(
            height: 50,
          ),
          BlocBuilder<SwitchBloc, SwitchState>(
            buildWhen: (previous, current) => previous.slider != current.slider,
            builder: (context, state) {
              print('slideerr');

              return Slider(
                value: state.slider.toDouble(),
                onChanged: (w) {
                  context.read<SwitchBloc>().add(SliderEvent(w));
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
