#import "../config/thesis-config.typ": (
  gl, glpl, obj-link, objectives-data, prod-link, products-data, render-objectives, render-products,
)
#import "../config/variables.typ": myTutor
= Descrizione stage <cap:descrizione-stage>
#text(style: "italic", [
  Questo capitolo descrive nel dettaglio il progetto di stage svolto presso Wavelop Srl, presentandone gli obiettivi, i
  prodotti attesi, l'analisi dei rischi e gli obiettivi personali perseguiti durante
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

== Metodologia di lavoro <sez-metodologia-lavoro>
=== Metodologie Agili
All'interno di Wavelop Srl viene adottata la metodologia _Agile_, un approccio allo sviluppo software basato sulla suddivisione del lavoro in fasi iterative e incrementali, con l'obiettivo di favorire il miglioramento continuo del prodotto finale.
Questo approccio consente di avere una maggiore flessibilità nella gestione delle attività, permettendo di adattare la pianificazione alle esigenze che emergono durante lo sviluppo del prodotto. Per far si che questo approccio possa risultare efficace, è necessario che l'intero team condivida la stessa visione, orientata alla collaborazione, all'autogestione, alla partecipazione attiva all'organizzazione e alla definizione delle modalità di lavoro.
#figure(caption: "Scrum Flow, tratto da What is Scrum? di Scrum.org")[#image(
  "../images/scrum-framework.png",
  width: 90%,
)]<fig:scrum-flow>
L'utilizzo di _Scrum_ parte tutto dalla creazione di un _backlog_ del prodotto, ovvero una lista di attività che il team deve svolgere. Questa lista viene sempre rivista, è infatti una lista dinamica che si adatta in base alle esigenze e alle conoscenze che mano a mano aumentano del team. In questa lista vengono definite le _user stories_ di cui si rimanda la loro definizione alla @cap:user-stories.
Dopo aver creato la lista di requisiti, _user stories_ e altre attività, si passa alla pianificazione del periodo di lavoro chiamato _sprint_, che ha una durata di una o più settimane, in questa fase si spostano le attività dal _backlog_ creato in precedenza a quello legato al singolo _sprint_, successivamente si passa alla fase di sviluppo vero e proprio, nel quale il team collaborare per consegnare l'incremento di prodotto definito come risultato atteso dallo _sprint_. Per garantire un continuo miglioramento e sincronizzazione tra i membri del team, all'interno del periodo di sprint ci sono degli incontri giornalieri chiamati _stand up meeting_, in cui si discute in piedi riguardo a circa cosa si è fatto, cosa si farà e se ci sono eventuali difficoltà. Prendendo ad esempio Wavelop Srl, effettua questa riunione ogni giorno alle 9:15, permettendo quindi che il resto della giornata sia dedicata allo sviluppo vero e proprio. Al termine dello sprint vi è il _DoD_ e successivamente la _sprint review_, in cui si documenta e si discute riguardo a cosa ha funzionato e cosa no all'interno dello sprint, che può essere dallo sviluppo, fino al rapporto tra i membri del team, oppure la comunicazione con il cliente.
Oltre a _Scrum_, Wavelop Srl adotta anche l'approccio con _Kanban_, che è una bacheca visiva dove le attività sono rappresentate come card che si spostano da uno stato all'altro, ad esempio da "da fare" a "in corso" o "in verifica", permettendo un flusso di attività in arrivo continuo.

=== Test driven development
Oltre alle metodologie agili, discusse in precedenza, Wavelop Srl adotta anche l'approccio di sviluppo _Test Driven Development_ (TDD). Questo approccio prevede, prima di scrivere alcuna riga di codice, la scrittura di test che servono per definire il comportamento atteso da quella particolare funzionalità che si andrà a sviluppare.
Sviluppando seguendo questo approccio, costringe lo sviluppatore rallentare, convalidare e perfezionare il codice in cicli di feedback più brevi. Anche se potrebbe inizialmente sembrare controintuitivo, questo approccio rafforza la relazione tra codice, test e design, portando ad un risparmio di tempo a lungo termine, in quanto eventuali errori vengono identificati subito, evitando che questi possano diventare più grandi nel corso dello sviluppo. Questo approccio porta quindi ad un miglioramento della qualità e leggibilità del codice, portando alla formazione di flussi di lavoro che portano a codice stabile e di alta qualità a livello di unità.
#figure(caption: "Le 5 fasi del TDD, tratto da IBM Developer")[#image(
  "../images/tdd.png",
  width: 90%,
)]<fig:tdd>
Come si può vedere dalla @fig:tdd, il processo di sviluppo basato su test può essere racchiuso in 5 passaggi che si ripetono ciclicamente.
1. *Scrivere test di unità*: prima di passare a scrivere codice 
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
