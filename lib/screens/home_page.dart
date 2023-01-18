import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/flag/flag_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<FlagBloc, FlagState>(builder: (context, state) {
        if (state is FlagLoaded) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: state.listIndexSelected.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          print("value  ==== ${state.listIndexSelected[index]}");
                          print("index  ==== ${index}");
                          if (state.listIndexSelected[index] != -1) {
                            context.read<FlagBloc>().add(OnPressUpFlagEvent(indexSelectedValue: state.listIndexSelected[index], indexSelected: index));
                          }
                        },
                        child: Container(
                          height: 120,
                          width: 120,
                          color: state.listIndexSelected[index] != -1
                              ? state
                                  .flagColorList[state.listIndexSelected[index]]
                                  .flagColor
                              : Colors.grey,
                          margin: const EdgeInsets.only(right: 10),
                        ),
                      );
                    },
                  ),
                ),
               const Spacer(),
                Expanded(
                    flex: 4,
                    child: GridView.builder(
                      itemBuilder: (context, index) {
                        return AbsorbPointer(
                          absorbing: false,
                          child: GestureDetector(
                            onTap: () {
                              if (state.listIndexSelected
                                      .where((element) => element == index)
                                      .isEmpty &&
                                  state.listIndexSelected
                                      .where((element) => element == -1)
                                      .isNotEmpty) {
                                context
                                    .read<FlagBloc>()
                                    .add(OnPressDownFlagEvent(indexColor: index));
                              }
                            },
                            child: Container(
                              height: 100,
                              width: 100,
                              color: state.flagColorList[index].isPress
                                  ? state.flagColorList[index].flagColor
                                  : Colors.grey,
                            ),
                          ),
                        );
                      },
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10),
                      itemCount: state.flagColorList.length,
                    )),
              ],
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      }),
    );
  }
}
