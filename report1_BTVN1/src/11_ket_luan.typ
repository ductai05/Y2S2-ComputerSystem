#import "/template.typ" : *

#[
  #set heading(numbering: "Chương 1.1")
  = Kết luận <chuong6>
]

#show: body => first_line_indent_all_body(body)

== Kết quả đạt được

Báo cáo này đã khám phá hai cơ chế chính để biểu diễn số thực trên máy tính: dấu chấm tĩnh và dấu chấm động. Dấu chấm tĩnh mang lại sự đơn giản và tốc độ cho các ứng dụng có phạm vi và yêu cầu độ chính xác đã biết. Dấu chấm động, đặc biệt là tiêu chuẩn IEEE 754, cung cấp một phạm vi rộng hơn nhiều và sự cân bằng giữa phạm vi và độ chính xác, khiến nó phù hợp với nhiều ứng dụng hơn.

Việc lựa chọn phương pháp biểu diễn thích hợp đòi hỏi sự cân nhắc cẩn thận về sự đánh đổi giữa phạm vi, độ chính xác, chi phí tính toán và việc sử dụng bộ nhớ. Hơn nữa, việc hiểu rõ các hạn chế vốn có và khả năng xảy ra lỗi, đặc biệt là trong số học dấu chấm động, là rất quan trọng để phát triển phần mềm đáng tin cậy và chính xác.

== Khuyến nghị

Các khuyến nghị để chọn biểu diễn phù hợp:

- Đối với các ứng dụng có yêu cầu nghiêm ngặt về hiệu suất, độ chính xác có thể dự đoán và phạm vi giá trị đã biết, giới hạn, biểu diễn dấu chấm tĩnh có thể là lựa chọn hiệu quả nhất.

- Đối với các ứng dụng đòi hỏi dải động rộng và sự cân bằng tốt giữa phạm vi và độ chính xác, biểu diễn dấu chấm động, tuân thủ tiêu chuẩn IEEE 754, thường được ưu tiên hơn.

- Trong các ứng dụng quan trọng liên quan đến số học dấu chấm động, các nhà phát triển phải nhận thức được các lỗi làm tròn tiềm ẩn, mất độ chính xác và các điều kiện tràn số/thiếu số và sử dụng các chiến lược thích hợp để giảm thiểu tác động của chúng.

- Đối với các ứng dụng tài chính hoặc bất kỳ tình huống nào đòi hỏi biểu diễn thập phân chính xác, hãy cân nhắc sử dụng các kiểu dữ liệu thập phân hoặc các thư viện số học có độ chính xác tùy ý để tránh các hạn chế của dấu chấm động nhị phân.

#pagebreak()
