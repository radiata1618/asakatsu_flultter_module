import 'package:asakatsu_flultter_module/UIs/rootProvider.dart';
import 'package:asakatsu_flultter_module/UIs/viewAlarmTimePatternUI.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:core';

import '../common/commonValues.dart';

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
    final _selectedIndex = ref.watch(_selectedIndexProvider);

    return Scaffold(
      body: routeElement(
          _selectedIndex,
          ref),
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor:commonColorSecondary,
          type: BottomNavigationBarType.fixed, // これを書かないと3つまでしか表示されない
          items: ref.watch(bottomNavigationBarItemsProvider.notifier)
              .bottomNavigationBarItems,
          currentIndex: _selectedIndex,
          //selectedItemColor: Colors.black,
          onTap: (int index) {
            ref.read(bottomNavigationBarItemsProvider.notifier)
                .activateButton(_selectedIndex, index);
            ref.read(_selectedIndexProvider.state).update((state) => index);
          }),
    );
  }

  Widget routeElement(
      int selectedIndex, WidgetRef ref) {

    // if(ref.watch(userDataProvider).userData["userType"]=="1"){
    //   switch (selectedIndex) {
    //     case 0:
    //       return SearchUsersMainPage();
    //     case 1:
    //       return Talk();
    //     case 2:
    //       return LessonListRoot();
    //     default:
    //       return MyPage();
    //   }
    // }else{
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
          return ViewAlarmTimePattern();
      }

    // }
  }
}
