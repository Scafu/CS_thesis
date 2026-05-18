#import "../config/thesis-config.typ": (
  gl, glpl, obj-link, objectives-data, prod-link, products-data, render-objectives, render-products,
)
#import "../config/variables.typ": myTutor
= Descrizione stage<cap:descrizione-stage>
#text(style: "italic", [
  Questo capitolo descrive nel dettaglio il progetto di stage svolto presso Wavelop Srl, presentandone gli obiettivi, i
  prodotti attesi, la pianificazione delle attività, l'analisi dei rischi e gli obiettivi personali perseguiti durante
  l'esperienza formativa.
])
#v(1em)
== Obiettivi <sez-obiettivi>
All'inizio di ogni periodo di stage, Wavelop Srl definisce un insieme di obiettivi da perseguire. Tali obiettivi hanno
una duplice finalità: permettere al tirocinante di comprendere gli aspetti su cui focalizzare maggiormente il proprio
lavoro e fornire all'azienda criteri utili alla valutazione delle attività svolte, anche in vista di un eventuale
inserimento lavorativo.

Nel presente documento gli obiettivi verranno identificati secondo le seguenti convenzioni:
- *O* per gli obiettivi obbligatori, vincolanti in quanto obiettivo primario richiesto dal committente;
- *D* per gli obiettivi desiderabili, non vincolanti o strettamente necessari, ma dal riconoscibile valore aggiunto;
- *F* per gli obiettivi facoltativi, rappresentanti valore aggiunto non strettamente competitivo.
Le sigle saranno seguite da una coppia sequenziale di numeri, identificativo dell'obiettivo.

#render-objectives(objectives-data)
== Prodotti attesi <sez-prodotti-attesi>
Oltre agli obiettivi definiti, Wavelop Srl individua anche una serie di prodotti attesi, con lo scopo di descrivere in
modo concreto i risultati da conseguire al termine dello stage. Per ciascun prodotto attesso riportato di seguito, il
livello minimo previsto corrisponde al completamente degli obiettivi indicati, mentre il livello massimo comprende il
conseguimento di tutti gli obiettivi citati nella @sez-obiettivi.

#render-products(products-data)

== Pianificazione del lavoro
Lo stage prevedeva un impegno complessivo compreso tra 300 e 320 ore, distribuite nei mesi di maggio e giugno, con una
media di otto ore lavorative giornaliere. L'attività è stata svolta in modalità ibrida, alternando giornate in presenza
presso la sede aziendale a giornate di lavoro da remoto.
=== Pianificazione Settimanale
A partire dalla terza settimana, la pianificazione del lavoro è stata organizzata tramite sprint della durata di una
settimana. Al termine di ciascuno sprint era previsto un incontro con gli stakeholder finalizzato alla revisione dei
risultati raggiunti, all'allineamento sullo stato di avanzamento del progetto e alla definizione delle attività previste
per il periodo successivo.

Per ogni periodo di lavoro è associato un riferimento ai prodotti attesi specificati nella @sez-prodotti-attesi.
#v(0.8em)
- *Prima Settimana* (40 ore): #prod-link("PA-01"), #prod-link("PA-02")
  #v(0.8em)
  - Incontro con gli stakeholder per definire i dettagli del progetto, per discutere requisiti e richieste relativamente
    all'applicazione da sviluppare;
  - Introduzione alla Cultura Aziendale;
  - Formazione sulle tecnologie adottate (_Flutter_, _Node.js_ con _Fastify_, _Auth0_);
  - Presa visione dell'infrastruttura esistente e assegnazione dei relativi strumenti necessari;
  - Analisi dei requisiti.
#v(0.8em)
- *Seconda Settimana* (40 ore): #prod-link("PA-01"), #prod-link("PA-02")
  #v(0.8em)
  - Analisi dei requisiti;
  - Idealizzazione di _Flow_ e _Wireframe_ dell'applicazione;
  - Progettazione architetturale (Struttura app Flutter, modello dati locale, definizione API backend).
#v(0.8em)
- *Terza Settimana* (40 ore): #prod-link("PA-02")
  #v(0.8em)
  - Progettazione architetturale;
  - Analisi e definizione storie per il backlog dello Sprint successivo assieme al referente.
#v(0.8em)
- *Quarta Settimana* - *Settima Settimana* (160 ore): #prod-link("PA-03"), eventuale #prod-link("PA-04")
  #v(0.8em)
  - Sviluppo tramite la metodologia del #gl("TDD") delle storie assegnate durante gli sprint.
  - Stesura documentazione.
#v(0.8em)
- *Ottava Settimana* (40 ore): #prod-link("PA-03"), eventuale #prod-link("PA-04"), #prod-link("PA-05")
  #v(0.8em)
  - Sviluppo tramite la metodologia del TDD delle storie assegnate (rifinitura #gl("UI"), gestione casi limite);
  - Collaudo finale e incontro finale con gli stakeholder;
  - Stesura documentazione.
#v(0.8em)

=== Bilancio complessivo

#figure(caption: "Tabella ore complessive", table(
  columns: (1fr, 0.5fr, 0.5fr),
  align: left,
  table.header([*Attività*], [*Settimana*], [*Ore di lavoro*]),
  [Comprensione sistema e obiettivi], [1], [20],
  [Analisi dei requisiti], [1-2], [40],
  [Progettazione], [2-3], [50],
  [Implementazione], [4-8], [112],
  [Test e validazione], [4-8], [68],
  [Documentazione], [2-8], [10],
  table.cell(colspan: 2)[Totale], [300],
))

