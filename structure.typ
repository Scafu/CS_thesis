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
  #include "chapters/2_stage_description.typ"
  #blank-page()
  #include "chapters/3_requirements.typ"
  #blank-page()
  #include "chapters/4_technologies.typ"
  #blank-page()
  #include "chapters/5_prog_e_cod.typ"
  //#blank-page()
  //#include "chapters/6_test_e_validation.typ"
  //#blank-page()
  //#include "chapters/7_conclusion.typ"
]

// Backmatter
#include "appendix/glossary/glossary.typ"
#include "appendix/bibliography/bibliography.typ"
