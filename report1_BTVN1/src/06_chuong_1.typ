#import "/template.typ" : *

#[
  #set heading(numbering: "Chương 1.1")
  = Giới thiệu <chuong1>
]
#show: body => first_line_indent_all_body(body)
== Thách thức trong việc biểu diễn số thực bằng kỹ thuật số

Số thực, theo định nghĩa toán học, tạo thành một tập hợp liên tục với độ chính xác vô hạn. Ngược lại, máy tính hoạt động trên các đơn vị thông tin rời rạc (bit) trong bộ nhớ hữu hạn. Sự khác biệt cơ bản này đòi hỏi các kỹ thuật xấp xỉ để biểu diễn số thực bằng kỹ thuật số. @number Thách thức cốt lõi nằm ở việc ánh xạ một miền vô hạn, liên tục sang một miền hữu hạn, rời rạc. Sự ánh xạ này chắc chắn liên quan đến một số hình thức xấp xỉ hoặc cắt bớt.   

Hai phương pháp chính được sử dụng để biểu diễn số thực trong máy tính là biểu diễn dấu chấm tĩnh (fixed-point) và biểu diễn dấu chấm động (floating-point). @floating-point Mỗi phương pháp đưa ra các đánh đổi khác nhau về phạm vi, độ chính xác và độ phức tạp. Việc lựa chọn phương pháp biểu diễn phụ thuộc nhiều vào các yêu cầu cụ thể của ứng dụng, cân bằng giữa nhu cầu về độ chính xác với các ràng buộc về tài nguyên tính toán.


== Biểu diễn dấu chấm tĩnh

Biểu diễn dấu chấm tĩnh sử dụng một số lượng bit cố định cho phần nguyên và một số lượng bit cố định cho phần thập phân. @fixed-point-representation Vị trí của dấu chấm nhị phân (tương tự như dấu chấm thập phân) được xác định ngầm và không thay đổi. Bằng cách cố định dấu chấm nhị phân, việc biểu diễn trở nên đơn giản hơn để thực hiện ở cấp độ phần cứng, vì nó chủ yếu dựa vào số học số nguyên. Với dấu chấm nhị phân cố định, các phép toán như cộng và trừ có thể được thực hiện bằng cách sử dụng các đơn vị số học số nguyên tiêu chuẩn, có khả năng dẫn đến việc thực hiện nhanh hơn.

#figure(
  image("/images/fixed-point.png", width: 100%),
  caption: [Một ví dụ về biểu diễn số bằng dấu chấm tĩnh],
) <fixed-point>

Một số thực được chia thành hai phần: phần nguyên (số nguyên) và phần thập phân. Trong biểu diễn dấu chấm tĩnh, một số lượng bit được xác định trước được phân bổ cho mỗi phần. Vì số thực có thể là số âm, biểu diễn dấu chấm tĩnh cũng phải đáp ứng dấu. Các phương pháp phổ biến bao gồm:

