#import "/template.typ" : *

#[
  #set heading(numbering: "Chương 1.1")
  = Tiêu chuẩn IEEE 754 <chuong2>
]

#show: body => first_line_indent_all_body(body)

== Tiêu chuẩn IEEE 754 cho số học dấu chấm động

Tiêu chuẩn IEEE 754, được thiết lập vào năm 1985, cung cấp một cách thống nhất để biểu diễn số dấu chấm động và thực hiện các phép toán số học trên các hệ thống máy tính khác nhau. @Floating-Point-Representation Nó giải quyết những mâu thuẫn trong các triển khai trước đó, cải thiện độ tin cậy và khả năng di chuyển. Tiêu chuẩn hóa đảm bảo rằng các số dấu chấm động được diễn giải và xử lý nhất quán trên các nền tảng phần cứng và phần mềm khác nhau, điều này rất quan trọng cho khả năng tương tác.

#figure(
  image("/images/ieee-754.png"),
  caption: [Tiêu chuẩn IEEE-754, 32 bit],
) <ieee-754>

=== Các định dạng cơ bản

Tiêu chuẩn xác định một số định dạng cơ bản, bao gồm:

- *Độ chính xác đơn (Single-Precision - binary32):* Sử dụng 32 bit.   
- *Độ chính xác kép (Double-Precision - binary64):* Sử dụng 64 bit.   
- *Độ chính xác nửa (Half-Precision - binary16):* Sử dụng 16 bit.   
- *Độ chính xác gấp bốn (Quadruple-Precision - binary128):* Sử dụng 128 bit.   
- *Độ chính xác mở rộng (Extended Precision):* Các định dạng có nhiều bit hơn độ chính xác kép, thường là dành riêng cho từng triển khai.   

Tiêu chuẩn cung cấp một loạt các định dạng để phù hợp với các yêu cầu khác nhau về độ chính xác và bộ nhớ. Độ chính xác đơn và kép là phổ biến nhất trong tính toán đa năng.

=== Cấu trúc của định dạng độ chính xác đơn và kép

- *Độ chính xác đơn:* 1 bit dấu, 8 bit số mũ, 23 bit phần định trị.   
- *Độ chính xác kép:* 1 bit dấu, 11 bit số mũ, 52 bit phần định trị. 

Số lượng bit tăng lên trong độ chính xác kép cho phép phạm vi số mũ rộng hơn và độ chính xác cao hơn đáng kể do phần định trị lớn hơn.

=== Độ lệch số mũ:

Số mũ được lưu trữ với một độ lệch (offset) để biểu diễn cả số mũ dương và âm dưới dạng số nguyên không dấu. Đối với độ chính xác đơn, độ lệch là 127 và đối với độ chính xác kép, nó là 1023. Việc sử dụng độ lệch giúp đơn giản hóa việc so sánh các số dấu chấm động.   

=== Số chuẩn hóa và số phi chuẩn hóa (Subnormal):

Số chuẩn hóa có một bit '1' ngầm ở đầu phần định trị, cung cấp độ chính xác tối đa. Số phi chuẩn hóa (còn gọi là subnormal) được sử dụng để biểu diễn các số rất nhỏ gần bằng không, trong đó bit đầu tiên là '0' và số mũ ở giá trị tối thiểu. Số phi chuẩn hóa giúp giảm thiểu vấn đề "underflow dần dần", cho phép biểu diễn các số nhỏ hơn số chuẩn hóa nhỏ nhất, mặc dù với độ chính xác giảm.   

=== Các giá trị đặc biệt

Tiêu chuẩn IEEE 754 xác định các mẫu bit đặc biệt để biểu diễn các giá trị như:

- *Số không:* Số không dương (+0) và số không âm (-0).   
- *Vô cực:* Vô cực dương (+∞) và vô cực âm (-∞).   
- *Không phải là số (NaN - Not-a-Number):* Biểu thị kết quả của các phép toán không hợp lệ (ví dụ: 0/0, ∞/∞).   

Các giá trị đặc biệt này cung cấp một cách để xử lý các trường hợp ngoại lệ trong tính toán dấu chấm động theo một tiêu chuẩn hóa.

== Hạn chế và lỗi trong biểu diễn dấu chấm động

Do số lượng bit hữu hạn, máy tính chỉ có thể biểu diễn một tập hợp con hữu hạn của tập hợp vô hạn các số thực. Hầu hết các số thực chỉ có thể được xấp xỉ. Hạn chế này là không thể tránh khỏi và là nguyên nhân gốc rễ của nhiều vấn đề liên quan đến số học dấu chấm động.

=== Lỗi làm tròn

