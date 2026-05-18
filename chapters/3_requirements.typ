#import "../config/thesis-config.typ": glpl
#import "data/requirements_list.typ": *

= Analisi dei requisiti<cap:analisi-requisiti>

#text(style: "italic", [
  In questo capitolo effettuo l'analisi degli utenti, sviluppo le user stories e compongo la lista dei requisiti
  dividendoli per tipologia e necessità.
])
#v(1em)

== Analisi degli utenti
La figura ... illustra la gerarchia degli attori che interagiscono con il sistema, dopo un analisi dello scopo e delle
funzionalità dell'applicazione, ho individuato due attori principali:
#v(0.5em)
- *Guest*: rappresenta un utente non autenticato che può accedere alla piattaforma senza effettuare il login, ha un
  accesso limitato alle funzionalità di misurazione e di calcolo percentile, ma non può accedere alla gestione dei dati
  e tutto quello concerne le informazioni sanitarie nell'applicazione.
- *Utente autenticato*: rappresenta un utente che ha effettuato il login e ha accesso completo alle funzionalità
  dell'applicazione.
Al momento del termine dello stage, non stati nè individuati nè implementati differenze di permessi tra gli utenti
autenticati, non si preclude però la possibilità di questa cosa in futuro. \

== User stories<cap:user-stories>
Al posto dei casi d'uso, per l'analisi dei requisiti e delle funzionalità del progetto di stage, ho scelto di adottare
le user stories. Questa scelta è motivata dal fatto che queste rappresentano uno degli strumenti principali utilizzati
nelle metodologie agili, approccio seguito da Wavelop Srl per la gestione e sviluppo dei propri progetti software.

Una _user story_ consiste in una descrizione generale e informale di una funzionalità o di un requisito software,
scritta dal punto di vista dell'utente finale. L'obiettivo principale è quello di evidenziare il valore che una
funzionalità o un requisito può portare all'utilizzatore finale del sistema. Ogni _user story_ è composta da tre
aspetti:
#v(1em)
1. *Carta*: descrizione scritta della storia usata come riferimento per la pianificazione e come promemoria;
2. *Conversazione*: discussione riguardo alla storia che serve per chiarire i dettagli della storia;
3. *Conferma*: test che definiscono i criteri per cui una user story è considerata completa e
soddisfatta.
#v(1em)
Nonostante la loro efficacia, le _user stories_ presentano un'elevata astrazione e, se non adeguatamente definite,
possono portare ad ambiguità e incomprensioni nel team di sviluppo. Per questo motivo, nelle prime fasi dell'analisi è
importante definire la grandezza e la profondità delle _user stories_ per evitare i problemi sopra citati. Più _user
stories_ possono essere raggruppate in _epic_, che rappresenta un insieme di funzionalità correlate che condividono un
obiettivo comune. Si preferisce pertanto definire storie più piccole e specifiche, piuttosto che poche storie grandi e
generiche così da facilitare la divisione del lavoro e la pianificazione. Un progetto che utilizza le _user stories_,
definito _story-driven_, presenta un ritmo di sviluppo differente rispetto a un progetto tradizionale. In particolare,
il cliente viene coinvolto durante l'intero ciclo di sviluppo del software, approccio che trova riscontro nei principi
della metodologia _Agile_. \ \
Il lavoro viene organizzato in iterazioni o _sprint_, cicli di sviluppo a tempo fisso al termine dei quali viene
consegnato codice funzionante. Le _user stories_ iniziali vengono solitamente scritte durante un workshop collaborativo,
ma possono essere definite in qualsiasi momento del ciclo di sviluppo. Successivamente si procede con la stima della
grandezza di ogni storia e si stabilisce una durata fissa per le iterazioni, generalmente compresa tra una e quattro
settimane. Questa durata rimane costante per l'intera durata del progetto. Al termine di ogni iterazione, il team di
sviluppo è responsabile di consegnare codice funzionante per alcuni aspetti del prodotto finale @def-user-stories[pp.
  8-10]. \ \ I vantaggi principali dell'utilizzo delle _user stories_ @def-user-stories[pp. 13-14] sono:
#v(0.5em)
- *Mettono il focus sulla comunicazione verbale*: lo scopo delle _user stories_ è quello di scrivere frasi semplici che
  fungono da promemoria per le conversazioni che devono avvenire con il cliente, dunque sono importanti perché
  facilitano la comunicazione.
