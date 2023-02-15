import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:audioplayers/audioplayers.dart';

class AlQuranDetails extends StatefulWidget {
  const AlQuranDetails({super.key});

  @override
  State<AlQuranDetails> createState() => _AlQuranDetailsState();
}

class _AlQuranDetailsState extends State<AlQuranDetails> {
  IconData? _selectedIcon;
  AudioPlayer audioPlayer = AudioPlayer();
  //final player = AudioPlayer();

  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  String? time(Duration duration) {
    String twodigits(int n) => n.toString().padLeft(2, '0');
    final hours = twodigits(duration.inHours);
    final minutes = twodigits(duration.inMinutes.remainder(60));
    final seconds = twodigits(duration.inSeconds.remainder(60));

    return [if (duration.inHours > 0) hours, minutes, seconds].join(':');
  }

  Future setAudio(data) async {
    audioPlayer.setReleaseMode(ReleaseMode.stop);

    audioPlayer.setSourceUrl(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("al_quran"),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios, size: 16.sp),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.favorite_outline,
            ),
          )
          // StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
          //   stream: checkFav(context),
          //   builder: (context, snapshot) {
          //     if (snapshot.data == null) return Text("");
          //     return IconButton(
          //       icon: snapshot.data!.docs.length == 0
          //           ? Icon(
          //               Icons.favorite_outline,
          //             )
          //           : Icon(
          //               Icons.favorite,
          //               color: Colors.red,
          //             ),
          //       onPressed: () {
          //         snapshot.data!.docs.length == 0
          //             ? addtoFavourite()
          //             : Fluttertoast.showToast(
          //                 msg: "Already Added",
          //                 toastLength: Toast.LENGTH_SHORT,
          //                 gravity: ToastGravity.SNACKBAR,
          //                 timeInSecForIosWeb: 1,
          //                 backgroundColor: Colors.deepOrange,
          //                 textColor: Colors.white,
          //                 fontSize: 13.0);
          //       },
          //     );
          //   },
          // ),
          // SizedBox(width: 5.w),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: 10.h, right: 16.w, left: 16.w),
            child: Column(
              children: [
                Container(
                  height: 140.h,
                  width: double.infinity.w,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(5)),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.network(
                        "https://cdn-gblnp.nitrocdn.com/ckHDmEwPmzNuYYSirDDoRUCcNbqqNPjc/assets/images/optimized/rev-05823da/wp-content/uploads/2021/07/Al_Fatiha_Thumbnail.png",
                        fit: BoxFit.fill,
                      )),
                ),
                Slider(
                    min: 0,
                    max: duration.inSeconds.toDouble(),
                    value: position.inSeconds.toDouble(),
                    onChanged: (value) async {
                      final position = Duration(seconds: value.toInt());
                      await audioPlayer.seek(position);
                      await audioPlayer.resume();
                    }),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(time(position) ?? ''),
                      Text(time(duration) ?? ''),
                    ],
                  ),
                ),
                CircleAvatar(
                  radius: 25.r,
                  child: IconButton(
                    onPressed: () async {
                      if (isPlaying) {
                        await audioPlayer.pause();
                      } else {
                        await audioPlayer.resume();
                      }
                    },
                    icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
                    iconSize: 30.sp,
                  ),
                
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
