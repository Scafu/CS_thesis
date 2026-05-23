#import "./config/variables.typ": *
#import "./config/thesis-config.typ": *

#show: config.with(
  myAuthor: myName,
  myTitle: myTitle,
  myLang: myLang,
)
#show link: set text(blue)
#show cite: it => {
  // 1. Forza l'intero blocco (link e parentesi) a essere nero
  show link: set text(black)

  // 2. Intercetta SOLO i numeri (da 0 a 9) e li colora di blu
  show regex("[0-9]+"): set text(blue)

  it
}
#show ref: it => {
  show link: set text(blue)
  text(blue)[#it]
}
#include "structure.typ"
