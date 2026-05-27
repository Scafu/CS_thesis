#import "../config/thesis-config.typ": (
  glpl, obj-link, objectives-data, prod-link, products-data, render-objectives, render-products,
)
#import "data/requirements_list.typ": *

= Analisi dei requisiti<cap:analisi-requisiti>

#text(style: "italic", [
  In questo capitolo viene effettuata l'analisi degli utenti, sviluppo delle user stories e la lista degli obiettivi e
  dei prodotti attesi al termine dello stage.
])

== Analisi degli utenti
La figura ... illustra la gerarchia degli attori che interagiscono con il sistema, dopo un analisi dello scopo e delle
funzionalità dell'applicazione, ho individuato due attori principali:
#v(0.5em)
- *_Guest_*: rappresenta un utente non autenticato che può accedere alla piattaforma senza effettuare il login, ha un
  accesso limitato alle funzionalità di misurazione e di calcolo percentile, ma non può accedere alla gestione dei dati
  e tutto quello concerne le informazioni sanitarie nell'applicazione.
- *Utente autenticato*: rappresenta un utente che ha effettuato il login e ha accesso completo alle funzionalità
  dell'applicazione.
#v(0.5em)
Al momento del termine dello stage, non stati nè individuati nè implementati differenze di permessi tra gli utenti
autenticati, non si preclude però la possibilità di questa cosa in futuro. \



== User stories<cap:user-stories>
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
possono portare ad ambiguità e incomprensioni all'interno delteam di sviluppo. Per questo motivo, nelle fasi iniziali
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
consegnare codice funzionante per alcuni aspetti del prodotto finale #cite(<def-user-stories>, supplement: [pp. 8-10]).
#v(0.5em)
I vantaggi principali dell'utilizzo delle _user stories_ #cite(<def-user-stories>, supplement: [pp. 13-14]) sono:
#v(1em)
- *Mettono il focus sulla comunicazione verbale*: le _user stories_ hanno lo scopo di rappresentare in modo sintetico
  una funzionalità fungendo da supporto alle conversazioni tra cliente e team di sviluppo e favorando quindi la
  comunicazione tra le parti.
- *Comprensibili da entrambe le parti*: le _user stories_ essendo scritte in un linguaggio semplice e non tecnico, risultano
  facilmente comprensibili sia dal cliente sia dal team di sviluppo, mettendo in evidenza il valore della
  funzionalità o del requisito descritto.
