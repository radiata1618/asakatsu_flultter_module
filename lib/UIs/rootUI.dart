import 'package:asakatsu_flultter_module/UIs/ringRootUI.dart';
import 'package:asakatsu_flultter_module/UIs/rootProvider.dart';
import 'package:asakatsu_flultter_module/UIs/viewAlarmTimePatternUI.dart';
import 'package:asakatsu_flultter_module/common/UI/commonPushUI.dart';
import 'package:asakatsu_flultter_module/daoIsar/alarmDaoIsar.dart';
import 'package:asakatsu_flultter_module/daoIsar/alarmPatternDaoIsar.dart';
import 'package:asakatsu_flultter_module/entityIsar/alarmPatternEntityIsar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:core';

import '../common/commonValues.dart';
import '../common/logic/commonLogicAlarm.dart';
import '../entityIsar/alarmEntityIsar.dart';

final _selectedIndexProvider = StateProvider.autoDispose((ref) {
  return 0;
});

class Root extends ConsumerWidget {
  const Root({
    Key? key,
  }) : super(key: key) ;


  @override
  Widget build(BuildContext context, WidgetRef ref) {

    ref.read(bottomNavigationBarItemsProvider.notifier).initialize(ref);
    final selectedIndex = ref.watch(_selectedIndexProvider);

    return Scaffold(
      body: routeElement(
          selectedIndex,
          ref),

      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor:commonColorSecondary,
          type: BottomNavigationBarType.fixed,
          items: ref.watch(bottomNavigationBarItemsProvider.notifier)
              .bottomNavigationBarItems,
          currentIndex: selectedIndex,
          onTap: (int index) {
            ref.read(bottomNavigationBarItemsProvider.notifier)
                .activateButton(selectedIndex, index);
            ref.read(_selectedIndexProvider.state).update((state) => index);
          })
    );
  }

  Widget routeElement(
      int selectedIndex, WidgetRef ref) {

      switch (selectedIndex) {
        case 0:
          return const ViewAlarmTimePattern();
        // case 1:
        //   return SearchUsersMainPage();
        // case 2:
        //   return Talk();
        // case 3:
        //   return LessonListRoot();
        default:
          return const RingRoot();
      }

    // }
  }


}
