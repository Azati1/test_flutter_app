import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_flutter_app/sound_mixer_controller.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool isSoundMixerControllerVisible = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.maxFinite,
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: Colors.blue,
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage('assets/images/video.png'),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          title: Row(
            children: [
              Image.asset(
                'assets/images/ayas_icon.png',
                height: 40,
              ),
              SizedBox(
                width: 8,
              ),
              Image.asset(
                'assets/images/ayas.png',
                height: 32,
              ),
            ],
          ),
          actions: [
            _appBarButton(
              title: 'Full screen',
              iconData: Icons.fullscreen,
            ),
            SizedBox(
              width: 22,
            ),
            _gradientAppBarButton(
              title: 'Sound mixer',
              image: Image.asset('assets/images/ic_mixer.png'),
              onTap: () {
                setState(() {
                  isSoundMixerControllerVisible = !isSoundMixerControllerVisible;
                });
              },
            ),
            SizedBox(
              width: 22,
            ),
            _appBarButton(
              title: 'Size',
              iconData: Icons.zoom_in,
            ),
            SizedBox(
              width: 24,
            ),
            _exitButton(),
            SizedBox(
              width: 16,
            ),
          ],
        ),
        body: Stack(
          children: [
            Positioned(
              top: 16,
              right: 32,
              child: Visibility(
                visible: isSoundMixerControllerVisible,
                child: SoundMixerController(),
              ),
            ),
            Positioned(
              bottom: 8,
              left: 0,
              right: 0,
              child: Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _pushToTalkButton(
                      iconData: Icons.tag_faces,
                      gradientStartColor: Color.fromARGB(255, 254, 187, 0),
                      gradientEndColor: Color.fromARGB(255, 251, 238, 12),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    _userItem(
                      iconData: Icons.face_outlined,
                      isMuted: false,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    _userItem(
                      iconData: Icons.face_retouching_natural,
                      isMuted: true,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    _userItem(
                      iconData: Icons.face_unlock_outlined,
                      isMuted: false,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    _userItem(
                      iconData: Icons.face,
                      isMuted: true,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    _userItem(
                      iconData: Icons.face_outlined,
                      isMuted: false,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    _pushToTalkButton(
                      iconData: Icons.touch_app,
                      gradientStartColor: Color.fromARGB(255, 189, 27, 193),
                      gradientEndColor: Color.fromARGB(255, 65, 83, 241),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _appBarButton({
    @required String title,
    @required IconData iconData,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 212, 213, 236),
        borderRadius: BorderRadius.all(
          Radius.circular(16),
        ),
      ),
      child: AspectRatio(
        aspectRatio: 1.0,
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Icon(
                      iconData,
                      color: Color.fromARGB(255, 0, 0, 138),
                    ),
                  ),
                ),
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 8,
                    color: Color.fromARGB(255, 0, 0, 138),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _gradientAppBarButton({
    @required String title,
    @required Image image,
    @required Function onTap,
  }) {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color.fromARGB(255, 51, 35, 255),
              Color.fromARGB(255, 235, 0, 255),
            ],
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
        ),
        child: AspectRatio(
          aspectRatio: 1.0,
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: image,
                    ),
                  ),
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 8,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      onTap: onTap,
    );
  }

  Widget _exitButton() {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 70, 23, 253),
        borderRadius: BorderRadius.all(
          Radius.circular(1000),
        ),
      ),
      child: AspectRatio(
        aspectRatio: 1.0,
        child: IconButton(
          icon: Icon(Icons.exit_to_app),
          onPressed: () {},
        ),
      ),
    );
  }

  Widget _pushToTalkButton({
    @required IconData iconData,
    @required Color gradientStartColor,
    @required Color gradientEndColor,
  }) {
    return SizedBox(
      height: 90,
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            child: Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 212, 213, 236),
                borderRadius: BorderRadius.all(
                  Radius.circular(16),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    'Push to talk',
                    maxLines: 1,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 8,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Material(
            color: Colors.transparent,
            elevation: 3,
            borderRadius: BorderRadius.all(Radius.circular(1000)),
            child: Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    gradientStartColor,
                    gradientEndColor,
                  ],
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(1000),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Icon(
                  iconData,
                  size: 32,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _userItem({
    @required IconData iconData,
    @required bool isMuted,
  }) {
    return Stack(
      children: [
        Image.asset(
          'assets/images/armchair.png',
          height: 70,
        ),
        Positioned(
          top: 8,
          left: 20,
          right: 20,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            child: Center(
              child: AspectRatio(
                aspectRatio: 1.0,
                child: Icon(iconData),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 8,
          left: 0,
          right: 0,
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.all(Radius.circular(1000)),
              ),
              child: Icon(
                isMuted ? Icons.music_off : Icons.music_note,
                color: isMuted ? Color.fromARGB(255, 255, 34, 43) : Color.fromARGB(255, 12, 255, 103),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
