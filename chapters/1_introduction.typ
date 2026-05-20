#import "@preview/codly:1.3.0": *
#import "@preview/codly-languages:0.1.8": *

= Introduzione <cap:introduzione>
#text(style: "italic", [
  In questo capitolo introduttivo viene presentata l'azienda ospitante, l'idea dello stage, l'organizzazione e la forma stilistica addotata per la stesura del presente documento.
])
#v(1em)

== L'azienda
#link("https://wavelop.com/")[Wavelop SRL] è una giovane software house fondata nel 2018 con sede a Treviso, nata dall'iniziativa di ex studenti del corso di laurea in Informatica dell'Università di Padova.\
L'azienda opera nel settore dello sviluppo software e della consulenza IT, supportando principalmente piccole e medie imprese nella realizzazione di soluzioni digitali personalizzate.
L'approccio operativo dell'azienda è fortemente orientato alla collaborazione con il cliente e all'adozione di metodologie agili, con l'obiettivo di garantire un continuo miglioramento del prodotto finale.
Particolare attenzione viene dedicata alla progettazione dell'esperienza utente (UX) e all'interfaccia (UI), adottando un approccio _user-centered_ facendo attività di prototipazione per validare la soluzione proposta.
Il nome dell'azienda richiama in modo simbolico l'idea di "cavalcare l'onda dell'innovazione tecnologica", sottolineando la volontà di proporre soluzioni basate su tecnologie moderne e in continua evoluzione.
Il logo dell'azienda è illustrato in figura @fig:wavelop-logo.
#v(1cm)
#figure(caption: "Logo di Wavelop SRL")[#image("../images/wavelop_logo.png", width: 80%)]<fig:wavelop-logo>


== L'idea dello stage
Lo stage proposto da Wavelop Srl si inscerisce nel contesto dello sviluppo di applicazioni per dispositivi mobili, ponendo particolare attenzione ai processi che portano alla realizzazione dell'applicazione piuttosto che al risultato finale.
#v(1em)
Il progetto di stage nasce dall'esigenza, espressa da un osteopata, di disporre di una piattaforma sulla quale gli utenti, presubilmente genitori, possano far affidamento per monitorare la crescita dei piedi e del percentile dei propri figli, ricevendo direttamente nell'applicazione un riscontro oggettivo basato su dati reali.
L'applicazione si colloca quindi in un contesto pediatrico non sanitario e mira a fornire un servizio completo all'utente, mettendo a disposizione un diario digitale basato sulle misurazioni effettuate sul bambino tramite un sistema touch che consente di misurare direttamente il piede attraverso lo schermo dello _smartphone_.
#v(1em)
L'obiettivo dello stage, dal punto di vista aziendale, è quello di offrire allo stagista un'esperienza lavorativa completa che copra tutte le fasi del ciclo di sviluppo software all'interno di un contesto professionale. Durante il percorso viene posta particolare attenzione al continuo dialogo con il cliente, in questo caso rappresentato dal tutor aziendale e all'applicazione delle metodologie adottate dall'azienda, descritte in dettaglio nella @sez-metodologia-lavoro.




== Organizzazione del testo
=== Struttura del documento
Al fine di presentare in modo chiaro e strutturato il progetto di stage, il documento è stato organizzato nei seguenti
capitoli:
#v(0.8em)
/ #link(
    <cap:descrizione-stage>,
  )[Il secondo capitolo]: descrive in dettaglio il percorso di stage, illustrando gli obiettivi, la metodologia di lavoro adottata, l'analisi dei rischi e infine gli obiettivi personali prefissati.
  #v(0.5em)
/ #link(<cap:analisi-requisiti>)[Il terzo capitolo]: descrive il progetto da un punto di vista analitico, descrivendo i
  casi d'uso e i relativi requisiti.
  #v(0.5em)
/ #link(
    <cap:tecnologie>,
  )[Il quarto capitolo]: descrive le tecnologie adottate per lo sviluppo dell'applicazione, illustrando le motivazioni alla base della scelta e le caratteristiche principali di ciascuna tecnologia.
  #v(0.5em)
/ #link(
    <cap:progettazione-e-codifica>,
  )[Il quinto capitolo]: descrive il progetto da un punto di vista progettuale,
  illustrando le scelte architetturali, la progettazione dell'interfaccia utente.
  #v(0.5em)
/ #link(
    <cap:test-e-validazione>,
  )[Il sesto capitolo]: descrive i test effettuati per verificare la correttezza implementativa e la validazione del prodotto, mostrando i risultati ottenuti e le eventuali criticità riscontrate.
  #v(0.5em)
/ #link(
    <cap:conclusioni>,
  )[Il settimo capitolo]: presenta le conclusioni del progetto di stage, evidenziando i risultati raggiunti, le difficoltà incontrate e le prospettive future per l'applicazione sviluppata.
=== Convenzioni tipografiche
Durante la stesura del testo sono state adottate le seguenti convenzioni tipografiche:

- Gli acronimi, le abbreviazioni e i termini di uso non comune menzionati vengono definiti nel #link(<glossary>)[glossario], situato alla fine del documento (#link(<glossary>)[p. #context counter(page).at(<glossary>).at(0)]);
- Per la prima occorrenza dei termini riportati nel glossario viene utilizzata la seguente nomenclatura: Parola#sub[g]


- I termini in lingua straniera non di uso comune o facenti parti del gergo tecnico sono evidenziati con il carattere
  _corsivo_;
- I nomi di funzioni o variabili appartenenti ad un linguaggio di programmazione vengono scritte con un carattere
  `monospaziato`;
- Le citazioni ad un libro o ad una risorsa presente nella #link(<bibliography>)[bibliografia] (#link(<bibliography>)[p.
    #context counter(page).at(<bibliography>).at(0)]) saranno in formato _IEEE_ affiancate dal rispettivo numero identificativo, es.
  $[1]$;
- I blocchi di codice sono rappresentati nel seguente modo
#v(1em)
```Dart
void main() {
  print("Hello, World!");
}
```
