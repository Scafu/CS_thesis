#import "@preview/glossarium:0.5.9": (
  gls, gls-description, gls-short, glspl, make-glossary, print-glossary, register-glossary,
)
#import "@preview/codly:1.3.0": *
#import "@preview/codly-languages:0.1.8": *
#import "../config/constants.typ": appendix, chapter
#import "../appendix/glossary/terms.typ": glossary-terms

// This file sets up the properties of the document and the libraries used

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
  set page(margin: 1.20in, numbering: myNumbering, number-align: center)
  set par(
    leading: 0.55em,
    spacing: 0.55em,
    justify: true,
  )
  set text(font: "New Computer Modern", lang: myLang)
  set heading(numbering: myNumbering)
  set figure(numbering: n => {
    let chapter = counter(heading).get().at(0)
    numbering("1.1", chapter, n)
  })
  show raw: set text(font: "DejaVu Sans Mono", size: 10pt)
  set par(spacing: 0.55em)
  show heading: set block(above: 2em, below: 1.4em)
  show heading.where(level: 1): it => {
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

  // Custom styling
  set list(marker: (sym.bullet, sym.dash))
  set table(inset: 10pt)
  set table(
    fill: (x, y) => {
      if calc.even(y) {
        gray.lighten(70%)
      } else { white }
    },
  )
  show figure: it => {
    v(1em)
    it
    v(1em)
  }
  show figure: set block(breakable: true)
  let foreign(body) = text(style: "italic")[#body]
  // Il comando sotto lo tengo commentato perché altrimenti può succedere che l'immagine e la sua caption finiscano in due pagine diverse.
  // Per questo motivo ogni tabella deve essere racchiusa in un blocco di codice #{ } o di contenuto #[ ] per isolarne le regole. (se trovate un modo migliore aprite una pr :D )
  //show figure: set block(breakable: true)

  // Glossary bootstrap and setup
  show: make-glossary
  register-glossary(glossary-terms)
  body
}

// Creare delle funzioni wrapper di Glossarium è l'unica soluzione che ho trovato per personalizzare l'aspetto del testo (Sono anche più corte).
// L'unica alternativa è al seguente link ma funziona solo se usi Glossarium con le ref ad esempio '@TERMINE'
// https://forum.typst.app/t/how-do-you-apply-a-style-to-glossarium-references-that-is-different-to-other-reference-types/2089?u=ogre
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
    columns: (0.25fr, 1fr, 0.35fr),
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

