#import "template.typ": *

#show: project.with(
  title: "Báo cáo BTVN1",
  authors: ((name: "Đinh Đức Tài"),),
)

#counter(page).update(1)
#set page(numbering: "1")
#set heading(numbering: "1.1.", supplement: "Chương")

#include "src/06_chuong_1.typ"
#include "src/07_chuong_2.typ"
#include "src/11_ket_luan.typ"
#bibliography("ref.bib", style: "elsevier-vancouver")