- *Comprensibili da entrambe le parti*: le _user stories_ essendo scritte in un linguaggio semplice e non tecnico, sono
  facilmente comprensibili sia dal team di sviluppo che dal cliente, mostrando in modo chiaro il valore della
  funzionalità o del requisito descritto.
- *Dimensione adatta ad ogni pianificazione*: le _user stories_ hanno dimensioni adattabili e questo permette al team di
  pianificare il lavoro in base alle proprie capacità e necessità.
- *Funzionano per lo sviluppo iterativo*: le _user stories_ non devono essere scritte tutte all'inizio del progetto, ma
  possono essere modificate e aggiunte in qualsiasi momento, questo permette al software di evolversi attraverso
  iterazioni successive, permettendo di raffinare anche le singole _user stories_.
- *Incoraggiano il rinvio del dettaglio*: le _user stories_ non devono essere dettagliate completamente all'inizio del
  progetto, ma possono rimanere volutamente vaghe e approfondite solo quando necessario, risparmiando tempo e risorse.
- *Favoriscono la crescita della conoscenza tra le parti*: dato che le _user stories_ mettono l'enfasi sulla
  comunicazione verbale e ripetuta nel tempo, permettono una crescita sostanziale della conoscenza tra le parti,
  facilitando la comprensione reciproca e la collaborazione.
#v(0.5em)
== Definizione e sviluppo delle user stories
Durante lo stage, ho utilizzato le _user stories_ per definire i requisiti e delineare le funzionalità da implementare.
Inizialmente ho definito una lista di tutte le _user stories_ che ritenevo necessarie per soddisfare le esigenze del
cliente, organizzandole in _epic_ in base alla loro area di implementazione. Durante l'attività di progettazione prima
di iniziare lo sviluppo, c'è stata una fase di discussione con il tutor aziendale per definire più dettagli possibili,
toccando tutti gli aspetti, dal design dell'applicazione, alla _user experience_.

A ciascuna _user story_ è stato associato un punteggio di complessità, utilizzato per la pianificazione del lavoro
durante le iterazioni. La valutazione seguiva la sequenza di Fibonacci, con valore pari a 13 per le storie che
richiedevano un'intera iterazione per essere completate.

Ogni _user story_ seguiva la seguente struttura:
#v(0.5em)

*Titolo*: breve descrizione della funzionalità o del requisito descritto;

*Descrizione*: come utente [*ruolo*], voglio [*funzionalità*] per [*ragione*];

*Task*: elenco di attivitànecessari al completamento della storia.

*Punteggio di complessità*: stima della complessità della storia, utilizzata per la pianificazione del lavoro;

