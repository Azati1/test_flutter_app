import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_xlider/flutter_xlider.dart';

class SoundMixerController extends StatefulWidget {
  @override
  _SoundMixerControllerState createState() => _SoundMixerControllerState();
}

class _SoundMixerControllerState extends State<SoundMixerController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.black54, borderRadius: BorderRadius.all(Radius.circular(16))),
      child: Stack(
        children: [
          BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 8.0,
              sigmaY: 8.0,
            ),
            child: Container(
              color: Colors.transparent,
            ),
          ),
          Row(
            children: [
              _slider(
                title: 'Video',
              ),
              _slider(
                title: 'Friends',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _slider({
    @required String title,
  }) {
    return SizedBox(
      height: 150,
      width: 100,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: FlutterSlider(
              rtl: true,
              axis: Axis.vertical,
              handler: FlutterSliderHandler(
                decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(8))),
                child: AspectRatio(
                  aspectRatio: 3.0,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                  ),
                ),
              ),
              trackBar: FlutterSliderTrackBar(
                activeTrackBarHeight: 8,
                inactiveTrackBarHeight: 8,
                activeTrackBar: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color.fromARGB(255, 83, 86, 252),
                ),
                inactiveTrackBar: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color.fromARGB(255, 83, 86, 252),
                ),
              ),
              min: 0,
              max: 100,
              values: [0],
            ),
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 8,
          ),
        ],
      ),
    );
  }
}
