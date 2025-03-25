#import "/template.typ" : *

#[
  #set heading(numbering: "Chương 1.1")
  = Kết luận <chuong6>
]

#show: body => first_line_indent_all_body(body)

== Kết quả đạt được

Báo cáo này đã trình bày các khái niệm quan trọng trong số học máy tính, bao gồm tràn số, thiếu số (cho cả số nguyên và số thực), nguyên tắc của số học dấu phẩy động và chuẩn IEEE 754, tầm quan trọng của các quy tắc làm tròn, và vai trò của NaN trong việc xử lý các điều kiện ngoại lệ. Việc hiểu rõ những khái niệm này là nền tảng để phát triển phần mềm số học chính xác, đáng tin cậy và mạnh mẽ. Bỏ qua những chi tiết cấp thấp này có thể dẫn đến những lỗi tiềm ẩn và hành vi không mong muốn trong các ứng dụng. Do đó, việc lựa chọn kiểu dữ liệu phù hợp và nhận thức được các vấn đề về độ chính xác và sự lan truyền sai số trong tính toán số là vô cùng quan trọng.

== Khuyến nghị

- Trong các ứng dụng quan trọng liên quan đến số học dấu chấm động, các nhà phát triển phải nhận thức được các lỗi làm tròn tiềm ẩn, mất độ chính xác và các điều kiện tràn số/thiếu số và sử dụng các chiến lược thích hợp để giảm thiểu tác động của chúng.

- Đối với các ứng dụng tài chính hoặc bất kỳ tình huống nào đòi hỏi biểu diễn thập phân chính xác, hãy cân nhắc sử dụng các kiểu dữ liệu thập phân hoặc các thư viện số học có độ chính xác tùy ý để tránh các hạn chế của dấu chấm động nhị phân.

#pagebreak()
