#let trang_bia(title, authors) = {
  rect(
    stroke: 5pt,
    inset: 7pt,
  rect(
    width: 100%,
    height: 100%,
    inset: 15pt,
    stroke: 1.7pt,
    [
      #align(center)[
      #text(12pt, strong("ĐẠI HỌC QUỐC GIA THÀNH PHỐ HỒ CHÍ MINH"))
  
      #text(12pt, strong("TRƯỜNG ĐẠI HỌC KHOA HỌC TỰ NHIÊN"))

      #text(12pt, strong("KHOA CÔNG NGHỆ THÔNG TIN"))
      
      ]
      #v(0.0cm)
      #align(center)[
        #image("/images/hcmus.png", width: 60%)
      ]
      #v(0.0cm)
      
      #align(center)[
        #text(14pt, strong("Đinh Đức Tài"))
      ]
      #align(center)[
        #text(14pt, strong("23TNT1 - 23122013"))
      ]
      
      #v(1.2cm)
      #align(center)[
        #text(18pt,  upper(strong(title)))
        
        #text(12pt, strong("Đề tài: Các cơ chế biểu diễn số thực trên máy tính"))
      ]
      #v(2cm)
      #align(center)[
        #text(14pt, strong("Môn: Hệ thống máy tính"))
      ]
      #align(center)[
        #text(12pt, strong("GV: Vũ Thị Mỹ Hằng"))
      ]

      #v(1fr)
    
      #align(center)[
        #text(12pt, strong("TP. Hồ Chí Minh - 2025"))
      ]
    ]  
  ))
}
