#import "config/thesis-config.typ": *
// Frontmatter
// Frontmatter
#include "preface/firstpage.typ"
#include "preface/copyright.typ"

#frontmatter-style[
  #include "preface/summary.typ"
  #frontmatter-blank-page()
  #include "preface/acknowledgements.typ"
  #frontmatter-blank-page()
  #include "preface/table-of-contents.typ"
]

// Mainmatter
#mainmatter-style[
  #include "chapters/1_introduction.typ"
  #blank-page()
  #include "chapters/2_stage-description.typ"
  #blank-page()
  #include "chapters/3_requirements.typ"
  #blank-page()
  #include "chapters/4_prog_e_cod.typ"
  #blank-page()
  #include "chapters/5_conclusion.typ"

  #blank-page()
  #include "docs/esempi.typ"
]

// Backmatter
#include "appendix/glossary/glossary.typ"
#include "appendix/bibliography/bibliography.typ"