Xảy ra khi một số thực không thể được biểu diễn chính xác và phải được làm tròn đến số dấu chấm động có thể biểu diễn gần nhất.   

- *Nguyên nhân*
 - Biểu diễn nhị phân không kết thúc của số thập phân (ví dụ: 0.1 trong hệ thập phân có biểu diễn nhị phân lặp lại).   
 - Độ chính xác hữu hạn của phần định trị.   
- *Các kiểu làm tròn (được định nghĩa bởi IEEE 754)*
 - Làm tròn đến số gần nhất (hòa chẵn, hòa xa không).
 - Làm tròn về phía dương vô cực (lên).   
 - Làm tròn về phía âm vô cực (xuống).   
 - Làm tròn về phía số không (cắt bớt).  


Việc lựa chọn kiểu làm tròn có thể ảnh hưởng đến độ chính xác của các phép tính và việc hiểu rõ các kiểu này rất quan trọng đối với phân tích số.

=== Mất độ chính xác và triệt tiêu thảm khốc

- *Mất độ chính xác:* Xảy ra khi các phép toán số học tạo ra kết quả đòi hỏi nhiều chữ số có nghĩa hơn mức có thể biểu diễn, dẫn đến việc làm tròn hoặc cắt bớt.  
- *Triệt tiêu thảm khốc:* Sự mất mát độ chính xác đáng kể có thể xảy ra khi trừ hai số dấu chấm động gần bằng nhau, vì các chữ số có nghĩa hàng đầu bị triệt tiêu, chỉ còn lại các chữ số ít có nghĩa hơn và có khả năng kém chính xác hơn.  

Những vấn đề này có thể đặc biệt nghiêm trọng trong các thuật toán lặp hoặc chuỗi các phép tính mà lỗi có thể tích lũy.

=== Tràn số (Overflow) và thiếu số (Underflow)

- Tràn số: Xảy ra khi kết quả của một phép tính quá lớn để có thể biểu diễn trong phạm vi của định dạng dấu chấm động, thường dẫn đến vô cực.  
- Thiếu số: Xảy ra khi kết quả quá nhỏ để có thể biểu diễn dưới dạng một số dấu chấm động chuẩn hóa, thường dẫn đến số không hoặc một số phi chuẩn hóa.

Việc hiểu rõ giới hạn của phạm vi có thể biểu diễn là rất quan trọng để tránh những vấn đề này.

=== Độ chính xác (Accuracy) so với độ chụm (Precision)

- *Độ chụm:* Đề cập đến số lượng bit được sử dụng để biểu diễn một giá trị, cho biết mức độ chi tiết.
- *Độ chính xác:* Đề cập đến mức độ gần của giá trị được biểu diễn so với giá trị thực.

Các số dấu chấm động có thể có độ chụm cao (nhiều bit trong phần định trị) nhưng vẫn bị sai số do làm tròn. Điều quan trọng là phải phân biệt giữa số lượng chữ số được lưu trữ (độ chụm) và số lượng chữ số đó thực sự chính xác so với giá trị thực (độ chính xác).   

=== Epsilon máy (Machine Epsilon)

Biểu thị số dương nhỏ nhất mà khi cộng với 1 sẽ cho kết quả khác 1 trong định dạng dấu chấm động đã cho . Nó cung cấp thước đo độ chính xác tương đối. Epsilon máy là một khái niệm quan trọng trong phân tích số để hiểu giới hạn của độ chính xác dấu chấm động.   

=== Các chiến lược để giảm thiểu lỗi làm tròn

- Sử dụng các kiểu dữ liệu có độ chính xác cao hơn (ví dụ: double thay vì float).   
- Sử dụng các thuật toán số ổn định hơn và ít bị tích lũy lỗi hơn.   
- Thận trọng với việc so sánh bằng nhau của các số dấu chấm động; sử dụng một dung sai nhỏ (epsilon).   
- Cân nhắc các biểu diễn thay thế như số thập phân cho các phép tính tài chính, nơi biểu diễn thập phân chính xác là rất quan trọng.   
- Thực hiện phép nhân trước phép cộng khi xử lý các số có độ lớn khác nhau.   
- Làm tròn kết quả đến một số lượng chữ số thập phân cụ thể khi thích hợp. 

== So sánh giữa biểu diễn dấu chấm tĩnh và dấu chấm động

Biểu diễn dấu chấm động cung cấp một phạm vi số có thể biểu diễn rộng hơn nhiều, trong khi dấu chấm tĩnh cung cấp độ chính xác nhất quán và có thể dự đoán hơn trong phạm vi giới hạn của nó. Việc lựa chọn phụ thuộc vào việc ứng dụng yêu cầu xử lý một phổ độ lớn rộng hay cần một mức độ chính xác đảm bảo cho các số trong một phạm vi cụ thể, đã biết. 

