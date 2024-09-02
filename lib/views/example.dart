import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RecodeScreen extends StatefulWidget {
  final int code;
  const RecodeScreen({Key? key, this.code = 0}) : super(key: key);
  @override
  _RecodeScreenState createState() => _RecodeScreenState();
}

class _RecodeScreenState extends State<RecodeScreen> {
  final ScrollController _mainScrollController = ScrollController();
  final ScrollController _subScrollController = ScrollController();
  int? code1;

  final double _removableWidgetSize = 200;
  bool _isStickyOnTop = false;
  int index = 50;
  final DateTime _date = DateTime.now();

  @override
  void initState() {
    super.initState();
    _subScrollController.addListener(() {
      print("dslkfjdskfjksdfjlkdsjflsd");
    });
    _mainScrollController.addListener(
      () {
        print("djfkdslfjdsfk");
        if (_mainScrollController.offset >= _removableWidgetSize &&
            !_isStickyOnTop) {
          print("1dkfjlkdjfdkfdjsfdfs");
          _isStickyOnTop = true;
          setState(() {});
        } else if (_mainScrollController.offset < _removableWidgetSize &&
            _isStickyOnTop) {
          print("2dkfjlkdjfdkfdjsfdfs");
          _isStickyOnTop = false;
          setState(() {});
        }
      },
    );
  }

  Future<void> ShowDate(BuildContext context) async {
    DateTime? dateTime = await showDatePicker(
        context: context,
        initialDate: _date,
        firstDate: DateTime(1957),
        lastDate: DateTime(2035));
    print("kdfjkdjlfksd${dateTime}");
  }

