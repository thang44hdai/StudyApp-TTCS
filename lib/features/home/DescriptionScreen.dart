import 'package:flutter/material.dart';

class DescriptionScreen extends StatefulWidget {
  const DescriptionScreen({super.key});

  @override
  State<DescriptionScreen> createState() => _DescriptionScreenState();
}

class _DescriptionScreenState extends State<DescriptionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.red,
        title: Text(
          "Mô tả ứng dụng",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 5, right: 5, top: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
                "Ứng dụng luyện thi trắc nghiệm của chúng tôi là một nền tảng hữu ích giúp bạn làm quen các kỳ thi trắc nghiệm như thi cuối kì, TOEIC, chứng chỉ ngoại ngữ và các bài kiểm tra khác. Ứng dụng luyện thi trắc nghiệm của chúng tôi cam kết mang lại trải nghiệm ôn luyện toàn diện và thuận tiện cho người dùng. Hãy sử dụng và tận dụng các tính năng này để nâng cao kỹ năng và chuẩn bị tốt nhất cho các kỳ thi sắp tới của bạn. Đây là một ứng dụng đa chức năng với các tính năng sau:"),
            Text(
              "Đề thi:",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
                "Tìm kiếm theo tên đề thi: Tìm kiếm và chọn đề thi bằng cách nhập tên của đề vào thanh tìm kiếm. Ứng dụng sẽ hiển thị danh sách các đề thi liên quan để bạn lựa chọn.\nQuét mã QR Code: Nếu có mã QR Code của đề thi, bạn có thể quét mã này bằng camera của điện thoại để truy cập nhanh đến đề thi tương ứng."),
            Text(
              "Lưu lịch sử làm bài:",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
                "Ứng dụng tự động lưu lại lịch sử các bài kiểm tra mà bạn đã làm. Bạn có thể xem lại và đánh giá kết quả của mình theo thời gian."),
            Text(
              "Tạo đề thi:",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
                "Bạn có thể tạo đề thi mới hoặc chỉnh sửa các đề thi có sẵn trong ứng dụng. Tạo đề thi cho phép bạn tự tạo câu hỏi và bài tập theo ý muốn để ôn tập."),
            Text(
              "Thi thử cả bài nghe hoặc reading TOEIC:",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
                "Ứng dụng cung cấp các bài kiểm tra thử mô phỏng đề thi TOEIC, bao gồm phần nghe và đọc. Bạn có thể làm bài trắc nghiệm và xem kết quả ngay sau khi hoàn thành."),
            Text(
              "Ghi chú lịch kiểm tra:",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
                "Bạn có thể tạo các ghi chú nhắc nhở về lịch thi của mình trên ứng dụng. Các ghi chú này giúp bạn tổ chức và quản lý thời gian ôn tập hiệu quả."),
          ],
        ),
      ),
    );
  }
}