Số học dấu chấm tĩnh thường nhanh hơn và hiệu quả hơn số học dấu chấm động, đặc biệt là trên phần cứng không có đơn vị dấu chấm động chuyên dụng. Đối với các hệ thống thời gian thực và các ứng dụng nhúng có tài nguyên hạn chế, dấu chấm tĩnh có thể là một lựa chọn phù hợp hơn do chi phí tính toán thấp hơn.   

Biểu diễn dấu chấm tĩnh đôi khi có thể yêu cầu ít bộ nhớ hơn dấu chấm động cho một phạm vi tương đương trong một số trường hợp nhất định, vì chúng không cần lưu trữ số mũ. Tuy nhiên, khả năng biểu diễn một phạm vi rộng hơn nhiều một cách hiệu quả của dấu chấm động thường biện minh cho việc sử dụng bộ nhớ của nó.   

Số học dấu chấm tĩnh đơn giản hơn để triển khai trong phần cứng và phần mềm so với các thuật toán phức tạp hơn cần thiết cho các phép toán dấu chấm động.   

*Độ phù hợp cho các ứng dụng khác nhau:*

- Dấu chấm tĩnh: Hệ thống nhúng, xử lý tín hiệu số, hệ thống điều khiển nơi tốc độ, tính dự đoán và tiêu thụ điện năng thấp là rất quan trọng.   
- Dấu chấm động: Tính toán khoa học, mô phỏng kỹ thuật, xử lý đồ họa, học máy, các ứng dụng mục đích chung đòi hỏi dải động rộng và sự cân bằng giữa phạm vi và độ chính xác. 

== Tác động thực tế của lỗi dấu chấm động

Một số sự cố lịch sử làm nổi bật những hậu quả nghiêm trọng tiềm ẩn của lỗi dấu chấm động: @truenorthfloatingpoint

- *Thất bại tên lửa Patriot (1991):* Một lỗi làm tròn nhỏ trong tính toán đồng hồ của hệ thống tích lũy theo thời gian, khiến tên lửa đánh giá sai quỹ đạo của một tên lửa Scud đang bay tới, dẫn đến thương vong.   

#figure(
  image("/images/patriot.png", width: 85%),
  caption: [Tên lửa Patriot],
) <Patriot>

- *Vụ nổ tên lửa Ariane 5 (1996):* Một lỗi tràn số xảy ra khi một số dấu chấm động 64 bit biểu diễn vận tốc ngang được chuyển đổi thành một số nguyên có dấu 16 bit, dẫn đến việc tên lửa bị phá hủy.   

#figure(
  image("/images/Ariane-5.png", width: 85%),
  caption: [Mảnh vỡ được thu hồi của tên lửa Ariane 5],
) <Ariane-5>

- *Lỗi chỉ số Sở giao dịch chứng khoán Vancouver (1982-1984):* Lỗi cắt bớt lặp đi lặp lại trong tính toán chỉ số chứng khoán dẫn đến việc định giá thấp đáng kể giá trị của nó theo thời gian.   

- *Nguy cơ ngừng hoạt động của Boeing 787 (2015):* Một lỗi tràn bộ đếm phần mềm sau 248 ngày hoạt động liên tục có thể dẫn đến mất điện.   

Những ví dụ này nhấn mạnh tầm quan trọng của việc hiểu các hạn chế của số học dấu chấm động và sự cần thiết của việc thiết kế và thử nghiệm cẩn thận trong các ứng dụng quan trọng.

Lỗi dấu chấm động có thể có những tác động đáng kể trong nhiều lĩnh vực:

- *Tính toán khoa học và kỹ thuật:* Mô phỏng không chính xác, tính toán sai trong vật lý, hóa học và kỹ thuật.   

- *Tài chính:* Lỗi trong tính toán tài chính có thể dẫn đến định giá, tính toán chi phí và dự báo không chính xác.   

- *Hệ thống điều khiển:* Tính toán sai trong các thuật toán điều khiển có thể dẫn đến sự cố hệ thống, như đã thấy trong vụ tên lửa Patriot và vụ nổ Ariane 5.   

- *Học máy và AI:* Mặc dù các định dạng độ chính xác thấp hơn ngày càng được sử dụng để tăng hiệu quả, nhưng việc hiểu rõ sự đánh đổi về độ chính xác là rất quan trọng.   

- *Kết xuất đồ họa và trò chơi:* Mặc dù thường chịu được những sai sót nhỏ, nhưng những lỗi đáng kể có thể dẫn đến các hình ảnh hoặc hành vi không mong muốn. 