Di seguito vengono riportate le _user stories_ relative alle principali funzionalità dell'applicazione sviluppata.
#[
  #set heading(
    numbering: (..numbers) => {
      let level = numbers.pos().len()
      if level == 4 {
        return [US-#numbers.pos().at(level - 1)]
      }
    },
  )

  #set heading(supplement: none)

  #let d = [*Descrizione:*]
  #let p = [#v(0.8em) *Punteggio di complessità:*]
  #let t = [#v(0.8em) *Task:*]

  #heading(numbering: none, level: 3)[Epic 1. Schermate]
  ==== Tutorial per la misurazione<us:tutorial-misurazione>
  #d Come utente *Guest/Autenticato*, alla prima misurazione voglio poter visualizzare un tutorial.
  #t
  1. Implementazione pagine a step del tutorial.
  2. Implementazione bottone per saltare il tutorial.
  3. Implementazione bottone "?" per visualizzare il tutorial in qualsiasi momento.
  4. Implementazione logica per mostrare il tutorial alla prima misurazione e nasconderlo nelle misurazioni successive.
  5. Implementazione salvataggio presa visione del tutorial.
  #p 2


  ==== Schermata di misurazione del piede<us:schermata-misurazione-piede>
  #d Come utente *Guest/Autenticato* che si trova nella pagina di misurazione voglio poter misurare correttamente il
  piede del bambino, muovendo le linee guida oppure inserendo manualmente la misura.
  #t
  1. Implementazione pagina di misurazione del piede.
  2. Implementazione linee guida per la misurazione del piede.
  3. Implemenetazione righello guida per la misurazione del piede.
  4. Implementazione inserimento manuale della misura del piede.
  #p 3

  ==== Schermata di calcolo percentile e risultati<us:schermata-calcolo-percentile>
  #d Come utente *Guest/Autenticato*, voglio poter dalla schermata Home accedere a quella di calcolo percentile,
  inserire i dati necessari e visualizzare i risultati.
  #t
  1. Implementazione schermata di calcolo percentile.
  2. Implementazione From per l'inserimento dei dati necessari al calcolo del percentile.
  3. Implementazione grafici per la visualizzazione dei risultati del calcolo percentile.
  4. Implementazione consiglio dell'esperto.
  5. Implementazione logica di routing per accedere alla schermata di calcolo percentile dalla Home.
  #p 3

  ==== Schermata di informazioni sanitarie<us:schermata-informazioni-sanitarie>
  #d Come utente *Autenticato* che si trova nella schermata di informazioni sanitarie, voglio poter visualizzare
  contenuti informativi dell'esperto riguardo a crescita, sviluppo motorio e calzature per bambini.
  #t
  1. Implementazione schermata di informazioni sanitarie.
  2. Implementazione consigli sulle calzature adatte.
  3. Implementazione consigli sullo sviluppo motorio.
  4. Implementazione segnali di attenzione riguardo alla crescita del bambino.
  5. Implementazione logica di routing per accedere alla schermata di informazioni sanitarie dalla barra di navigazione.
  6. Implementazione salvataggio informazioni come nota del diario di un bambino registrato.
  #p 2

  ==== Diario del Bambino<us:diario-bambino>
  #d Come utente *Autenticato* che si trova nella schermata “Diario Bambino” voglio poter vedere le misurazioni
  effettuate fino a quel momento, le informazioni sanitarie salvate ed eventuali note testuali aggiuntive.
  #t
  1. Implementazione schermata del diario del bambino.
  2. Implementazione visualizzazione misurazioni del piede/calcolo percentile effettuate in formato tabellare.
  3. Implementazione visualizzazione misurazione del piede/calcolo percentile effettuate in formato grafico.
  4. Implementazione visualizzazione note aggiuntive salvate.
  5. Implementazione logica di routing per accedere alla schermata del diario del bambino dalla Home.
  6. Implementazione recupero dati dal database locale/remoto.
  #p 5

  ==== Schermata contatti<us:schermata-contatti>
  #d Come utente *Guest/Autenticato*, voglio poter vedere quali esperti ci sono nella mia zona o in base ad un indirizzo
  che inserisco.
  #t
  1. Implementazione schermata contatti.
  2. Implementazione form di inserimento zona/indirizzo.
  3. Implementazione visualizzazione lista card con i contatti degli esperti.
  4. Implementazione calcolo distanza tramite dati nel database.
  5. Implementazione logica di routing per accedere alla schermata contatti dalla barra di navigazione.
  #p 3

  ==== Schermata risultato misurazione - Utente Guest<us:schermata-risultato-misurazione-guest>
  #d Come utente *Guest*, voglio poter visualizzare una schermata con il risultato ottenuto dalla misurazione/calcolo
  appena effettuato.
  #t
  1. Implementazione schermata risultato misurazione/calcolo percentile.
  2. Implementazione sfocature dati con richiesta di registrazione/login per visualizzare i dati completi.
  3. Implementazione ritorno del risultato e reset dopo la chiusura della schermata.
  #p 3

  ==== Gestione Bambini registrati<us:gestione-bambini-registrati>
  #d Come utente *Autenticato*, voglio poter gestire più bambini all’interno della piattaforma, avendo dati gestiti per
  ognuno di essi.
  #t
  1. Implementazione sezione di gestione bambini registrati con lista dinamica.
  2. Implementazione logica di registrazione e rimozione bambino.
  3. Implementazione multi-tenancy per gestire i dati di più bambini in modo separato.
  4. Implementazione operazioni CRUD sui dati di ogni bambino.
  #p 5

  #heading(numbering: none, level: 3)[Epic 2. Misurazione]
  ==== Motore di misurazione del piede<us:motore-misurazione-piede>
  #d Come utente *Guest/Autenticato*, voglio poter misurare il piede tramite l’applicazione.
  #t
  1. Implementazione motore di misurazione del piede.
  2. Implementazione conversione da pixel a centimetri.
  3. Implementazione conversione centimentri a taglie di calzature.
  3. Implementazione salvataggio dati in database locale/remoto.
  #p 5

  ==== Calcolo Percentile<us:calcolo-percentile>
  #d Come utente *Guest/Autenticato*, voglio poter calcolare il percentile all'interno dell'applicazione.
  #t
  1. Implementazione motore di calcolo percentile.
  2. Implementazione salvataggio dati in database locale/remoto.
  #p 5
]