- *Dấu-Độ lớn (Sign-Magnitude):* Bit quan trọng nhất (MSB) biểu thị dấu (0 cho dương, 1 cho âm) và các bit còn lại biểu thị độ lớn. 
- *Bù 1 (One's Complement):* Số âm được hình thành bằng cách đảo ngược tất cả các bit của số dương tương ứng.
- *Bù 2 (Two's Complement):* Số âm được hình thành bằng cách đảo ngược tất cả các bit của số dương tương ứng và cộng thêm 1. Đây là phương pháp được sử dụng rộng rãi nhất để biểu diễn số nguyên có dấu và cũng có thể áp dụng cho dấu chấm tĩnh . Ví dụ cung cấp các ví dụ sử dụng bù 2 cho phần định trị (mantissa) trong ngữ cảnh dấu chấm động, minh họa việc sử dụng nó cho số nhị phân có dấu. và đề cập rõ ràng đến các phương pháp biểu diễn có dấu này. Việc lựa chọn biểu diễn có dấu ảnh hưởng đến độ phức tạp của các phép toán số học, đặc biệt là phép trừ và phép so sánh. Bù 2 đơn giản hóa các phép toán này. Bù 2 có ưu điểm là biểu diễn duy nhất cho số không và đơn giản hóa các mạch cộng và trừ, khiến nó trở thành lựa chọn ưu tiên trong các hệ thống hiện đại.

*Ưu điểm:*

- *Đơn giản:* Số học dấu chấm tĩnh thường đơn giản hơn để thực hiện trong phần cứng so với dấu chấm động.   
- *Tốc độ:* Các phép toán có thể nhanh hơn vì chúng thường tận dụng các đơn vị số học số nguyên.   
- *Tính dự đoán:* Độ chính xác là hằng số, giúp phân tích lỗi dễ dàng hơn. Bản chất cố định của dấu chấm nhị phân dẫn đến việc chia tỷ lệ và độ chính xác có thể dự đoán được, điều này có thể rất quan trọng trong một số ứng dụng nhất định.   

*Nhược điểm:*

- *Phạm vi giới hạn:* Phạm vi của các số có thể biểu diễn bị giới hạn bởi số lượng bit cố định được phân bổ cho phần nguyên và phần thập phân .   
- *Độ chính xác giới hạn:* Độ chính xác cũng cố định và có thể không đủ cho các ứng dụng đòi hỏi dải động rộng hoặc độ chi tiết rất cao. Sự đánh đổi giữa kích thước của phần nguyên và phần thập phân phải được xem xét cẩn thận dựa trên phạm vi dự kiến và độ chính xác cần thiết của các số.   

*Trường hợp sử dụng:* Biểu diễn dấu chấm tĩnh thường được sử dụng trong các ứng dụng mà hiệu quả tính toán và tính dự đoán là rất quan trọng, chẳng hạn như:

- Hệ thống nhúng.   
- Xử lý tín hiệu số (DSP).   
- Hệ thống điều khiển.   

*Ví dụ về biểu diễn nhị phân dấu chấm tĩnh:*

- Một số dấu chấm tĩnh 16 bit với 8 bit cho phần nguyên và 8 bit cho phần thập phân. Điều này cho phép biểu diễn các số từ -128 đến +127 với độ chính xác là 1/256. Việc phân bổ bit trực tiếp xác định phạm vi và độ chính xác. Nhiều bit hơn cho phần thập phân làm tăng độ chính xác nhưng làm giảm phạm vi của phần nguyên, và ngược lại.

== Biểu diễn dấu chấm động

Biểu diễn dấu chấm động giải quyết các hạn chế của dấu chấm tĩnh bằng cách sử dụng một dạng ký hiệu khoa học. @Representing-Numbers-in-Computers Một số được biểu diễn bằng một phần định trị (significand hoặc mantissa) và một số mũ (exponent), số mũ này xác định vị trí của dấu chấm nhị phân. Nguyên tắc này cho phép biểu diễn một phạm vi số rộng hơn nhiều so với dấu chấm tĩnh, bao gồm cả các giá trị rất nhỏ và rất lớn. Bằng cách chia tỷ lệ phần định trị bằng số mũ, dấu chấm động có thể biểu diễn các số trên nhiều bậc độ lớn mà không làm mất quá nhiều độ chính xác cho các số trong một phạm vi cụ thể. 

Mặc dù khái niệm này tương tự như ký hiệu khoa học cơ số 10, máy tính chủ yếu sử dụng cơ số 2 (nhị phân) cho biểu diễn dấu chấm động. Các cơ số khác như 10 và 16 cũng đã được sử dụng trong lịch sử hoặc trong các ngữ cảnh cụ thể. Việc sử dụng cơ số 2 phù hợp với bản chất nhị phân của phần cứng máy tính, cho phép thực hiện hiệu quả các phép toán số học.

Các số dấu chấm động thường được lưu trữ ở dạng chuẩn hóa, trong đó chữ số có nghĩa nhất của phần định trị khác không (thường là 1 trong hệ nhị phân) @ieee-standard. Điều này tối đa hóa số lượng chữ số có nghĩa có thể được biểu diễn cho một số lượng bit nhất định. Chuẩn hóa đảm bảo rằng biểu diễn là duy nhất và các bit có sẵn cho phần định trị được sử dụng hết tiềm năng cho độ chính xác. Bằng cách đảm bảo bit đầu tiên là 1 (và thường được giả định ngầm), chúng ta có được thêm một bit độ chính xác miễn phí.

Một số dấu chấm động thường bao gồm ba phần:
- *Bit dấu (Sign Bit):* Cho biết số là dương (0) hay âm (1).
- *Số mũ (Exponent):* Biểu thị lũy thừa mà cơ số được nâng lên để chia tỷ lệ phần định trị. Số này thường được lưu trữ với một độ lệch (bias) để cho phép cả số mũ dương và âm.
- *Phần định trị (Mantissa/Significand):* Chứa các chữ số có nghĩa của số. Độ chính xác của biểu diễn được xác định bởi số lượng bit được phân bổ cho phần định trị.

Việc phân chia bit giữa các thành phần này quyết định phạm vi (chủ yếu bởi số mũ) và độ chính xác (chủ yếu bởi phần định trị) của các số dấu chấm động có thể được biểu diễn.

*Sự đánh đổi giữa phạm vi và độ chính xác:* Tăng số lượng bit cho số mũ làm tăng phạm vi của các số có thể biểu diễn, trong khi tăng số lượng bit cho phần định trị làm tăng độ chính xác. Có một sự đánh đổi vốn có giữa hai điều này. Việc thiết kế một định dạng dấu chấm động liên quan đến việc cân bằng phạm vi và độ chính xác mong muốn cho các ứng dụng dự kiến. 

*Ưu điểm:*

- *Phạm vi giá trị rộng:* Dấu chấm động có thể biểu diễn một phạm vi số rộng hơn đáng kể, từ rất nhỏ đến rất lớn, so với dấu chấm tĩnh.   
- *Cân bằng tốt giữa phạm vi và độ chính xác:* Nó cung cấp một cách linh hoạt để xử lý các số có độ lớn khác nhau trong khi vẫn duy trì mức độ chính xác hợp lý.   

*Nhược điểm:*
- *Độ phức tạp:* Số học dấu chấm động phức tạp hơn để thực hiện trong phần cứng so với số học dấu chấm tĩnh.   
- *Khả năng xảy ra lỗi làm tròn:* Do độ chính xác hữu hạn và cách một số phân số thập phân được biểu diễn trong hệ nhị phân, số học dấu chấm động có thể gây ra lỗi làm tròn. Các xấp xỉ vốn có trong biểu diễn dấu chấm động có thể dẫn đến các lỗi tinh vi nhưng có khả năng nghiêm trọng trong tính toán, đặc biệt là qua một chuỗi các phép toán. 
