#import "@preview/codly:1.3.0": *
#import "@preview/codly-languages:0.1.8": *

= Introduzione <cap:introduzione>
#text(style: "italic", [
  In questo capitolo introduttivo viene presentata l'azienda ospitante, l'idea dello stage, l'organizzazione, la
  struttura e la forma stilistica adottata per la stesura del presente documento.
])
#v(1em)

== L'azienda
#link("https://wavelop.com/")[Wavelop SRL] è una giovane software house fondata nel 2018 con sede a Treviso, nata
dall'iniziativa di ex studenti del corso di laurea in Informatica dell'Università di Padova.\
L'azienda opera nel settore dello sviluppo software e della consulenza IT, supportando principalmente piccole e medie
imprese nella realizzazione di soluzioni digitali personalizzate. L'approccio operativo dell'azienda è fortemente
orientato alla collaborazione con il cliente e all'adozione di metodologie agili, con l'obiettivo di garantire un
continuo miglioramento del prodotto finale. Particolare attenzione viene dedicata alla progettazione dell'esperienza
utente (UX) e all'interfaccia (UI), adottando un approccio _user-centered_ attraverso attività di prototipazione per
validare la soluzione proposta. Il nome dell'azienda richiama in modo simbolico l'idea di "cavalcare l'onda
dell'innovazione tecnologica", sottolineando la volontà di proporre soluzioni basate su tecnologie moderne e in continua
evoluzione. Il logo dell'azienda è illustrato in figura @fig:wavelop-logo.
#v(1cm)
#figure(caption: "Logo di Wavelop SRL")[#image("../images/wavelop_logo.png", width: 80%)]<fig:wavelop-logo>


== L'idea dello stage
Lo stage proposto da Wavelop Srl si inserisce nel contesto dello sviluppo di applicazioni per dispositivi mobili,
ponendo particolare attenzione ai processi che portano alla realizzazione dell'applicazione piuttosto che al risultato
finale.
#v(1em)
Il progetto di stage nasce dall'esigenza, espressa da un osteopata, di disporre di una piattaforma sulla quale gli
utenti, presumibilmente genitori, possano far affidamento per monitorare la crescita dei piedi e del percentile dei
propri figli, ricevendo direttamente nell'applicazione un riscontro oggettivo basato su dati reali. L'applicazione si
colloca quindi in un contesto pediatrico non sanitario e mira a fornire un servizio completo all'utente, mettendo a
disposizione un diario digitale basato sulle misurazioni effettuate sul bambino tramite un sistema _touch_ che consente
di misurare direttamente il piede attraverso lo schermo dello _smartphone_.
#v(1em)
L'obiettivo dello stage, dal punto di vista aziendale, è quello di offrire allo stagista un'esperienza lavorativa
completa che copra tutte le fasi del ciclo di sviluppo software all'interno di un contesto professionale. Durante il
percorso viene posta particolare attenzione al continuo dialogo con il cliente, in questo caso rappresentato dal tutor
aziendale e all'applicazione delle pratiche adottate dall'azienda, descritte in dettaglio nella @sez-metodologia-lavoro.




== Organizzazione del testo
=== Struttura del documento
Al fine di presentare in modo chiaro e strutturato il progetto di stage, il documento è stato organizzato nei seguenti
capitoli:
#v(0.8em)
/ #link(<cap:descrizione-stage>)[Il secondo capitolo]: descrive in dettaglio il percorso di stage, illustrando gli
  obiettivi, la metodologia di lavoro adottata, l'analisi dei rischi e infine gli obiettivi personali prefissati;
  #v(0.5em)
/ #link(<cap:analisi-requisiti>)[Il terzo capitolo]: descrive il progetto da un punto di vista analitico, definendo i
  gli elementi principali e i relativi requisiti;
  #v(0.5em)
/ #link(<cap:tecnologie>)[Il quarto capitolo]: descrive le tecnologie e gli strumenti adottati per lo sviluppo
  dell'applicazione, illustrando le motivazioni alla base della scelta e le caratteristiche principali di ciascuno;
  #v(0.5em)
/ #link(<cap:progettazione-e-codifica>)[Il quinto capitolo]: descrive il progetto da un punto di vista progettuale,
  illustrando le scelte architetturali e la codifica implementativa, con particolare attenzione alla struttura
  dell'applicazione e alle funzionalità principali;
  #v(0.5em)
/ #link(<cap:test-e-validazione>)[Il sesto capitolo]: descrive i _test_ effettuati per verificare la correttezza
  implementativa e la validazione del prodotto, mostrando i risultati ottenuti e le eventuali criticità riscontrate;
  #v(0.5em)
/ #link(<cap:conclusioni>)[Il settimo capitolo]: presenta le conclusioni del progetto di stage, evidenziando i risultati
  raggiunti, le difficoltà incontrate e le prospettive future per l'applicazione sviluppata.
=== Convenzioni tipografiche
Durante la stesura del testo sono state adottate le seguenti convenzioni tipografiche:

- gli acronimi, le abbreviazioni e i termini di uso non comune menzionati vengono definiti nel Glossario, situato alla
  fine del documento (p. #link(<glossary>)[#context counter(page).at(<glossary>).at(0)]);
- per la prima occorrenza dei termini riportati nel glossario viene utilizzata la seguente nomenclatura: Parola#sub[g];


- i termini in lingua straniera non di uso comune o facenti parte del gergo tecnico sono evidenziati con il carattere
  _corsivo_;
- i nomi di funzioni o variabili appartenenti ad un linguaggio di programmazione vengono scritte con un carattere
  `monospaziato`;
- le citazioni ad un libro o ad una risorsa presente nella Bibliografia (p. #link(
    <bibliography>,
  )[#context (
    counter(page).at(<bibliography>).at(0)
  )]) saranno in formato _IEEE_ affiancate dal rispettivo numero identificativo, es. $[1]$;
- i blocchi di codice sono rappresentati nel seguente modo:

#figure(
  ```Dart
  void main() {
    print("Hello, World!");
  }
  ```,
  caption: [Esempio di blocco di codice in Dart],
  kind: raw,
)

