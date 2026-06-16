#import "../config/thesis-config.typ": gl, glpl
#import "../config/variables.typ": myTutor
= Descrizione stage <cap:descrizione-stage>
#text(style: "italic", [
  Questo capitolo descrive nel dettaglio il progetto di stage svolto presso Wavelop Srl, presentandone le metodologie di
  lavoro adottate, l'analisi dei rischi e gli obiettivi personali perseguiti durante l'esperienza formativa.
])
#v(1em)
== Metodologia di lavoro <sez-metodologia-lavoro>
=== Metodologie Agili
All'interno di Wavelop Srl viene adottata la metodologia _Agile_, un approccio allo sviluppo software basato sulla
suddivisione del lavoro in cicli iterativi e incrementali, con l'obiettivo di favorire il miglioramento continuo del
prodotto finale. Questa metodologia garantisce una maggiore flessibilità nella gestione delle attività, permettendo di
adattare tempestivamente la pianificazione alle esigenze che emergono durante lo sviluppo del prodotto. Affinché tale
approccio risulti efficace, è fondamentale che l'intero team condivida la stessa visione, orientata alla collaborazione,
all'autogestione e alla partecipazione attiva sia nella progettazione sia nella definizione delle modalità di lavoro.
#figure(caption: [Framework Scrum])[#image(
  "../images/scrum-framework.png",
  width: 90%,
)]<fig:scrum-flow>
Come illustrato nella @fig:scrum-flow, l'applicazione del _framework_ _Scrum_ si articola a partire dal _Product
Backlog_, un elenco dinamico e costantemente aggiornato delle attività e dei requisiti che il team deve soddisfare.
All'interno di questa lista vengono definite le _user stories_, la cui trattazione approfondita è rimandata alla
@cap:user-stories.
#v(0.5em)
A partire dal _Product Backlog_, il team passa alla fase di pianificazione dello _Sprint_, un intervallo temporale di
sviluppo la cui durata varia da una a quattro settimane. Durante questa fase chiamata _Sprint Planning_, i task
selezionati vengono spostati dal _Product Backlog_ allo _Sprint Backlog_, un elenco di attività che il team si impegna a
completare entro la fine dello _Sprint_. Successivamente ha inizio lo sviluppo vero e proprio, in cui il team collabora
attivamente per rilasciare l'incremento di prodotto previsto.
#v(0.5em)
Per garantire il costante allineamento e la sincronizzazione tra i membri del team, ogni ciclo include brevi incontri
giornalieri chiamati _Daily Scrum_ in cui si discute del lavoro svolto, delle attività pianificate per la giornata e le
eventuali difficoltà riscontrate. In Wavelop Srl, questa riunione si tiene quotidianamente nella prima parte della
mattinata, consentendo di pianificare la giornata senza sottrarre tempo prezioso alle attività di sviluppo.
#v(0.5em)
Al termine di ogni _Sprint_, viene analizzato il grado di completamento dei criteri definiti dalla _Definition of Done_
(#gl("DoD")) che sancisce la prontezza dell'incremento. Seguono quindi la _Sprint Review_, per presentare il lavoro
svolto, e la _Sprint Retrospective_, un momento di analisi in cui il team valuta i processi adottati, le dinamiche di
lavoro e la comunicazione interna, identificando eventuali aree di miglioramento per i cicli successivi.
#v(0.5em)
In parallelo a _Scrum_, Wavelop Srl integra l'approccio _Kanban_, basato su una bacheca visiva in cui i task sono
rappresentati da schede (_Card_) che si spostano progressivamente tra diversi stati di avanzamento (ad esempio, "Da
fare", "In corso" e "In verifica"), ottimizzando la gestione e la fluidità del flusso di lavoro.



==== User stories<cap:user-stories>
Al posto dei casi d'uso tradizionali, per l'analisi dei requisiti delle funzionalità del progetto di stage, è stato
deciso di adottare le _user stories_. Questa scelta è motivata dal fatto che rappresentano uno degli strumenti
principali utilizzati nelle metodologie _Agile_, approccio seguito da Wavelop Srl.
#v(0.5em)
Una _user story_ consiste in una breve descrizione generale e informale di una funzionalità o di un requisito software,
scritta dal punto di vista dell'utente finale. L'obiettivo principale di questi strumenti è quello di evidenziare il
valore che una funzionalità o un requisito può portare all'utilizzatore del sistema. Ogni _user story_ è composta da tre
aspetti:
#v(1em)
1. *Carta*: descrizione sintetica scritta della funzionalità, utilizzata come riferimento durante la pianificazione e
  come promemoria;
2. *Conversazione*: confronto tra le parti coinvolte per chiarire i dettagli della storia;
3. *Conferma*: insieme di test o criteri di accettazione che determinano quando la storia può essere considerata
  completata.
#v(1em)
Nonostante la loro efficacia, le _user stories_ presentano un'elevata astrazione e, se non adeguatamente definite,
possono portare ad ambiguità e incomprensioni all'interno del team di sviluppo. Per questo motivo, nelle fasi iniziali
dell'analisi è importante definire la grandezza e il livello di dettaglio delle _user stories_. Più _user stories_
correlate possono essere raggruppate in _epic_, ovvero un insieme di funzionalità che condividono un obiettivo comune.
Generalmente si preferisce definire storie piccole e specifiche, piuttosto che poche storie grandi e generiche così da
facilitare la divisione del lavoro e la pianificazione.
#v(0.5em)
Un progetto basato sulle _user stories_, definito _story-driven_, segue un ritmo di sviluppo differente rispetto ai
modelli tradizionali. In particolare, il cliente viene coinvolto durante l'intero ciclo di sviluppo del software, in
linea con i principi della metodologia _Agile_. Il lavoro viene organizzato in iterazioni dette _sprint_, ovvero cicli
di sviluppo a durata fissa al termine dei quali viene consegnato codice funzionante.
#v(0.5em)
Le _user stories_ iniziali vengono solitamente definite durante un workshop collaborativo, ma possono essere aggiunte o
modificate in qualsiasi momento del ciclo di sviluppo. Successivamente si procede con la stima della complessità di ogni
storia e si stabilisce una durata fissa per le iterazioni, generalmente compresa tra una e quattro settimane e rimane
costante per l'intera durata del progetto. Al termine di ogni iterazione, il team di sviluppo è responsabile di
consegnare codice funzionante per alcuni aspetti del prodotto finale #cite(<def-user-stories>).
#v(0.5em)
I vantaggi principali dell'utilizzo delle _user stories_ #cite(<def-user-stories>, supplement: [pp. 13-14]) sono:
#v(1em)
- *Mettono il focus sulla comunicazione verbale*: le _user stories_ hanno lo scopo di rappresentare in modo sintetico
  una funzionalità fungendo da supporto alle conversazioni tra cliente e team di sviluppo e favorendo quindi la
  comunicazione tra le parti;
- *Comprensibili da entrambe le parti*: le _user stories_ essendo scritte in un linguaggio semplice e non tecnico,
  risultano facilmente comprensibili sia dal cliente sia dal team di sviluppo, mettendo in evidenza il valore della
  funzionalità o del requisito descritto;
- *Dimensione adatta alla pianificazione*: le _user stories_ hanno dimensioni adattabili e questo permette al team di
  pianificare il lavoro in base alle proprie capacità e necessità.
- *Funzionano per lo sviluppo iterativo*: le _user stories_ non devono essere scritte tutte all'inizio del progetto, ma
  possono essere modificate e aggiunte in qualsiasi momento, questo permette al software di evolversi attraverso
  iterazioni successive, permettendo di raffinare anche le singole _user stories_;
- *Incoraggiano il rinvio del dettaglio*: le _user stories_ non devono essere dettagliate completamente all'inizio del
  progetto, ma possono rimanere volutamente vaghe e approfondite solo quando necessario, risparmiando tempo e risorse;
- *Favoriscono la crescita della conoscenza tra le parti*: dato che le _user stories_ mettono l'enfasi sulla
  comunicazione verbale e ripetuta nel tempo, permettono una crescita sostanziale della conoscenza tra le parti,
  facilitando la comprensione reciproca e la collaborazione.

#v(0.5em)
== Test _driven_ _development_ <sez-tdd>
Oltre alle metodologie agili discusse in precedenza, Wavelop Srl adotta l'approccio di sviluppo _Test Driven
Development_ (TDD) #cite(<tdd>). Questa metodologia prevede, prima di scrivere qualsiasi riga di codice, la scrittura di
test volti a definire il comportamento atteso dalla determinata funzionalità da implementare. Sviluppare secondo questo
paradigma costringe dunque lo sviluppatore a rallentare il processo di sviluppo, focalizzandosi sulla validazione e
perfezionamento del codice in cicli di feedback più brevi. Anche se inizialmente questo approccio può sembrare
controintuitivo, in realtà rafforza la relazione tra codice, test e design, traducendosi in benefici a lungo termine,
gli errori vengono identificati in modo immediato, evitandone una propagazione nel corso dello sviluppo. Di conseguenza
il TDD favorisce il miglioramento della qualità e della leggibilità del codice, strutturando flussi di lavoro che
garantiscono software stabile e ad alta affidabilità a livello di unità.
#v(1em)
Come mostrato nella @fig:tdd, il processo di sviluppo basato sui test prevede 5 fasi cicliche:
1. *Scrivere test di unità*: prima di implementare una funzionalità, lo sviluppatore scrive un test di unità specifico
  per essa;
2. *Eseguire i test*: dopo la scrittura, lo sviluppatore esegue il test con l'aspettativa che fallisca, questa fase è
  chiamata _"Red"_;
3. *Scrivere codice*: una volta riscontrato che il test è fallito, si scrive il minimo di codice necessario a far
  superare il test, entrando così nella fase _"Green"_;
4. *Rifattorizzare*: superato il test, si passa alla fase di _Refactor_, nella quale si ristruttura il codice scritto e
  i relativi test, eliminando ridondanze e migliorandone la qualità generale;
5. *Ripetere*: una volta che anche il codice rifattorizzato supera il test, lo sviluppatore può passare alla
  funzionalità successiva, ripetendo l'intero ciclo.
#v(1em)
#figure(
  caption: [Le 5 fasi del TDD, diagramma rielaborato#[\
      #text()[Fonte dell'immagine: #cite(<tdd-5-fasi>)]]<no-index>],
)[#image(
  "../images/tdd.png",
  width: 80%,
)]<fig:tdd>

==== Vantaggi e problematiche
Sebbene la produzione del codice secondo questo approccio offra notevoli benefici a lungo termine, essa introduce anche
un certo grado di complessità. I principali benefici di questo approccio sono:
- *Strumento di documentazione*: i cicli iterativi di sviluppo permettono di ottenere una documentazione completa che si
  aggiorna in modo dinamico, poiché l'intero codice prodotto è coperto da almeno un test;
- *Integrazione Continua (#gl("CI"))*: questo approccio si integra perfettamente con le pratiche di Integrazione
  Continua, poiché i test possono essere eseguiti automaticamente ad ogni rilascio, intercettando tempestivamente
  eventuali regressioni causate da modifiche frequenti;
- *Rafforzamento del design*: la fase di _Refactor_ forza gli sviluppatori a semplificare la struttura del codice
  costantemente, incrementandone la qualità;
- *Consolidamento dei modelli mentali*: parallelamente al punto precedente, lo sviluppatore è costretto a comprendere a
  fondo i requisiti prima di poter scrivere codice, rafforzando così la visione d'insieme delle funzionalità da
  implementare.
#v(1em)
Di contro, l'adozione del TDD porta con sé alcune problematiche non trascurabili:
#v(0.5em)
- *Codice Boilerplate*: la necessità di scrivere test per ogni singola funzionalità comporta un aumento volumetrico del
  codice totale, incrementando complessivamente la base di codice da dover mantenere;
- *Falso senso di sicurezza*: la copertura dei test non garantisce necessariamente codice di qualità e questo può
  portare a sottostimare la complessità delle funzionalità;
- *Perdita della visione d'insieme*: l'estrema focalizzazione sui singoli componenti può talvolta far perdere di vista
  l'integrazione generale del sistema, portando a problemi di integrazione qualora non fossero stati scritti test
  adeguati.
#v(0.5em)
Durante lo stage, lo sviluppo si è svolto seguendo questo approccio laddove possibile, cercando di bilanciare i benefici
e le criticità sopra elencate, con l'obiettivo di ottenere un prodotto finale di qualità e mantenibile nel tempo.
== Analisi dei rischi
In questa fase iniziale, i rischi identificati sono stati suddivisi in tre aree principali: organizzativi, tecnologici e
personali.

=== Rischi organizzativi
I rischi organizzativi sono legati alle stime e all'assegnazione delle attività all'interno di un determinato sprint.
Questa tipologia di criticità può essere mitigata attraverso le _sprint review_, durante le quali si analizzano i
risultati raggiunti, si pianificano le attività per lo _sprint_ successivo e si ricalibrano quelle non completate.
#v(1em)
*1. Mancato rispetto delle scadenze stabilite*
#v(1em)

*Descrizione:* durante lo sviluppo del prodotto possono verificarsi ritardi rispetto al conseguimento delle task
fissate, comportando un prolungamento dei tempi di completamento delle task e nel peggiore dei casi un ritardo nella
data di consegna finale del prodotto.

*Mitigazione:* eventuali ritardi dovranno essere comunicati tempestivamente e motivati, cercando di mitigare l'impatto
sulle task successive. Nelle _sprint review _questo ritardo sarà oggetto di discussione per capire se è necessario
rivedere la pianificazione delle attività successive.



=== Rischi tecnologici
I rischi tecnologici sono relativi alle tecnologie da adottare e alle prassi da seguire nel processo di sviluppo. Tali
problematiche possono essere mitigate attraverso un confronto continuo con il tutor aziendale oppure attraverso gli
_stand up meeting_ giornalieri, in cui si discute dell'andamento ed eventuali difficoltà riscontrate.
#v(1em)
*1. Errori di programmazione*
#v(1em)
*Descrizione*: risulta altamente improbabile che il prodotto finale sia privo di bug o errori di programmazione, che
potrebbero compromettere il corretto funzionamento dello stesso.

*Mitigazione*: sarà necessario implementare un sistema di _testing_ e _debugging_ efficace, al fine di limitare al
minimo la presenza di bug e garantire il funzionamento corretto del prodotto nella sua interezza.


=== Rischi personali
I rischi personali sono criticità legate a imprevisti individuali che potrebbero causare rallentamenti o interruzioni
temporanee del lavoro. Questa categoria di rischio può essere gestita attraverso una comunicazione chiara e tempestiva
con il tutor aziendale, in modo da poter ripianificare il lavoro per limitare i danni.
#v(1em)
*1. Indisponibilità temporanee*
#v(1em)
*Descrizione:* durante lo sviluppo potrebbero esserci indisponibilità temporanee, causando un rallentamento momentaneo
del lavoro.

*Mitigazione:* in caso di assenze temporanee, sarà necessario comunicare tempestivamente la situazione, cercando di
recuperare il tempo perso una volta rientrati.


== Obiettivi personali
Di seguito sono riportati gli obiettivi personali che hanno portato a scegliere questo progetto di stage presso Wavelop
Srl:
#v(1em)
- *Azienda di piccole dimensioni e giovane*: essendo un'azienda di piccole dimensioni, Wavelop Srl offre l'opportunità
  di essere coinvolti a 360 gradi in tutte le fasi del processo di sviluppo, favorendo la comunicazione tra tutti i
  membri del team, senza trascurare il tirocinante, considerandolo a tutti gli effetti un membro del team stesso;

- *Metodologie Agili*: l'adozione di metodologie agili, in particolare _Scrum_ e _user stories_, ha rappresentato un
  fattore chiave nella scelta del progetto. Tali pratiche forniscono uno stimolo costante, favorendo l'apprendimento
  continuo e la crescita personale attraverso il confronto con i colleghi e con il tutor aziendale;

- *Stesso percorso di studi universitari*: la condivisione dello stesso percorso di studi universitari dell'intero team
  di sviluppo, ha permesso a Wavelop Srl di strutturare il progetto di stage strettamente allineato alle esigenze
  formative e alle tempistiche richieste dal corso di laurea;

- *Possibilità di inserimento in azienda*: lo svolgimento di colloqui diretti con i fondatori dell'azienda e la
  possibilità di confronto aperto hanno costituito elementi fondamentali per la scelta del progetto e nella valutazione
  di un futuro inserimento in azienda. Wavelop Srl si configura infatti come un'attività orientata primariamente
  all'apprendimento e alla crescita del proprio personale, rispetto al mero raggiungimento di obiettivi di business;

- *Possibilità di validare le conoscenze pregresse*: il progetto proposto ha offerto l'opportunità di verificare e
  consolidare le competenze acquisite nel percorso di studi antecedente allo stage. In particolare, durante la fase di
  progettazione, è stato possibile applicare in modo concreto i concetti del corso di Ingegneria del Software, lasciando
  al contempo spazio alla sperimentazione e all'apprendimento di nuove tecnologie.