  final RefreshController _paginationController = RefreshController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          color: Colors.blueGrey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              InkWell(
                onTap: () {
                  ShowDate;
                  // showModalBottomSheet(
                  //     context: context,
                  //     isScrollControlled: true,
                  //     builder: (context) {
                  //       return FractionallySizedBox(
                  //         heightFactor: 0.9,
                  //         child: Container(),
                  //       );
                  //     });
                },
                child: Container(
                  alignment: Alignment.bottomCenter,
                  padding: const EdgeInsets.only(bottom: 20),
                  height: 100,
                  color: Colors.pink,
                  child: InkWell(
                    onTap: () {
                      // _scrollDown1();
                      showModalBottomSheet(
                        backgroundColor: Colors.transparent,
                        context: context,
                        isScrollControlled: true,
                        builder: (BuildContext context) {
                          return DraggableScrollableSheet(
                            initialChildSize: 0.5, // half screen on load
                            maxChildSize: 1, // full screen on scroll
                            minChildSize: 0.5,
                            expand: false,
                            builder: (BuildContext context,
                                ScrollController scrollController) {
                              return Container(
                                color: Colors.red,
                                child: Column(
                                  children: [
                                    Container(
                                      child: Text("Hello"),
                                    ),
                                    Expanded(
                                      child: ListView.builder(
                                        controller: scrollController,
                                        itemCount: 25,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return ListTile(
                                              title: Text('Item $index'));
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                      );
                    },
                    child: Text(
                      'AppBar'.toUpperCase(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              InkWell(
                  onTap: () => ShowDate(context),
                  child: SvgPicture.asset("assets/icons/icon _cart_.svg"))
              // Expanded(
              //   child: _buildList(),
              // )
              // Expanded(
              //   child: Stack(
              //     children: [
              //       ListView(
              //         controller: _mainScrollController,
              //         padding: const EdgeInsets.all(0),
              //         shrinkWrap: true,
              //         children: [
              //           Container(
              //             alignment: Alignment.center,
              //             height: _removableWidgetSize,
              //             color: Colors.yellow,
              //             child: Text(
              //               'Banner'.toUpperCase(),
              //               style: const TextStyle(
              //                 color: Colors.blueGrey,
              //                 fontSize: 16,
              //                 fontWeight: FontWeight.bold,
              //               ),
              //             ),
              //           ),
              //           _getStickyWidget(),
              //           _buildList(),
              //         ],
              //       ),
              //       if (_isStickyOnTop) _getStickyWidget()
              //     ],
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _scrollDown1() async {
    log("dsksdskddsds");

    _mainScrollController.animateTo(
      _mainScrollController.position.minScrollExtent,
      duration: const Duration(seconds: 2),
      curve: Curves.fastOutSlowIn,
    );
    _mainScrollController.animateTo(200,
        duration: const Duration(seconds: 2), curve: Curves.fastOutSlowIn);
  }

  _buildList() {
    if (index < 5) {
      setState(
        () {
          _isStickyOnTop = false;
        },
      );
    }
    return ListView.builder(
      controller: _subScrollController,
      padding: const EdgeInsets.only(top: 4),
      shrinkWrap: true,
      itemCount: index,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          alignment: Alignment.center,
          height: 50,
          margin: const EdgeInsets.only(
            bottom: 4,
          ),
          color: Colors.white.withOpacity(0.3),
          child: Text(
            '$index',
            // textAlign: TextAlign.,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
      },
    );
  }

  Container _getStickyWidget() {
    return Container(
      alignment: Alignment.center,
      height: 80,
      color: Colors.green,
      child: Row(
        children: [
          const SizedBox(
            width: 20,
          ),
          InkWell(
            onTap: () {
              // log("Tab 1");
              // setState(() {
              //   index = 14;
              // });

              Timer(const Duration(milliseconds: 100), () {
                _scrollDown1();
              });
            },
            child: const Text("Tab 1"),
          ),
          const Spacer(),
          InkWell(
            onTap: () {
              log("Tab 2");

              setState(() {
                index = 2;
              });
              Timer(Duration(milliseconds: 100), () {
                _scrollDown1();
              });
            },
            child: const Text("Tab 2"),
          ),
          const Spacer(),
          InkWell(
            onTap: () {
              log("Tab 3");
              setState(() {
                index = 100;
              });
              Timer(Duration(milliseconds: 100), () {
                _scrollDown1();
              });
            },
            child: const Text("Tab 3"),
          ),
          const SizedBox(
            width: 20,
          ),
        ],
      ),
    );
  }
}

// import 'dart:developer';
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:flutter_sound/flutter_sound.dart';
// import 'package:permission_handler/permission_handler.dart';
// //
//
//
// class RecodeScreen extends StatefulWidget {
//   const RecodeScreen({Key? key}) : super(key: key);
//
//   @override
//   State<RecodeScreen> createState() => _RecodeScreenState();
// }
//
// class _RecodeScreenState extends State<RecodeScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }
//
// // class RecodeScreen extends StatefulWidget {
// //   const RecodeScreen({Key? key}) : super(key: key);
// //   @override
// //   State<RecodeScreen> createState() => _RecodeScreenState();
// // }
// //
// // class _RecodeScreenState extends State<RecodeScreen> {
// //   final recorder = FlutterSoundRecorder();
// //
// //   bool isRecodeReady = false;
// //   Future record() async {
// //     if (!isRecodeReady) return;
// //     await recorder.startRecorder(toFile: "audio");
// //   }
// //
// //   Future stop() async {
// //     if (!isRecodeReady) return;
// //
// //     final path = await recorder.stopRecorder();
// //     final auditFile = File(path!);
// //     log("FIle Path : $auditFile");
// //   }
// //
// //   @override
// //   void dispose() {
// //     // TODO: implement dispose
// //     recorder.closeRecorder();
// //     super.dispose();
// //   }
// //
// //   @override
// //   void initState() {
// //     // TODO: implement initState
// //     initRecorder();
// //     super.initState();
// //   }
// //
// //   initRecorder() async {
// //     final status = await Permission.microphone.request();
// //     if (status != PermissionStatus.granted) {
// //       throw "Mix Now Working";
// //     }
// //     await recorder.openRecorder();
// //
// //     isRecodeReady = true;
// //     recorder.setSubscriptionDuration(const Duration(milliseconds: 500));
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(),
// //       body: Center(
// //         child: Column(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: [
// //             StreamBuilder<RecordingDisposition>(
// //               stream: recorder.onProgress,
// //               builder: (context, snapshot) {
// //                 final duration =
// //                     snapshot.hasData ? snapshot.data!.duration : Duration.zero;
// //                 String twoDigit(int n) => n.toString().padLeft(60);
// //
// //                 final twoDigitMin = twoDigit(duration.inMinutes.remainder(60));
// //                 final twoDigitSe = twoDigit(duration.inSeconds.remainder(60));
// //
// //                 return Text(
// //                     '${twoDigitMin.replaceAll(RegExp(r"\s+"), "")} : ${twoDigitSe.replaceAll(RegExp(r"\s+"), "")}');
// //               },
// //             ),
// //             ElevatedButton(
// //               child: recorder.isRecording
// //                   ? const Icon(Icons.stop)
// //                   : const Icon(Icons.mic),
// //               onPressed: () async {
// //                 if (recorder.isRecording) {
// //                   await stop();
// //                 } else {
// //                   await record();
// //                 }
// //                 setState(() {});
// //               },
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
