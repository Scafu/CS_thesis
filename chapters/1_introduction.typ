#import "@preview/codly:1.3.0": *
#import "@preview/codly-languages:0.1.8": *

= Introduzione <cap:introduzione>
#text(style: "italic", [
  In questo capitolo approfondisco l'organizzazione dello stage, il rapporto con l'azienda e svolgo l'analisi dei
  rischi.
])
#v(1em)

== L'azienda
#link("https://wavelop.com/")[Wavelop SRL] è una giovane software house, fondata nel 2018 con sede a Treviso, composta
da ex studenti del corso di laurea in Informatica dell'Università di Padova.\
L'azienda si occupa principalmente di sviluppo di software su misura, automazione di processi e soluzioni di
intelligenza artificiale per le PMI. Il logo dell'azienda è illustrato in figura @fig:wavelop-logo.
#v(1cm)
#figure(caption: "Logo di Wavelop SRL")[#image("../images/wavelop_logo.png", width: 80%)]<fig:wavelop-logo>


== L'idea dello stage
Lo stage proposto consiste nell'analisi, progettazione e implementazione di un'applicazione mobile multipiattaforma
(IOS/Android) in ambito pediatrico non sanitario. L'utente, in questo caso un genitore, potrà misurare la lunghezza del
piede del proprio bambino direttamente tramite lo schermo dello smartphone, consultare lo storico delle misurazioni e,
nelle fasi evolutive, accedere a un diario di crescita e a un sistema di raccomandazione taglie basato su cataloghi di
calzature per l'infanzia. In particolare lo stage richiede:
#v(0.3cm)
- Analisi e studio delle tecniche di calibrazione dello schermo e rilevazione della misura tramite interazione touch,
  garantendo precisione e affidabilità nella misurazione;
- Implementazione di un motore di misurazione e di persistenza di dati locale che sarà lo storico delle misurazioni
  effettuate dall'utente;
- Analisi e sviluppo dell'interfaccia utente in Flutter, con particolare attenzione alla User Experience (UX) e
  all'accessibilità rivolta a un pubblico non tecnico.

== Way of Working e strumenti utilizzati
L'azienda Wavelop Srl adotta una metodologia di sviluppo detta _Agile_, cioè un approccio che suddivide il lavoro in
fasi, dando la priorità alla consegna e al miglioramento continuo del prodotto. Questa metodologia favorisce la
comunicazione aperta, lavoro di squadra e la flessibilità, permettendo di adattarsi rapidamente ai cambiamenti e alle
esigenze del cliente. In particolare l'azienda utilizza il framework _Scrum_, che prevede la suddivisione del lavoro in
cicli iterativi di sviluppo chiamati _sprint_, questo framework prevede che il team di sviluppo siano divisi in team
_Scrum_, ciascuno autogestito con l'obiettivo di consegnare un incremento di prodotto funzionante alla fine di ogni
_sprint_.
#figure(caption: "Processo Scrum, tratto da: What is Scrum?, Scrum.org.")[#image(
  "../images/scrum-framework.png",
  width: 80%,
)]

== Organizzazione del testo
Al fine di presentare in modo chiaro e strutturato il progetto di stage, il documento è stato organizzato nei setuenti
capitoli:
/ #link(<cap:descrizione-stage>)[Il secondo capitolo]: descrive in dettaglio lo stage, le competenze da apprendere, i
  vincoli, la pianificazione e l'organizzazione del lavoro con la conseguente analisi dei rischi.
/ #link(<cap:analisi-requisiti>)[Il terzo capitolo]: descrive il progetto da un punto di vista analitico, descrivendo i
  casi d'uso e i relativi requisiti.
/ #link(<cap:progettazione-e-codifica>)[Il quarto capitolo]: descrive il progetto da un punto di vista progettuale,
  illustrando le scelte architetturali, la progettazione dell'interfaccia utente e le tecnologie adottate.
/ #link(<cap:conclusioni>)[Il quinto capitolo]: descrive il progetto da un punto di vista implementativo, illustrando le
  fasi di sviluppo, le difficoltà incontrate e i risultati ottenuti.
=== Convenzioni tipografiche
Durante la stesura del testo ho scelto di adottare le seguenti convenzioni tipografiche:

//Preferenze personali modificabili a discrezione tua o del relatore
- Gli acronimi, le abbreviazioni e i termini di uso non comune menzionati vengono definiti nel #link(
    <glossary>,
  )[glossario], situato alla fine del documento (#link(<glossary>)[p. #context counter(page).at(<glossary>).at(0)]);
- Per la prima occorrenza dei termini riportati nel glossario viene utilizzata la seguente nomenclatura: Parola#sub[g]


- I termini in lingua straniera non di uso comune o facenti parti del gergo tecnico sono evidenziati con il carattere
  _corsivo_;
- I nomi di funzioni o variabili appartenenti ad un linguaggio di programmazione vengono scritte con un carattere
  `monospaziato`;
- Le citazioni ad un libro o ad una risorsa presente nella #link(<bibliography>)[bibliografia] (#link(<bibliography>)[p.
    #context counter(page).at(<bibliography>).at(0)]) saranno affiancate dal rispettivo numero identificativo, es.
  $[1]$;
- I blocchi di codice sono rappresentati nel seguente modo
#v(0.5em)
```Dart
main() {
  print("Hello, World!");
}
```
#linebreak()
