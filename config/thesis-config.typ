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
  codly(languages: codly-languages, zebra-fill: gray.lighten(95%), display-icon: true)

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

  show raw: set text(font: "DejaVu Sans Mono", size: 9pt)
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

#let foreign(body) = text(style: "italic")[#body]

#let objectives-data = yaml("../specs/stage/objectives.yaml")

#let objective-prefix(kind) = {
  if kind == "mandatory" {
    "O"
  } else if kind == "desirable" {
    "D"
  } else if kind == "facultative" {
    "F"
  }
}

#let pad-objective-number(number) = {
  if number < 10 {
    "0" + str(number)
  } else {
    str(number)
  }
}

#let objective-code(objectives, index) = {
  let objective = objectives.at(index)
  let count = 0

  for (i, current) in objectives.enumerate() {
    if i <= index and current.kind == objective.kind {
      count += 1
    }
  }

  objective-prefix(objective.kind) + "-" + pad-objective-number(count)
}

#let objective-index-by-id(id) = {
  for (i, objective) in objectives-data.objectives.enumerate() {
    if objective.id == id {
      return i
    }
  }
}

#let obj-label(id) = label("obj-" + id)
#let obj-link(id) = link(obj-label(id))[
  #text(fill: rgb("#227ae5"))[#objective-code(objectives-data.objectives, objective-index-by-id(id))]
]

#let prod-label(code) = label("prod-" + code)
#let prod-link(code) = link(prod-label(code))[
  #text(fill: rgb("#227ae5"))[#code]
]

#let us-label(id) = label("us:" + id)
#let us-link(id) = link(us-label(id))[
  #text(fill: rgb("#227ae5"))[#ref(us-label(id))]
]

#let render-source(source) = {
  if type(source) == str {
    source
  } else if type(source) == dictionary {
    if "us" in source {
      us-link(source.us)
    } else if "text" in source {
      source.text
    }
  } else if type(source) == array {
    for (i, item) in source.enumerate() [
      #if i > 0 [#linebreak()]
      #sym.bullet #h(0.4em)#render-source(item)
    ]
  }
}

#let render-rich-text(text, terms) = {
  let parts = text.split("%s")
  let result = ()

  for (i, part) in parts.enumerate() {
    result.push(part)

    if i < terms.len() {
      let term = terms.at(i)

      if term.kind == "foreign" {
        result.push(foreign(term.text))
      } else if term.kind == "glossary" {
        result.push(gl(term.key))
      } else if term.kind == "glossary-foreign" {
        result.push(foreign(gl(term.key)))
      } else if term.kind == "code" {
        result.push(raw(term.text))
      } else if term.kind == "text" {
        result.push(term.text)
      }
    }
  }

  result.join()
}

#let render-description(item) = {
  if "terms" in item {
    render-rich-text(item.description, item.terms)
  } else {
    item.description
  }
}

#let render-objectives(data) = figure(
  caption: "Tabella obiettivi stage",
  table(
    columns: (0.3fr, 1fr, 0.5fr),
    align: (left, left, left),
    table.header([*Codice*], [*Descrizione*], [*Fonte*]),
    ..data
      .objectives
      .enumerate()
      .map(pair => {
        let i = pair.at(0)
        let obj = pair.at(1)
        (
          [#metadata(none) #obj-label(obj.id) #objective-code(data.objectives, i)],
          [#par(justify: false)[#render-description(obj)]],
          [#par(justify: false)[#render-source(obj.source)]],
        )
      })
      .flatten(),
  ),
)

#let products-data = yaml("../specs/stage/products.yaml")

#let unit-tests-data = yaml("../specs/tests/unit.test.yaml")
#let integration-tests-data = yaml("../specs/tests/integration.test.yaml")
#let system-tests-data = yaml("../specs/tests/system.test.yaml")

#let test-prefix(type) = {
  if type == "unit" { "TU" } else if type == "integration" { "TI" } else { "TS" }
}

#let test-id(type, index) = {
  let prefix = test-prefix(type)
  let n = index + 1
  if n < 10 { prefix + "-0" + str(n) } else { prefix + "-" + str(n) }
}

#let test-status(status) = {
  if status == "passed" { "S" } else if status == "failed" { "NS" } else if status == "implemented" { "I" } else {
    "NI"
  }
}

#let render-tests(data, cap: "Tabella test") = {
  let base-prefix = test-prefix(data.type)
  let counters = (:)
  let rows = ()

  for t in data.tests {
    let prefix = if "subtipo" in t {
      "T" + upper(t.subtipo)
    } else {
      base-prefix
    }
    let n = counters.at(prefix, default: 0) + 1
    counters.insert(prefix, n)
    let id = if "id" in t { t.id } else { prefix + str(n) }

    let all-terms = if "terms" in t { t.terms } else { () }
    let elem-str = if "elemento" in t { t.elemento } else { "—" }
    let elem-subs = elem-str.split("%s").len() - 1
    let elem-terms = all-terms.slice(0, calc.min(elem-subs, all-terms.len()))
    let desc-terms = all-terms.slice(calc.min(elem-subs, all-terms.len()))
    let desc-str = if "description" in t { t.description } else { "" }

    rows += (
      [#id],
      [#par(justify: false)[#render-rich-text(elem-str, elem-terms)]],
      [#par(justify: false)[#render-rich-text(desc-str, desc-terms)]],
      [#test-status(if "status" in t { t.status } else { "not_implemented" })],
    )
  }

  figure(
    caption: cap,
    table(
      columns: (0.11fr, 0.2fr, 0.4fr, 0.1fr),
      align: (left, left, left, left),
      table.header([*ID*], [*Elemento*], [*Descrizione*], [*Stato*]),
      ..rows,
    ),
  )
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
        [#par(justify: false)[#render-description(prod)]],
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
