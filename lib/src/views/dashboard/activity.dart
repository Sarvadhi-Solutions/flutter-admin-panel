import 'package:admin_dash/src/constant/color.dart';
import 'package:admin_dash/src/constant/string.dart';
import 'package:admin_dash/src/constant/text.dart';
import 'package:admin_dash/src/provider/stepper/bloc/stepper_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterx/flutterx.dart';

class Activity extends StatefulWidget {
  const Activity({Key? key}) : super(key: key);

  @override
  State<Activity> createState() => _ActivityState();
}

class _ActivityState extends State<Activity> {
  final StepperBloc _stepperBloc = StepperBloc();

  List<Step> steps = [
    Step(
      title: ConstText.lightText(text: 'Step 1'),
      content: ConstText.lightText(text: ''),
      subtitle: ConstText.lightText(
          text: 'Lorem Ipsum is simply dummy text of the printing.'),
      isActive: true,
    ),
    Step(
      title: ConstText.lightText(text: 'Step 2'),
      content: ConstText.lightText(text: ''),
      subtitle: ConstText.lightText(
          text: 'Lorem Ipsum is simply dummy text of the printing.'),
      isActive: true,
      state: StepState.complete,
    ),
    Step(
      title: ConstText.lightText(text: 'Step 3'),
      content: ConstText.lightText(text: ''),
      subtitle: ConstText.lightText(
          text: 'Lorem Ipsum is simply dummy text of the printing.'),
      isActive: true,
      state: StepState.complete,
    ),
    Step(
      title: ConstText.lightText(text: 'Step 4'),
      content: ConstText.lightText(text: ''),
      subtitle: ConstText.lightText(
          text: 'Lorem Ipsum is simply dummy text of the printing.'),
      isActive: true,
      state: StepState.complete,
    ),
  ];

  @override
  void initState() {
    _stepperBloc.add(const StepperEvent.changeIndex(0));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _stepperBloc,
      child: Card(
        shadowColor: ColorConst.primary.withOpacity(0.5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
        ),
        elevation: 7,
        child: ConstrainedBox(
          constraints: const BoxConstraints(minHeight: 465),
          child: Container(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ConstText.lightText(
                  text: Strings.activity,
                  fontWeight: FontWeight.bold,
                ),
                BlocBuilder<StepperBloc, StepperState>(
                  builder: (context, state) {
                    return state.when(
                      initial: () => FxBox.shrink,
                      success: (index) => Stepper(
                        controlsBuilder:
                            (BuildContext context, ControlsDetails details) {
                          return Row(
                            children: <Widget>[
                              TextButton(
                                onPressed: () {
                                  if (index + 1 != steps.length) {
                                    _stepperBloc.add(
                                        StepperEvent.changeIndex(index + 1));
                                  }
                                },
                                child: const Text('Continue'),
                              ),
                              TextButton(
                                onPressed: () {
                                  if (index != 0) {
                                    _stepperBloc.add(
                                        StepperEvent.changeIndex(index - 1));
                                  }
                                },
                                child: const Text('Cancle'),
                              ),
                            ],
                          );
                        },
                        steps: steps,
                        currentStep: index,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