== Analisi dei rischi
In questa fase iniziale sono stati identificati i seguenti rischi divisi in tre aree principali, organizzativi,
tecnologici e personali.

=== Rischi organizzativi
Rischi relativi alla stime ed all'assegnazione delle attività ad un determinato sprint. Questa tipologia di rischio può
essere mitigata attraverso le _sprint review_, in cui si analizzano i risultati raggiunti e si pianificano le attività
per lo _sprint_ successivo oppure si aggiustano le attività non completate.

==== Mancato rispetto delle scadenze stabilite
- *Descrizione*: Durante lo sviluppo del prodotto possono verificarsi ritardi rispetto al conseguimento delle task
  fissate, comportando un prolungamento dei tempi di completamento delle task e nel peggiore dei casi un ritardo nella
  data di consegna finale del prodotto.
- *Mitigazione*: Eventuali ritardi dovranno essere comunicati tempestivamente e motivati, cercando di mitigare l'impatto
  sulle task successive. Nelle sprint review questo ritardo sarà oggetto di discussione per capire se è necessario
  rivedere la pianificazione delle attività successive.
- *Probabilità*: Media - Bassa
- *Impatto prestazionale*: Alto


=== Rischi tecnologici
Rischi relativi alle tecnologie da implementare e le prassi da utilizzare nel processo di sviluppo. Questo tipo di
rischio può essere mitigato attraverso colloquio con il tutor aziendale oppure attraverso gli _stand up meeting_
giornalieri, in cui si discute dell'andamento ed eventuali difficoltà riscontrate.

==== Errori di programmazione
- *Descrizione*: Risulta altamente improbabile che il prodotto finale sia privo di bug o errori di programmazione, che
  potrebbero compromettere il corretto funzionamento dello stesso.
- *Mitigazione*: Sarà necessario implementare un sistema di testing e debugging efficace, al fine di limitare al minimo
  la presenza di bug e garantire il funzionamento corretto del prodotto nella sua interezza.
- *Probabilità*: Media - Alta
- *Impatto prestazionale*: Medio

=== Rischi personali
Rischi relativi a fattori personali che potrebbero causare rallentamenti o interruzioni temporanee del lavoro. Questo
tipo di rischio può essere mitigato attraverso una comunicazione chiara e tempestiva con il tutor aziendale, in modo da
poter ripianificare il lavoro per limitare i danni.
==== Indisponibilità temporanee
- *Descrizione*: Durante lo sviluppo potrebbero esserci indisponibilità temporanee, causando un rallentamento momentaneo
  del lavoro.
- *Mitigazione*: In caso di assenze temporanee, sarà necessario comunicare tempestivamente la situazione, cercando di
  recuperare il tempo perso una volta rientrati.
- *Probabilità*: Bassa
- *Impatto prestazionale*: Medio

== Obiettivi personali
Di seguito sono riportati gli obiettivi personali che mi hanno spinto a scegliere questo progetto di stage presso
Wavelop Srl:

- *Azienda di piccole dimensioni e giovane*: essendo un'azienda di piccole dimensioni, Wavelop Srl offre l'opportunità
  di essere coinvolti a 360 gradi in tutte le fasi del processo di sviluppo, favorendo la comunicazione tra tutti i
  membri del team, senza trascurare il tirocinante, considerandolo a tutti gli effetti un membro del team stesso.

- *Metodologie Agili*: l'adozione di metodologie agili, in particolare _Scrum_ e _user stories_, hanno rappresentato un
  fattore chiave nella scelta del progetto, in quanto mi hanno permesso di lavorare con uno stimolo costante, favorendo
  l'apprendimento continuo e come crescita personale i confronti con i colleghi e con il tutor aziendale.

- *Stesso percorso di studi universitari*: il fatto che l'intero team derivi dallo stesso percorso di studi universitari
  ha permesso a Wavelop Srl di creare un progetto di stage molto in linea con le mie esigenze formative e di tempistica
  richieste dall'Ateneo.

- *Possibilità di inserimento in azienda*: aver fatto colloqui diretti con i fondatori dell'azienda e aver avuto la
  possibilità di confrontarmi con loro, ha rappresentato un fattore determinante nella valutazione di un possibile
  inserimento lavorativo, in quanto Wavelop Srl sia un'azienda con l'obiettivo principale di apprendere e far crescere i
  propri dipendenti, rispetto ad il mero profitto economico.

- *Possibilità di validare le conoscenze pregresse*: il progetto proposto dall'azienda mi ha dato la possibilità di
  validare le conoscenze che avevo già acquisito prima di iniziare lo stage. In particolare nella fase di progettazione,
  ho potuto mettere in pratica le conoscenze acquisite durante il corso di Ingegneria del Software, lasciando spazio
  però anche alla sperimentazione e all'apprendimento di nuovi concetti fondamentali.
