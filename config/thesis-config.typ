#import "@preview/glossarium:0.5.9": (
  gls, gls-description, gls-short, glspl, make-glossary, print-glossary, register-glossary,
)
#import "@preview/codly:1.3.0": *
#import "@preview/codly-languages:0.1.8": *
#import "../config/constants.typ": appendix, chapter
#import "../appendix/glossary/terms.typ": glossary-terms
#import "@preview/hydra:0.6.2": hydra
#import "@preview/retrofit:0.2.0": backrefs

// This file sets up the properties of the document and the libraries used

#let frontmatter-style(body) = {
  set page(
    numbering: "i",
    number-align: bottom + center,
    header: none,
  )
  body
}

#let frontmatter-blank-page() = {
  pagebreak()
  set page(header: none, footer: none, numbering: none)
  pagebreak()
}

#let chapter-header() = hydra(1, skip-starting: false, display: (_, it) => {
  upper(emph("Capitolo"))
  " "

  if it.numbering == none {
    upper(emph(it.body))
  } else {
    numbering(it.numbering, ..counter(heading).at(it.location()))
    ". "
    upper(emph(it.body))
  }
})

#let subchapter-header() = hydra(2, skip-starting: false, display: (_, it) => {
  if it.numbering == none {
    upper(emph(it.body))
  } else {
    numbering(it.numbering, ..counter(heading).at(it.location()))
    ". "
    upper(emph(it.body))
  }
})

#let has-h1-on-page() = {
  query(heading.where(level: 1)).any(h => h.location().page() == here().page())
}

#let page-number() = {
  numbering("1", counter(page).get().at(0))
}

#let mainmatter-style(body) = {
  counter(page).update(1)

  set page(
    numbering: none,

    header: context {
      if has-h1-on-page() {
        none
      } else if calc.odd(here().page()) [
        #page-number()
        #h(1fr)
        #chapter-header()
      ] else [
        #subchapter-header()
        #h(1fr)
        #page-number()
      ]
    },

    footer: context {
      if has-h1-on-page() {
        align(center, page-number())
      } else {
        none
      }
    },
  )

  body
}

#let blank-page() = {
  pagebreak()
  set page(header: none, footer: none, numbering: none)
  pagebreak()
}

#let fig-source(body) = body

