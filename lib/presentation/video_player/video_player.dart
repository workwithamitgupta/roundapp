import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:round_app/core/app_export.dart';
import 'package:video_player/video_player.dart';

import '../video_concluso_screen/video_concluso_screen.dart';

class VideoPlayerView extends StatefulWidget {
  const VideoPlayerView(
      {Key? key, required this.url, required this.id, required this.reward})
      : super(key: key);
  final String url;
  final int id;
  final double reward;

  @override
  State<VideoPlayerView> createState() => _VideoPlayerViewState();
}

class _VideoPlayerViewState extends State<VideoPlayerView> {
  late VideoPlayerController _controller;
  bool _isVideoInitialized = false;
  bool _isApiCalled = false;
  double indicatorValue = 0.0;
  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse(widget.url))
      ..initialize().then((_) {
        setState(() {
          _isVideoInitialized = true;
        });
        _controller.addListener(() {
          setState(() {
            indicatorValue = double.parse(
              (_controller.value.position.inSeconds /
                      _controller.value.duration.inSeconds)
                  .toString(),
            );
          });

          if (_controller.value.position >= _controller.value.duration) {
            _onVideoFinished();
          }
        });
      });
  }

  void _onVideoFinished() async {
    Get.to(() => VideoConclusoScreen(reward: widget.reward, id: widget.id));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: !_isVideoInitialized
            ? Center(child: CircularProgressIndicator())
            : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: EdgeInsets.only(top: 20.v),
                        child: PopupMenuButton(
                          icon: Icon(
                            Icons.timer,
                            color: Colors.white,
                          ),
                          itemBuilder: (context) => [
                            PopupMenuItem(value: '0.25x', child: Text('0.25x')),
                            PopupMenuItem(value: '0.5x', child: Text('0.5x')),
                            PopupMenuItem(value: '1x', child: Text('1x')),
                            PopupMenuItem(value: '1.25x', child: Text('1.25x')),
                            PopupMenuItem(value: '2x', child: Text('2x')),
                          ],
                          onSelected: (value) {
                            if (value == '0.25x') {
                              _controller.setPlaybackSpeed(0.25);
                            }
                            if (value == '0.5x') {
                              _controller.setPlaybackSpeed(0.5);
                            }
                            if (value == '1x') {
                              _controller.setPlaybackSpeed(1.0);
                            }
                            if (value == '1.25x') {
                              _controller.setPlaybackSpeed(1.25);
                            }
                            if (value == '2x') {
                              _controller.setPlaybackSpeed(2);
                            }
                          },
                        ),
                      ),
                    ),
                    Stack(
                      children: [
                        AspectRatio(
                          aspectRatio: _controller.value.aspectRatio,
                          child: VideoPlayer(_controller),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: InkWell(
                            onDoubleTap: () {
                              _controller.seekTo(
                                _controller.value.position +
                                    const Duration(seconds: 10),
                              );
                            },
                            child: Container(
                              width: 120.v,
                              height: 200.h,
                            ),
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 30.v),
                      child: FloatingActionButton(
                        backgroundColor: Colors.black,
                        onPressed: null,
                        child: GestureDetector(
                            onLongPress: () {
                              _controller.play();
                            },
                            onLongPressEnd: (val) {
                              _controller.pause();
                            },
                            child: Stack(
                              children: [
                                CircleAvatar(
                                  radius: 40,
                                  backgroundColor: Colors.white,
                                  child: CircleAvatar(
                                      radius: 15,
                                      backgroundColor: Colors.blueGrey),
                                ),
                                CircularIndicatorBorder(
                                  size: 60,
                                  value: indicatorValue,
                                ),
                              ],
                            )),
                      ),
                    ),
                  ],
                ),
              ));
  }
}

class CircularIndicatorBorder extends StatelessWidget {
  final double size;
  final double value;

  CircularIndicatorBorder({required this.size, required this.value});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: size,
        height: size,
        child: CustomPaint(
          painter: IndicatorBorderPainter(value),
        ),
      ),
    );
  }
}

class IndicatorBorderPainter extends CustomPainter {
  final double value;

  IndicatorBorderPainter(this.value);

  @override
  void paint(Canvas canvas, Size size) {
    Paint inactivePaint = Paint()
      ..color = Colors.grey[300]!
      ..strokeWidth = 10
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    Paint activePaint = Paint()
      ..color = Colors.greenAccent.shade700 // Change this to your active color
      ..strokeWidth = 10
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    double radius = math.min(size.width, size.height) / 2;
    canvas.drawCircle(
        Offset(size.width / 2, size.height / 2), radius, inactivePaint);

    canvas.drawArc(
      Rect.fromCircle(
          center: Offset(size.width / 2, size.height / 2), radius: radius - 5),
      math.pi * 1.5,
      2 * math.pi * value,
      false,
      activePaint,
    );

    canvas.drawArc(
      Rect.fromCircle(
          center: Offset(size.width / 2, size.height / 2), radius: radius - 5),
      math.pi * 1.5 + 2 * math.pi * value,
      2 * math.pi * (1 - value),
      false,
      inactivePaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
