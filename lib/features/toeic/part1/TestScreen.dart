import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:study/common/constant.dart';
import 'package:study/features/toeic/model/Question.dart';

class TestScreen extends StatefulWidget {
  List<Question> questionList;

  TestScreen({required this.questionList, super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  AudioPlayer _audioPlayer = AudioPlayer();

  void playSound(String soundUrl) async {
    await _audioPlayer.play(UrlSource(soundUrl));
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Question> questionList = widget.questionList;
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: questionList.length,
        itemBuilder: (context, index) {
          Question item = questionList[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 40),
            child: Column(
              children: [
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
                IconButton(
                    onPressed: () {
                      playSound(item.sound);
                    },
                    icon: Icon(Icons.volume_up)),
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
          title: state_test == 0 ? Text('A') : Text(item.A),
          value: 0,
          groupValue: _selectedValue,
          onChanged: (value) {
            setState(() {
              _selectedValue = value as int;
            });
          },
        ),
        RadioListTile(
          title: state_test == 0 ? Text('B') : Text(item.B),
          value: 1,
          groupValue: _selectedValue,
          onChanged: (value) {
            setState(() {
              _selectedValue = value as int;
            });
          },
        ),
        RadioListTile(
          title: state_test == 0 ? Text('C') : Text(item.C),
          value: 2,
          groupValue: _selectedValue,
          onChanged: (value) {
            setState(() {
              _selectedValue = value as int;
            });
          },
        ),
        RadioListTile(
          title: state_test == 0 ? Text('D') : Text(item.D),
          value: 3,
          groupValue: _selectedValue,
          onChanged: (value) {
            setState(() {
              _selectedValue = value as int;
            });
          },
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
            : (_selectedValue == item.true_answer
                ? Padding(
                    padding: const EdgeInsets.only(left: 22),
                    child: Text(
                      "Bạn đã chọn đúng",
                      style: TextStyle(fontSize: 25),
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.only(left: 22),
                    child: Text(
                      "Bạn đã chọn sai",
                      style: TextStyle(fontSize: 25),
                    ),
                  )),
      ],
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
