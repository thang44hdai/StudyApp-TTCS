import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:study/common/constant.dart';
import 'package:study/features/profile/ProfileScreen.dart';
import 'package:study/features/quiz_test/QuizScreen.dart';
import 'package:study/features/quiz_test/provider/QuizProvider.dart';

class TutorialScreen extends StatefulWidget {
  const TutorialScreen({super.key});

  @override
  State<TutorialScreen> createState() => _TutorialScreenState();
}

class _TutorialScreenState extends State<TutorialScreen> {
  late QuestionProvider viewmodel;

  @override
  Widget build(BuildContext context) {
    viewmodel = Provider.of<QuestionProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: const Text(
          "Hướng dẫn",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        height: Constants.screenHeight,
        child: Stack(
          children: [
            Container(
              color: Colors.red,
              height: 60,
            ),
            Body(),
            Fab(),
          ],
        ),
      ),
    );
  }

  Widget Body() {
    return Positioned(
      top: 10,
      bottom: 0,
      right: 0,
      left: 0,
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: Container(
                height: 3,
                width: Constants.screenWidth / 6,
                color: Colors.red,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20, top: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Quy tắc trong bài thi",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.circle,
                color: Colors.blue,
              ),
              title: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Câu đã được chọn đáp án",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.circle,
                color: Colors.red,
              ),
              title: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Câu hỏi được đánh dấu",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.flag,
                color: Colors.red,
              ),
              title: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Đánh dấu câu hỏi",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20, top: 10, bottom: 10),
              child: Text(
                "Các quy tắc trong phòng thi cần lưu ý:",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      "• Điều hành im lặng: Giữ im lặng hoàn toàn trong phòng thi để không làm phiền các thí sinh khác."),
                  Text(
                      "• Không gian cá nhân: Đừng nhìn vào bài làm của người khác hoặc nói chuyện với họ trong suốt thời gian làm bài."),
                  Text(
                      "• Chấp nhận quy định của phòng thi: Tuân thủ mọi quy định và chỉ dẫn từ người giám thị."),
                  Text(
                      "• Không mang vật liệu cấm vào phòng thi: Đảm bảo rằng bạn không mang bất kỳ tài liệu, thiết bị điện tử (như điện thoại di động), hay bất kỳ vật phẩm nào khác vào phòng thi ngoài những gì được phép."),
                  Text(
                      "• Quản lí thời gian: Chú ý đồng hồ và phân bố thời gian hợp lý cho từng phần của bài thi."),
                  Text(
                      "• Kiểm tra lại câu trả lời: Nếu có thời gian dư sau khi hoàn thành bài thi, hãy kiểm tra lại các câu trả lời của mình để đảm bảo tính chính xác và đầy đủ."),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget Fab() {
    return Positioned(
      width: Constants.screenWidth,
      bottom: 10,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              viewmodel.selectedQuestionIndex = 0;
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => QuizScreen(),
                ),
              );
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.red),
            ),
            child: const Padding(
              padding: EdgeInsets.only(
                left: 80,
                right: 80,
              ),
              child: Text(
                "Bắt đầu làm bài",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
