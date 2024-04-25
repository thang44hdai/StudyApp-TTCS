import 'package:flutter/material.dart';

class TermOfUserScreen extends StatefulWidget {
  const TermOfUserScreen({super.key});

  @override
  State<TermOfUserScreen> createState() => _TermOfUserScreenState();
}

class _TermOfUserScreenState extends State<TermOfUserScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.red,
        title: Text(
          "Điều khoản",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 5, right: 5, top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("1.Mục đích sử dụng:",
                style: TextStyle(fontWeight: FontWeight.bold)),
            Text(
                "- Ứng dụng luyện thi trắc nghiệm được thiết kế để cung cấp các câu hỏi và bài tập ôn luyện cho các kỳ thi như đại học, chứng chỉ nghề nghiệp, tiếng Anh và các lĩnh vực kiến thức khác. Bạn có thể sử dụng ứng dụng để tự ôn tập và nâng cao kiến thức của mình."),
            Text("2.Tính chất của nội dung:",
                style: TextStyle(fontWeight: FontWeight.bold)),
            Text(
                "- Chúng tôi cố gắng cung cấp nội dung chính xác và hữu ích nhất cho người dùng. Tuy nhiên, chúng tôi không chịu trách nhiệm về sự chính xác hoặc độ đầy đủ của các thông tin trong ứng dụng. Người dùng nên xem xét và kiểm tra lại thông tin từ các nguồn khác nếu cần thiết."),
            Text("3.Bảo mật thông tin:",
                style: TextStyle(fontWeight: FontWeight.bold)),
            Text(
                "- Chúng tôi cam kết bảo vệ thông tin cá nhân của người dùng. Mọi thông tin cá nhân thu thập từ bạn sẽ được bảo mật và chỉ sử dụng cho mục đích cung cấp dịch vụ và tương tác với ứng dụng này."),
            Text("4.Quyền sở hữu trí tuệ:",
                style: TextStyle(fontWeight: FontWeight.bold)),
            Text(
                "- Tất cả các nội dung, tài liệu, câu hỏi và đáp án trong ứng dụng là tài sản của chúng tôi hoặc các bên sở hữu. Bạn chỉ được sử dụng chúng để mục đích cá nhân và không được sao chép, sửa đổi hoặc phân phối mà không có sự cho phép từ chúng tôi."),
            Text("5.Thay đổi và cập nhật: ",
                style: TextStyle(fontWeight: FontWeight.bold)),
            Text(
                "- Chúng tôi có thể thay đổi nội dung và tính năng của ứng dụng theo thời gian mà không cần thông báo trước. Bằng cách tiếp tục sử dụng ứng dụng sau khi có sự thay đổi, bạn đồng ý với các điều khoản mới này."),
            Text("6.Chấm dứt sử dụng:",
                style: TextStyle(fontWeight: FontWeight.bold)),
            Text(
                "- Chúng tôi có quyền ngừng cung cấp dịch vụ của ứng dụng hoặc tài khoản của người dùng nếu phát hiện bất kỳ hành vi vi phạm điều khoản nào trong thỏa thuận này."),
          ],
        ),
      ),
    );
  }
}
