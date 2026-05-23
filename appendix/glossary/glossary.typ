#import "../../config/constants.typ": glossary
#import "terms.typ": glossary-terms
#import "../../config/thesis-config.typ": print-glossary


#pagebreak(to: "odd")
#heading(numbering: none, glossary) <glossary>
#show link: set text(blue)
#show par: set par(spacing: 1em)
#print-glossary(glossary-terms, deduplicate-back-references: true)
