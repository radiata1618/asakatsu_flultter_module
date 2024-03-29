import 'package:asakatsu_flultter_module/UIs/walkingForStopRing.dart';
import 'package:asakatsu_flultter_module/common/UI/commonButtonUI.dart';
import 'package:asakatsu_flultter_module/common/UI/commonPushUI.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vibration/vibration.dart';

import 'calcForStopRing.dart';

class RingRoot extends ConsumerWidget {
  const RingRoot({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final player = AudioPlayer();
    player.play(AssetSource('sounds/bgm.wav'),volume:100);
    vibe();


    return Scaffold(
        body: Column(
      children: [
        Expanded(child: Container(color:Colors.green)),
        commonButtonSecondaryColorRound(text: "Stop ring", onPressed: () {
          stopSoundsAndVibe(player);
        }),
        commonButtonSecondaryColorRound(text: "Stop by calc", onPressed: () {
          stopSoundsAndVibe(player);
          commonNavigatorPushSlideHorizonReplacement(context, const CalcForStopRing());
        }),
        commonButtonSecondaryColorRound(text: "Stop by walking", onPressed: () {
          stopSoundsAndVibe(player);
          commonNavigatorPushSlideHorizonReplacement(context, const WakingForStopRing());
        })
      ],
    ));
  }
}

Future<void> vibe()async {
  Vibration.vibrate(duration:300000);
}

void stopSoundsAndVibe(AudioPlayer player){
  player.pause();
  player.dispose();
  Vibration.cancel();

}
