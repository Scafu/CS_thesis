#import "../config/constants.typ": figuresList, sourceCodeList, tablesList

#[

  #show outline.entry.where(level: 1): set block(above: 1.5em, below: 1em)

  #show outline.entry: it => {
    it.indented(
      it.prefix(),
      [
        #if it.level == 1 { strong(it.body()) } else { it.body() }
        #box(width: 1fr, it.fill)
        #link(it.element.location(), text(fill: blue)[#it.page()])
      ],
    )
  }


  #outline(
    depth: 5,
  )
]

#v(8em)

#[
  // Nasconde nell'indice tutto ciò che ha la label <no-index>
  #show <no-index>: none

  #show outline.entry: it => {
    it.indented(
      it.prefix(),
      [
        #it.body()
        #box(width: 1fr, it.fill)
        #link(it.element.location(), text(fill: blue)[#it.page()])
      ],
    )
  }

  #outline(
    title: figuresList,
    target: figure.where(kind: image),
  )

  #v(8em)

  #outline(
    title: tablesList,
    target: figure.where(kind: table),
  )

  #v(8em)

  #outline(
    title: sourceCodeList,
    target: figure.where(kind: raw),
  )
]
