#import "@preview/scripst:1.1.3": *

#show: scripst.with(
  template: "book",
  title: [粒子物理],
  author: ("Anzreww",),
  time: "丙午秋冬于清华园",
  contents: true,
  font-size: 12pt,
  par-leading: 0.8em,
  content-depth: 3,
  matheq-depth: 3,
  lang: "zh",
)

#include "chap1.typ"
#include "chap2.typ"
#include "chap3.typ"
// 新章及附录首页不重复页眉章名。
#set page(header: context {
  set text(font: font.header)
  let current-page = here().page()
  let secs = query(heading.where(level: 1)).filter(it => it.location().page() <= current-page)
  grid(columns: (1fr, auto), align: (left, right))[
    #smallcaps([粒子物理])
  ][
    #if secs.len() > 0 {
      let sec = secs.last()
      if sec.location().page() < current-page {
        numbering(sec.numbering, ..counter(heading).at(sec.location()))
        [ ]
        smallcaps(sec.body)
      }
    }
  ]
})
#include "chap4.typ"
#include "appendix1.typ"
#include "appendix2.typ"
