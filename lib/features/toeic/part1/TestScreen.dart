import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:study/common/constant.dart';
import 'package:study/features/toeic/model/Question.dart';

class TestScreen extends StatefulWidget {
  String title;
  List<Question> questionList;

  TestScreen({required this.title, required this.questionList, super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Question> questionList = widget.questionList;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: questionList.length,
        itemBuilder: (context, index) {
          Question item = questionList[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 40),
            child: Column(
              children: [
                Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 22, vertical: 8),
                  child: Container(
                    width: Constants.screenWidth,
                    child: Row(
                      children: [
                        Text(
                          "Câu ${index + 1}:",
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: Constants.screenHeight / 3,
                  child: GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return ZoomableImagePopup(imageUrl: item.image);
                        },
                      );
                    },
                    child: Image.network(item.image),
                  ),
                ),
                Audio(url: item.sound),
                MyRadioListTileWidget(item: item),
              ],
            ),
          );
        },
      ),
    );
  }
}

class MyRadioListTileWidget extends StatefulWidget {
  Question item;

  MyRadioListTileWidget({required this.item, super.key});

  @override
  _MyRadioListTileWidgetState createState() => _MyRadioListTileWidgetState();
}

class _MyRadioListTileWidgetState extends State<MyRadioListTileWidget> {
  int _selectedValue = -1;
  int state_test = 0;

  @override
  Widget build(BuildContext context) {
    Question item = widget.item;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        RadioListTile(
          title: state_test == 0
              ? Text('A')
              : Text(
            item.A,
            style: TextStyle(
              color: item.true_answer == 0
                  ? Colors.green
                  : (_selectedValue == 0 ? Colors.red : Colors.black),
            ),
          ),
          value: 0,
          groupValue: _selectedValue,
          onChanged: state_test == 0
              ? (value) {
            setState(() {
              _selectedValue = value as int;
            });
          }
              : null,
        ),
        RadioListTile(
          title: state_test == 0
              ? Text('B')
              : Text(
            item.B,
            style: TextStyle(
              color: item.true_answer == 1
                  ? Colors.green
                  : (_selectedValue == 1 ? Colors.red : Colors.black),
            ),
          ),
          value: 1,
          groupValue: _selectedValue,
          onChanged: state_test == 0
              ? (value) {
            setState(() {
              _selectedValue = value as int;
            });
          }
              : null,
        ),
        RadioListTile(
          title: state_test == 0
              ? Text('C')
              : Text(
            item.C,
            style: TextStyle(
              color: item.true_answer == 2
                  ? Colors.green
                  : (_selectedValue == 2 ? Colors.red : Colors.black),
            ),
          ),
          value: 2,
          groupValue: _selectedValue,
          onChanged: state_test == 0
              ? (value) {
            setState(() {
              _selectedValue = value as int;
            });
          }
              : null,
        ),
        RadioListTile(
          title: state_test == 0
              ? Text('D')
              : Text(
            item.D,
            style: TextStyle(
              color: item.true_answer == 3
                  ? Colors.green
                  : (_selectedValue == 3 ? Colors.red : Colors.black),
            ),
          ),
          value: 3,
          groupValue: _selectedValue,
          onChanged: state_test == 0
              ? (value) {
            setState(() {
              _selectedValue = value as int;
            });
          }
              : null,
        ),
        state_test == 0
            ? Padding(
          padding: const EdgeInsets.only(left: 22),
          child: ElevatedButton(
            onPressed: () {
              setState(() {
                state_test = 1;
              });
            },
            child: Text("Kiểm tra đáp án"),
          ),
        )
            : Text("")
      ],
    );
  }
}

class Audio extends StatefulWidget {
  String url;

  Audio({required this.url, super.key});

  @override
  State<Audio> createState() => _AudioState();
}

class _AudioState extends State<Audio> {
  AudioPlayer _audioPlayer = AudioPlayer();
  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  bool isPlaying = false;

  Future setAudio(String soundUrl) async {
    _audioPlayer.setReleaseMode(ReleaseMode.loop);
    _audioPlayer.setSourceUrl(soundUrl);
  }

  @override
  void initState() {
    super.initState();
    setAudio(widget.url);

    _audioPlayer.onPlayerStateChanged.listen((event) {
      setState(() {
        isPlaying = event == PlayerState.playing;
      });
    });

    _audioPlayer.onDurationChanged.listen((event) {
      setState(() {
        duration = event;
      });
    });

    _audioPlayer.onPositionChanged.listen((event) {
      setState(() {
        position = event;

        if (position >= duration) {
          _audioPlayer.pause();
          isPlaying = false;
        }
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _audioPlayer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Slider(
            min: 0,
            max: duration.inSeconds.toDouble(),
            value: position.inSeconds.toDouble(),
            onChanged: (value) async {
              final position = Duration(seconds: value.toInt());
              await _audioPlayer.seek(position);
              await _audioPlayer.resume();
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(position.toString().substring(2, 7)),
              isPlaying == true
                  ? IconButton(
                  onPressed: () async {
                    isPlaying = false;
                    await _audioPlayer.pause();
                  },
                  icon: Icon(Icons.pause))
                  : IconButton(
                  onPressed: () async {
                    isPlaying = true;
                    await _audioPlayer.resume();
                  },
                  icon: Icon(Icons.play_arrow)),
              Text(duration.toString().substring(2, 7)),
            ],
          )
        ],
      ),
    );
  }
}

class ZoomableImagePopup extends StatelessWidget {
  final String imageUrl;

  ZoomableImagePopup({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: Container(
          child: PhotoView(
            imageProvider: NetworkImage(imageUrl),
            backgroundDecoration: BoxDecoration(color: Colors.transparent),
            minScale: PhotoViewComputedScale.contained * 0.8,
            maxScale: PhotoViewComputedScale.covered * 2,
            enableRotation: true,
          ),
        ),
      ),
    );
  }
}