- *Dimensione adatta alla pianificazione*: le _user stories_ hanno dimensioni adattabili e questo permette al team di
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
== Sviluppo delle user stories
Nelle prime fasi dell'analisi dei requisiti, è stata definitia una lista di _user stories_ ritenute necessarie per soddisfare le esigenze del
cliente, organizzandole successivamente in _epic_ in base alla loro area di implementazione.
#v(0.5em)
A ciascuna _user story_ è stato associato un punteggio di complessità, utilizzato per la pianificazione del lavoro
durante le iterazioni. La stima della complessità seguiva la sequenza di Fibonacci; il valore 13 rappresentava il livello massimo di complessità gestibile all'interno di una singola iterazione.
#v(0.5em)
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
  ==== _Tutorial_ per la misurazione<us:tutorial-misurazione>
  #d Come utente *_Guest_/Autenticato*, alla prima misurazione voglio poter visualizzare un tutorial.
  #t
  1. Implementazione pagine a step del tutorial.
  2. Implementazione bottone per saltare il tutorial.
  3. Implementazione bottone "?" per visualizzare il tutorial in qualsiasi momento.
  4. Implementazione logica per mostrare il tutorial alla prima misurazione e nasconderlo nelle misurazioni successive.
  5. Implementazione salvataggio presa visione del tutorial.
  #p 2

  ==== Schermata di misurazione del piede<us:schermata-misurazione-piede>
  #d Come utente *_Guest_/Autenticato* che si trova nella pagina di misurazione voglio poter misurare correttamente il
  piede del bambino, muovendo le linee guida oppure inserendo manualmente la misura.
  #t
  1. Implementazione pagina di misurazione del piede.
  2. Implementazione linee guida per la misurazione del piede.
  3. Implemenetazione righello guida per la misurazione del piede.
  4. Implementazione inserimento manuale della misura del piede.
  #p 3

  ==== Schermata di calcolo percentile e risultati<us:schermata-calcolo-percentile>
  #d Come utente *_Guest_/Autenticato*, voglio poter dalla schermata Home accedere a quella di calcolo percentile,
  inserire i dati necessari e visualizzare i risultati.
  #t
  1. Implementazione schermata di calcolo percentile.
  2. Implementazione _Form_ per l'inserimento dei dati necessari al calcolo del percentile.
  3. Implementazione grafici per la visualizzazione dei risultati del calcolo percentile.
  4. Implementazione consiglio dell'esperto.
  5. Implementazione logica di _routing_ per accedere alla schermata di calcolo percentile dalla Home.
  #p 3

  ==== Schermata di informazioni sanitarie<us:schermata-informazioni-sanitarie>
  #d Come utente *Autenticato* che si trova nella schermata di informazioni sanitarie, voglio poter visualizzare
  contenuti informativi dell'esperto riguardo a crescita, sviluppo motorio e calzature per bambini.
  #t
  1. Implementazione schermata di informazioni sanitarie.
  2. Implementazione consigli sulle calzature adatte.
  3. Implementazione consigli sullo sviluppo motorio.
  4. Implementazione segnali di attenzione riguardo alla crescita del bambino.
  5. Implementazione logica di _routing_ per accedere alla schermata di informazioni sanitarie dalla barra di
    navigazione.
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
  5. Implementazione logica di _routing_ per accedere alla schermata del diario del bambino dalla _Home_.
  6. Implementazione recupero dati dal _database_ locale/remoto.
  #p 5

  ==== Schermata contatti<us:schermata-contatti>
  #d Come utente *_Guest_/Autenticato*, voglio poter vedere quali esperti ci sono nella mia zona o in base ad un
  indirizzo che inserisco.
  #t
  1. Implementazione schermata contatti.
  2. Implementazione form di inserimento zona/indirizzo.
  3. Implementazione visualizzazione lista card con i contatti degli esperti.
  4. Implementazione calcolo distanza tramite dati nel _database_.
  5. Implementazione logica di _routing_ per accedere alla schermata contatti dalla barra di navigazione.
  #p 3

  ==== Schermata _Home_<us:schermata-home>
  #d Come utente *_Guest_/Autenticato*, voglio poter visualizzare una schermata _Home_ con le funzionalità principali
  dell'applicazione e accedere alle altre schermate.
  #t
  1. Implementazione schermata _Home_.
  2. Implementazione logica di _routing_ per accedere alle altre schermate.
  3. Implementazione visualizzazione funzionalità principali dell'applicazione.
  4. Implementazione sezioni sfocata con richiesta di registrazione/login per visualizzare i dati completi.
  #p 2

  ==== Schermata iniziale o _Splash Screen_<us:splash-screen>
  #d Come utente *_Guest_/Autenticato*, voglio poter visualizzare una schermata iniziale con il logo dell'applicazione
  durante il caricamento dell'applicazione.
  #t
  1. Implementazione schermata iniziale o _Splash Screen_.
  2. Implementazione visualizzazione logo dell'applicazione.
  3. Implementazione logica di _routing_ per accedere alla schermata _Home_ dopo un breve periodo di tempo.
  #p 1

  #heading(numbering: none, level: 3)[Epic 2. Account]

  ==== Gestione Bambini<us:gestione-bambini-registrati>
  #d Come utente *Autenticato*, voglio poter gestire più bambini all’interno della piattaforma, avendo dati gestiti per
  ognuno di essi.
  #t
  1. Implementazione sezione di gestione bambini registrati con lista dinamica.
  2. Implementazione logica di registrazione e rimozione bambino.
  3. Implementazione multi-tenancy per gestire i dati di più bambini in modo separato.
  4. Implementazione operazioni CRUD sui dati di ogni bambino.
  5. Implementazione logica di _routing_ per accedere alla sezione di registrazione tramite pulsante nella schermata
    _Home_.
  6. Implementazione _Form_ per l'inserimento dei dati necessari alla registrazione di un bambino.
  #p 5

  ==== Implementazione autenticazione Auth0<us:autenticazione-auth0>
  #d Come utente *_Guest_*, voglio poter registrarmi e accedere alla piattaforma tramite autenticazione Auth0.
  #t
  1. Implementazione autenticazione tramite Auth0.
  2. Implementazione logica di registrazione e login tramite Auth0.
  3. Implementazione logica di logout tramite Auth0.
  4. Implementazione logica di gestione sessione utente.
  5. Implementazione logica di protezione delle rotte per le funzionalità riservate agli utenti autenticati.
  #p 2

  ==== Eliminazione account e dati<us:eliminazione-account-dati>
  #d Come utente *Autenticato*, voglio poter eliminare il mio account e tutti i dati associati alla piattaforma.
  #t
  1. Implementazione logica di eliminazione account utente.
  2. Implementazione logica di eliminazione dati associati all'account utente.
  3. Implementazione logica di conferma dell'eliminazione account e dati.
  4. Implementazione reset dell'applicazione dopo l'eliminazione account e dati.
  5. Implementazione pulsanti e messaggi di conferma per l'eliminazione account e dati.
  6. Implementazione logica per elimnare diari di bambini registrati a scelta dell'utente.
  #p 3

  #heading(numbering: none, level: 3)[Epic 3. Misurazione]
  ==== Motore di misurazione del piede<us:motore-misurazione-piede>
  #d Come utente *_Guest_/Autenticato*, voglio poter misurare il piede tramite l’applicazione.
  #t
  1. Implementazione motore di misurazione del piede.
  2. Implementazione conversione da pixel a centimetri.
  3. Implementazione conversione centimentri a taglie di calzature.
  3. Implementazione salvataggio dati in database locale/remoto.
  #p 5

  ==== Calcolo Percentile<us:calcolo-percentile>
  #d Come utente *_Guest_/Autenticato*, voglio poter calcolare il percentile all'interno dell'applicazione.
  #t
  1. Implementazione motore di calcolo percentile.
  2. Implementazione salvataggio dati in database locale/remoto.
  #p 5

  #heading(numbering: none, level: 3)[Epic 4. Impostazioni]
  ==== Impostazioni dell'applicazione<us:impostazioni-app>
  #d Come utente *_Guest_/Autenticato*, voglio poter accedere alla sezione di impostazioni dell'applicazione per
  personalizzare alcune funzionalità e preferenze.
  #t
  1. Implementazione schermata di impostazioni dell'applicazione.
  2. Implementazione cambio tema dell'applicazione.
  3. Implementazione cambio lingua dell'applicazione.
  4. Implementazione salvataggio preferenze dell'utente in database locale/remoto.
  5. Implementazione logica di _routing_ per accedere alla sezione di impostazioni tramite pulsante nella barra di
    navigazione.
  6. Implementazione internazionalizzazione dell'applicazione per supportare più lingue.
  #p 2
]

== Gli obiettivi dello stage<cap:obiettivi-stage>
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
conseguimento di tutti gli obiettivi citati nella sezione precedente.

#render-products(products-data)
