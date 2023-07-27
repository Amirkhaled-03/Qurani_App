import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:qurani/constants.dart';
import 'package:qurani/helpers/custum_SnackBar.dart';
import 'package:qurani/models/surah_model.dart';
import 'package:qurani/services/audio_services.dart';

class SurahPage extends StatefulWidget {
  const SurahPage({super.key});
  static String id = "SurahPage";

  @override
  State<SurahPage> createState() => _SurahPageState();
}

class _SurahPageState extends State<SurahPage> {
  AudioServices allSurahAudio = AudioServices();
  String base = "Assets/quran-images";
  late SurahModel surah;

  late String? audio;
  int num = 1;
  List<Widget> pages = [];

  double? widthh, height;
  bool isplaying = false;
  late final AudioPlayer player;
  bool isSwitched = false;

  Duration duration = const Duration();
  Duration position = const Duration();

  @override
  void initState() {
    initplayer();
    super.initState();
  }

  // void dispose() {
  //   player.dispose();
  //   super.dispose();
  // }

  Future initplayer() async {
    player = AudioPlayer();

    // get the current duration
    player.onDurationChanged.listen((Duration d) {
      setState(() {
        duration = d;
      });
    });
    // seek our audio
    player.onPositionChanged.listen((Duration d) {
      setState(() {
        position = d;
      });
    });
    player.onPlayerComplete.listen((_) {
      setState(() {
        position = duration;
      });
    });
  }

  void playPause() async {
    if (isplaying) {
      player.pause();
      isplaying = false;
    } else {
      await player.play(UrlSource(
          'https://download.quranicaudio.com/qdc/abdul_baset/mujawwad/${surah.id}.mp3'));
      isplaying = true;
    }
    setState(() {});
  }

  void switched() {
    if (isSwitched) {
      isSwitched = false;
    } else {
      isSwitched = true;
    }
    setState(() {});
  }

  void playPauseSwitch() async {
    if (isplaying) {
      player.pause();
      isplaying = false;
    } else {
      audio =
          await allSurahAudio.getAya(surahId: surah.id, ayah: num.toString());
      await player.play(UrlSource(audio!));
      isplaying = true;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    widthh = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    surah = ModalRoute.of(context)!.settings.arguments as SurahModel;
    addPages(surah.pages[0], surah.pages[1]);
    return Scaffold(
      backgroundColor: const Color(0xfffffbef),
      // appBar: AppBar(
      //   title: Text(surah.arName),
      // ),
      body: ListView(
        padding: const EdgeInsets.only(top: 30),
        scrollDirection: Axis.horizontal,
        reverse: true,
        children: pages,
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        color: Colors.transparent,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            !isSwitched
                ? Container(
                    height: 140,
                    decoration: const BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(50)),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const SizedBox(width: 15),
                            IconButton(
                              onPressed: () {
                                player.seek(
                                    Duration(seconds: position.inSeconds - 5));
                              },
                              icon: const Icon(Icons.replay_5),
                              color: Colors.white,
                              iconSize: 40,
                            ),
                            IconButton(
                              onPressed: playPause,
                              icon: Icon(isplaying
                                  ? Icons.pause_circle
                                  : Icons.play_circle),
                              color: Colors.white,
                              iconSize: 35,
                            ),
                            IconButton(
                              onPressed: () {
                                player.seek(
                                    Duration(seconds: position.inSeconds + 5));
                              },
                              icon: const Icon(Icons.forward_5),
                              color: Colors.white,
                              iconSize: 40,
                            ),
                            const SizedBox(
                              width: 9,
                            )
                          ],
                        ),
                        Slider(
                          value: position.inSeconds.toDouble(),
                          onChanged: (value) async {
                            await player.seek(Duration(seconds: value.toInt()));
                            setState(() {});
                          },
                          min: 0,
                          max: duration.inSeconds.toDouble(),
                          activeColor: Colors.white,
                          inactiveColor: Colors.white54,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              prettyDuration(position),
                              style: const TextStyle(color: Colors.white),
                            ),
                            const SizedBox(width: 200),
                            Text(
                              prettyDuration(duration),
                              style: const TextStyle(color: Colors.white),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                : Container(
                    height: 140,
                    decoration: const BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(50)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            IconButton(
                                onPressed: () {
                                  num--;
                                  if (num > surah.numAyat) {
                                    showSnackBar(context);
                                    num--;
                                    setState(() {});
                                  }
                                  allSurahAudio.getAya(
                                      surahId: surah.id, ayah: num.toString());
                                  setState(() {});
                                },
                                icon: Transform.flip(
                                  flipX: true,
                                  child: const Icon(
                                    Icons.fast_forward,
                                    color: Colors.white,
                                    size: 35,
                                  ),
                                )),
                            IconButton(
                              onPressed: playPauseSwitch,
                              icon: Icon(isplaying
                                  ? Icons.pause_circle
                                  : Icons.play_circle),
                              color: Colors.white,
                              iconSize: 35,
                            ),
                            IconButton(
                              onPressed: () {
                                num++;
                                if (num > surah.numAyat) {
                                  showSnackBar(context);
                                  num--;
                                  setState(() {});
                                }
                                allSurahAudio.getAya(
                                    surahId: surah.id, ayah: num.toString());
                                setState(() {});
                              },
                              icon: const Icon(
                                Icons.fast_forward,
                                color: Colors.white,
                                size: 35,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "$num/${surah.numAyat}",
                          style: const TextStyle(
                              color: Colors.white, fontSize: 15),
                        )
                      ],
                    ),
                  ),
            Positioned(
              top: -26,
              child: IconButton(
                onPressed: switched,

                icon: const Icon(Icons.swap_vert,
                    color: Colors.white,
                    shadows: <Shadow>[
                      Shadow(color: Colors.grey, blurRadius: 15)
                    ]),
                iconSize: 50,
                // color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void addPages(int start, int end) {
    for (int i = start; i <= end; i++) {
      pages.add(Image.asset(
        "$base/$i.png",
        width: widthh,
        height: 650,
      ));
    }
  }

  String prettyDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return '${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds';
  }
}