#let config(
  myAuthor: "Alessandro Mazzariol",
  myTitle: "Titolo",
  myLang: "it",
  myNumbering: "1.1",
  body,
) = {
  // Set the document's basic properties.
  set document(author: myAuthor, title: myTitle)

  // Codly bootstrap and setup
  show: codly-init.with()
  codly(languages: codly-languages, zebra-fill: gray.lighten(90%))

  // LaTeX look https://typst.app/docs/guides/guide-for-latex-users#latex-look
  set page(
    paper: "a4",
    margin: 1.20in,
  )

  set heading(numbering: myNumbering)
  show heading.where(level: 1): it => {
    pagebreak(weak: true)

    counter(figure).update(0)

    stack(
      spacing: 2em,
      if it.numbering == "A.1" {
        text(size: 1.5em)[#appendix #counter(heading).display()]
      } else if it.numbering != none {
        text(size: 1.5em)[#chapter #counter(heading).display()]
      },
      text(size: 2em, it.body),
      [],
    )
  }

  set par(
    leading: 0.55em,
    spacing: 0.55em,
    justify: true,
  )

  set text(font: "New Computer Modern", lang: myLang)

  set figure(numbering: n => {
    let chapter = counter(heading).get().at(0)
    numbering("1.1", chapter, n)
  })

  show raw: set text(font: "DejaVu Sans Mono", size: 10pt)
  set par(spacing: 0.55em)

  show heading: set block(above: 2em, below: 1.4em)

  // Custom styling
  set list(marker: (sym.bullet, sym.dash), spacing: 1em)
  set enum(spacing: 1em)
  set table(inset: 10pt)
  set table(
    fill: (x, y) => {
      if calc.even(y) {
        gray.lighten(70%)
      } else {
        white
      }
    },
  )


  show figure: it => {
    v(1em)
    it.body
    v(1em)
    it.caption
    v(1em)
  }
  show figure: set block(breakable: true)

  let foreign(body) = text(style: "italic")[#body]

  // Il comando sotto lo tengo commentato perché altrimenti può succedere che l'immagine e la sua caption finiscano in due pagine diverse.
  // Per questo motivo ogni tabella deve essere racchiusa in un blocco di codice #{ } o di contenuto #[ ] per isolarne le regole.
  // show figure: set block(breakable: true)

  // Glossary bootstrap and setup
  show: make-glossary
  register-glossary(glossary-terms)


  show: backrefs.with(
    format: links => [
      #text(black)[(cit. a p. ]
      #text(blue)[#links.join(", ")]
      #text(black)[)]
    ],
    read: path => read("../appendix/bibliography/" + path),
  )


  body
}

// Creare delle funzioni wrapper di Glossarium è l'unica soluzione che ho trovato per personalizzare l'aspetto del testo.
// L'unica alternativa è al seguente link ma funziona solo se usi Glossarium con le ref ad esempio '@TERMINE'
// https://forum.typst.app/t/how-do-you-apply-a-style-to-glossarium-references-that-is-different-to-other-reference-types/2089
#let glossary-style(body) = {
  text(rgb("#227ae5"), body + sub[G])
}

#let gl(key, suffix: none, long: false, display: none, link: true, update: true, capitalize: false) = glossary-style(
  gls(
    key,
    suffix: suffix,
    long: long,
    display: display,
    link: link,
    update: update,
    capitalize: capitalize,
  ),
)

#let glpl(
  key,
  long: false,
  link: true,
  update: true,
  capitalize: false,
) = glossary-style(
  glspl(
    key,
    capitalize: capitalize,
    link: link,
    long: long,
    update: update,
  ),
)

// Utile per quando si introducono le tecnologie (link+corsivo+footnote)
#let linkfn(url, body) = (
  link(url, text(style: "italic", body)) + footnote(link(url))
)

#let objectives-data = yaml("../specs/stage/objectives.yaml")

#let obj-label(code) = label("obj-" + code)
#let obj-link(code) = link(obj-label(code))[
  #text(fill: rgb("#227ae5"))[#code]
]

#let prod-label(code) = label("prod-" + code)
#let prod-link(code) = link(prod-label(code))[
  #text(fill: rgb("#227ae5"))[#code]
]

#let render-objectives(data) = figure(
  caption: "Tabella obiettivi stage",
  table(
    columns: (0.18fr, 1fr),
    align: (left, left),
    table.header([*Codice*], [*Descrizione*]),
    ..data
      .objectives
      .map(obj => (
        [#metadata(none) #obj-label(obj.code) #obj.code],
        [#par(justify: false)[#obj.description]],
      ))
      .flatten(),
  ),
)

#let products-data = yaml("../specs/stage/products.yaml")

#let render-foreign-text(text, foreign-terms) = {
  let parts = text.split("%s")
  let result = []

  for (i, part) in parts.enumerate() {
    result.push(part)
    if i < foreign-terms.len() {
      result.push(foreign(foreign-terms.at(i)))
    }
  }

  result.join()
}

#let render-products(data) = figure(
  caption: "Tabella prodotti attesi",
  table(
    columns: (0.25fr, 1fr, 0.27fr),
    align: (left, left, left),
    table.header([*Codice*], [*Descrizione*], [*Obiettivo*]),
    ..data
      .products
      .map(prod => (
        [#metadata(none) #prod-label(prod.code) #prod.code],
        [#par(justify: false)[#prod.description]],
        [
          #for (i, code) in prod.objectives.enumerate() [
            #if i > 0 [#linebreak()]
            #obj-link(code)
          ]
        ],
      ))
      .flatten(),
  ),
)

