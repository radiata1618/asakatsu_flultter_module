import 'package:asakatsu_flultter_module/common/UI/commonTextUI.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vibration/vibration.dart';
import 'dart:math' as math;

import '../common/UI/commonTextFormUI.dart';

class WakingForStopRing extends ConsumerWidget {
  const WakingForStopRing( {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var rand = math.Random();
    int a = rand.nextInt(100);
    int b = rand.nextInt(100);
    String calcStr = a.toString() + "+" + b.toString();
    int answer = a + b;

    final player = AudioPlayer();
    player.play(AssetSource('sounds/bgm.wav'), volume: 100);
    vibe();

    return Scaffold(
        body: Column(
          children: [
            Expanded(
                child: Container(
                    color: Colors.black12, child: commonText16BlackLeft(calcStr))),
            commonTextBoxBordered(text: 'answer',
                onChanged: (String value) {
                  if(int.parse(value)==answer){
                    stopSoundsAndVibe(player);
                  }
                }),
          ],
        ));
  }
}

Future<void> vibe() async {
  Vibration.vibrate(duration: 300000);
}

void stopSoundsAndVibe(AudioPlayer player) {
  player.pause();
  player.dispose();
  Vibration.cancel();
}