== Tracciamento dei requisiti
Ad ogni requisito è associato un codice costruito in base alle sue caratteristiche:
#v(1em)
#align(center)[*(F/Q/C)(M/D/O)R*]
#v(1em)
#set list(marker: none)
- F (_Functional_): definisce una funzione di un sistema o dei suoi componenti;
- Q (_Qualitative_): rappresentano come il sistema deve essere per soddisfare i requisiti dello stakeholder;
- C (_Constraint_): rappresentano dei vincoli o dei limiti che il sistema deve rispettare;
#v(0.5em)
- M (_Mandatory_): irrinunciabili per qualcuno degli stakeholder;
- D (_Desirable_): non strettamente necessari ma a valore aggiunto riconoscibile;
- O (_Optional_): relativamente utili oppure contrattabili anche in fasi avanzate del progetto;
#v(0.3em)
- R (_Requirement_): requisito
#v(1em)
In @tab:requisiti-funzionali, @tab:requisiti-qualitativi e @tab:requisiti-vincolo sono riassunti i requisiti e il loro
tracciamento con gli use case delineati in fase di analisi.
#[
  #show figure: set block(breakable: true)
  #set table(
    align: (center + horizon, left + horizon, center + horizon),
    columns: (auto, 5fr, 1.5fr),
  )
  #v(1em)
  #figure(
    table(
      table.header([*Codice*], [*Descrizione*], [*Fonti*]),
      ..getFR().flatten()
    ),
    caption: "Tracciamento dei requisti funzionali.",
  )
  <tab:requisiti-funzionali>

  #v(2em)
  #figure(
    table(
      align: (center + horizon, left + horizon, center + horizon),
      table.header([*Codice*], [*Descrizione*], [*Fonti*]),
      ..getQR().flatten()
    ),
    caption: "Tracciamento dei requisti di qualità.",
  )
  <tab:requisiti-qualitativi>

  #v(2em)
  #figure(
    table(
      align: (center + horizon, left + horizon, center + horizon),
      table.header([*Codice*], [*Descrizione*], [*Fonti*]),
      ..getCR().flatten()
    ),
    caption: "Tracciamento dei requisti di vincolo.",
  )
  <tab:requisiti-vincolo>

  #v(2em)
  Di seguito, nella @tab:riepilogo-requisiti ho inserito il riepilogo dei requisiti, suddivisi per tipologia e
  necessità.
  #v(1em)
  #show figure: set block(breakable: false)
  #figure(
    table(
      columns: (auto, 1fr, 1fr, auto, auto),
      table.header([*Tipo*], [*Mandatory*], [*Desirable*], [*Optional*], [*Somma*]),
      [Functional],
      [#getFR(getLen: true).at(0)],
      [#getFR(getLen: true).at(1)],
      [#getFR(getLen: true).at(2)],
      [#getFR(getLen: true).sum()],

      [Qualitative],
      [#getQR(getLen: true).at(0)],
      [#getQR(getLen: true).at(1)],
      [#getQR(getLen: true).at(2)],
      [#getQR(getLen: true).sum()],

      [Constraint],
      [#getCR(getLen: true).at(0)],
      [#getCR(getLen: true).at(1)],
      [#getCR(getLen: true).at(2)],
      [#getCR(getLen: true).sum()],

      [*Totale*],
      [*#{ getFR(getLen: true).at(0) + getQR(getLen: true).at(0) + getCR(getLen: true).at(0) }*],
      [*#{ getFR(getLen: true).at(1) + getQR(getLen: true).at(1) + getCR(getLen: true).at(1) }*],
      [*#{ getFR(getLen: true).at(2) + getQR(getLen: true).at(2) + getCR(getLen: true).at(2) }*],
      [*#{ getFR(getLen: true).sum() + getQR(getLen: true).sum() + getCR(getLen: true).sum() }*],

      align: (center + horizon),
    ),
    caption: "Riepilogo dei requisiti.",
  )<tab:riepilogo-requisiti>
]
