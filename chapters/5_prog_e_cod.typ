= Progettazione e Codifica<cap:progettazione-e-codifica>
#text(style: "italic", [
  In questo capitolo vengono presentate le scelte progettuali ed esposta la descrizione dettagliata dell'architettura e
  dei pattern adottati per la realizzazione del prodotto finale.
])
== Progettazione
=== Architettura e pattern dell'applicazione
Per lo sviluppo dell'applicazione è stata adottata un'architettura multi-livello ispirata ai principi della _Clean
Architecture_. Questo paradigma integra e sintetizza i concetti di approcci preesistenti, quali _Hexagonal Architecture_
e la _Onion Architecture_, con l'obiettivo di offrire linee guida per la progettazione di sistemi software
caratterizzati da un'elevata modularità, una netta separazione delle responsabilità (_Separation of Concerns_) e
un'ottima manutenibilità del codice sorgente. #figure(caption: "Architettura dell'applicazione")[#image("../images/app-architecture.png", width: 100%)]<fig:app-architecture>

#v(0.5em)
Alla base della _Clean Architecture_ vi è il principio denominato _The Dependency Rule_ (Regola delle Dipendenze).
Secondo tale principio, le dipendenze tra i diversi livelli del software devono essere unidirezionali e rivolte verso
l'interno. I componenti dei livelli più interni non devono possedere alcuna conoscenza delle implementazioni o dei
dettagli presenti nei livelli più esterni. In modo analogo, gli elementi definiti esternamente non possono essere
referenziati nei livelli più interni, inclusi i formati dei dati utilizzati, variabili, funzioni e strutture dati.
Questa separazione risulta evidente nell'architettura dell'applicazione illustrata in @fig:app-architecture, in cui i
livelli di presentazione e dati rispettano il principio delle dipendenze con il livello di dominio. Grazie a questa
divisione le entità di dominio rimangono completamente agnostiche sia rispetto ai modelli di dati esterni, sia rispetto
alle operazioni di basso livello effettuate su di essi.
#v(0.5em)
Per quanto riguarda il flusso di controllo e lo scambio dei dati, la direzione delle dipendenze risulta opposta rispetto
al flusso logico. Questa caratteristica deriva dall'applicazione del principio _Dependency Inversion Principle_
(Principio di Inversione delle Dipendenze), strutturalmente necessario per garantire il rispetto della regola delle
dipendenze precedentemente descritta.
#v(0.5em)
Anche i dati che attraversano i confini tra i vari livelli devono sottostare alla medesima regola, essi devono essere
passati sotto forma di oggetti strutturati o come parametri di funzione, evitando così di passare valori primitivi
isolati. Questo approccio consente ai livelli interni di mantenere la propria indipendenza dai dettagli implementativi
dei livelli esterni, garantendo che ogni livello possa manipolare i dati nella forma più appropriata alle proprie
esigenze.
#v(0.5em)
L'adozione di questa architettura comporta diversi vantaggi:
- consente di sostituire le tecnologie utilizzate nei livelli esterni senza introdurre cambiamenti nella logica dei
  livelli interni, incrementando la flessibilità del sistema rispetto a evoluzioni future;
- l'applicazione del _Single Responsibility Principle_ (Principio della Responsabilità Singola) favorisce una maggiore
  testabilità, rendendo i livelli interni testabili tramite l'utilizzo di oggetti simulati (_mock_) o implementazioni
  simulate;
- l'organizzazione modulare del codice favorisce un riutilizzo frequente dei componenti e ottimizza la collaborazione
  tra più sviluppatori del progetto.
#v(0.5em)
Di contro la _Clean Architecture_ presenta anche alcuni svantaggi da non sottovalutare:
- l'introduzione di molteplici livelli architetturali incrementa il livello di astrazione e l'onere progettuale
  iniziale, rendendo questo paradigma meno adatto per progetti di piccole dimensioni;
- questo paradigma richiede un investimento iniziale di tempo e di risorse maggiore per l'apprendimento delle logiche e
  dei principi alla base;
- il rispetto rigoroso della separazione delle responsabilità richiede spesso differenti rappresentazioni dei dati per
  ciascun livello, comportando la scrittura di codice aggiuntivo per la conversione dei dati tra i vari livelli, oltre
  alla scrittura di interfacce e implementazioni relative.
#v(0.5em)
Nonostante tali criticità suggeriscano l'utilizzo del paradigma per progetti complessi, nel sistema sviluppato durante
lo stage si è scelto comunque di adottare questa architettura. La necessità di supportare future evoluzioni, sia dal
punto di vista tecnologico sia funzionale, ha reso prioritario un approccio che salvaguardasse la modularità e la
manutenibilità a lungo termine del sistema #cite(<clean-architecture>).


==== Model-View-ViewModel<sez:mvvm>
#figure(
  caption: [#highlight([Model-View-ViewModel])],
)[#image("../images/mvvm-pattern.png", width: 80%)]<fig:mvvm>
Nel livello di presentazione dell'applicazione è presente il pattern architetturale _Model-View-ViewModel_ (MVVM). Come
mostrato in @fig:mvvm, questo pattern consente di separare in modo chiaro l'interfaccia utente dalla logica di business,
strutturando ogni funzionalità in tre parti: _Model_, _ViewModel_ e la _View_. Il _Model_ è rappresentato dalle entità
di dominio, mentre la _View_ e il _ViewModel_ costituiscono il livello di presentazione della funzionalità. Seguendo
questo approccio, ogni modulo dispone di una propria _View_ (composta da una o più schermate) e del relativo
_ViewModel_. Quest'ultimo ha il compito esclusivo di gestire e preservare lo stato della schermata; il _ViewModel_ non
possiede alcun riferimento diretto ai componenti dell'interfaccia utente, ma si limita a esporre un flusso di stati
discreti a cui la _View_ reagisce in modo reattivo, aggiornando l'interfaccia utente di conseguenza.
===== Gestione dello stato <sez:prog-gestione-stato>
L'utilizzo del pattern _MVVM_ necessita di particolare attenzione nel progettare un meccanismo per la gestione e la
propagazione dello stato dei singoli componenti all'interno dell'applicazione. L'obiettivo progettuale di partenza è
stato quello di disaccoppiare completamente la logica di _business_ dall'interfaccia utente, garantendo un flusso di
dati rigorosamente unidirezionale. A livello logico, il sistema è stato progettato in modo tale che la _View_ si
comporti come un componente passivo e reattivo. Invece di richiedere esplicitamente i dati, l'interfaccia si mette in
ascolto, tramite l'implementazione del pattern _Observer_, dei cambiamenti di stato esposti dal _ViewModel_. L'accesso
ai _ViewModel_ avviene tramite il pattern _provider_, che rende disponibili dipendenze a qualsiasi livello dell'albero
dei componenti senza doverle passare esplicitamente, eliminando il cosiddetto _prop-drilling_. #figure(caption: "Gestione dello stato via MVVM")[#image("../images/state-management.png", width: 90%)]<fig:state-management>
#v(0.5em)
Come mostrato in @fig:state-management, quando l'utente compie un'azione, come ad esempio avviare una misurazione, il
_ViewModel_ elabora la richiesta e notifica la _View_ di aggiornare l'interfaccia. Ove necessario, il _ViewModel_ espone
stati intermedi di caricamento, portando la _View_ a uno stato finale di successo o di errore al termine
dell'operazione. Alcuni _ViewModel_ dipendono inoltre dallo stato di altri; ad esempio, i componenti che gestiscono i
dati utente reagiscono automaticamente ai cambiamenti dello stato di autenticazione, realizzando una composizione tra
_Observer_ che mantiene la coerenza dell'applicazione senza introdurre accoppiamento diretto tra i componenti.
==== Command Pattern e gli Use Case
Nel livello di dominio, dove risiedono i contratti che utilizzano i livelli esterni, è stato adottato il pattern
architetturale _Command Pattern_. Il _Command Pattern_ è un pattern comportamentale che consente di incapsulare una
richiesta o una specifica operazione all'interno di un oggetto a sé stante. L'obiettivo principale di questo pattern è
disaccoppiare l'oggetto che invoca l'operazione dall'oggetto che possiede la conoscenza per eseguirla concretamente. Nel
contesto della _Clean Architecture_ esposta in precedenza, il _Command Pattern_ trova la sua applicazione pratica
nell'implementazione degli _Use Case_ (Casi d'uso), definiti come interazioni che danno la possibilità al livello di
presentazione di interagire con il resto dei livelli. All'interno del livello di dominio, un _Use Case_ è un componente
architetturale che incapsula una singola e ben definita regola di business o una specifica azione offerta
dall'applicazione (ad esempio, "Autenticazione dell'utente" o "Calcolo del percentile"). L'_Use Case_ funge da
orchestratore centrale per quella specifica funzionalità, riceve dati di input dal livello di presentazione, nel nostro
caso dal _ViewModel_, coordina le entità di dominio e invoca i metodi necessari esposti dalle interfacce dei
_Repository_ e infine elabora la logica e restituisce un risultato strutturato completamente agnostico rispetto ai
dettagli dell'interfaccia utente e della persistenza dei dati.
#v(0.5em)
Ogni _Use Case_ viene progettato come una classe indipendente, la quale espone verso l'esterno un unico metodo pubblico,
ad esempio `call()`, il _ViewModel_ si limita a richiamare tale metodo passandogli i parametri necessari, senza doversi
preoccupare della complessità sottostante. L'utilizzo di questo accoppiamento tra _Command Pattern_ e _Use Case_ porta a
significativi vantaggi:
- *Rispetto del _Single Responsibility Principle_*: ogni _Use Case_ gestisce un'unica funzionalità e ha un solo motivo
  per essere modificato. Se cambiano le regole di business di una funzionalità, si interverrà esclusivamente sull'_Use
  Case_ corrispondente, senza dover modificare altri componenti del sistema;
- *Testabilità*: essendo classi che contengono logica pura e dipendono esclusivamente da interfacce, gli _Use Case_
  risultano estremamente facili da testare singolarmente nei Test di Unità mediante l'iniezione di _Mock_ per i
  _Repository_;
- *Semplificazione del _Presentation Layer_*: i _ViewModel_ vengono alleggeriti dalla responsabilità di gestire logica
  di dominio, limitandosi ad agire come semplici intermediari che eseguono comandi e mappano i risultati in stati da
  esporre alla _View_.


==== Repository Pattern
Per la comunicazione tra livello dati e di dominio è stato adottato il _Repository Pattern_. Questo _pattern_ è
progettato per mediare e separare in modo netto la logica di accesso ai dati dalla logica di business dell'applicazione.
Il _Repository_ funge da interfaccia tra i due livelli, offrendo un'astrazione che consente di nascondere i dettagli
implementativi relativi a _database_, _API_ esterne o qualsiasi altra fonte di dati. Nel contesto della _Clean
Architecture_, l'implementazione di questo _pattern_ assume una struttura divisa in due parti, essenziale per garantire
il rispetto della regola delle dipendenze:
#v(0.5em)
- *_Repository_ come Interfaccia di Dominio*: all'interno del livello di dominio, il _Repository_ viene definito
  unicamente come contratto (interfaccia); questo contratto definisce le operazioni sui dati richieste dal sistema,
  senza specificarne l'implementazione. Gli _Use Case_ dipendono solamente da questa astrazione, rimanendo isolati dai
  dettagli tecnologici;
- *_Repository_ come Implementazione di Infrastruttura*: nel livello dei dati risiede l'implementazione concreta del
  _Repository_, che contiene la logica effettiva per recuperare, mappare e memorizzare i dati, interagendo con le fonti
  di dati disponibili.
#v(0.5em)
L'implementazione concreta del _Repository_ orchestra una o più fonti di dati, definite _DataSource_. Nel contesto
dell'applicazione sono state individuate tre tipologie di fonti dati:
- *_DataSource_ Locale*: fonte di dati persistente sul dispositivo, utilizzata per memorizzare e recuperare dati in modo
  efficiente senza accedere a risorse esterne; è la fonte primaria per tutti i dati dell'applicazione;
- *_DataSource_ di Dispositivo*: fonte di dati derivata dall'Hardware o dal sistema operativo, utilizzata per accedere a
  informazioni come le metriche fisiche del dispositivo;
- *_DataSource_ Remoto*: fonte di dati esterna accessibile tramite rete, come un'_API REST_ o un servizio _web_; nella
  versione attuale dell'applicazione questa categoria ha un utilizzo previsto in evoluzioni future.
#v(0.5em)
L'adozione del _Repository Pattern_ comporta numerosi vantaggi:
- *Centralizzazione e coerenza*: concentra in un unico punto tutte le regole di gestione dei dati, evitando duplicazione
  di codice;
- *Flessibilità e manutenibilità*: rende possibile la sostituzione o l'aggiornamento delle tecnologie di persistenza
  intervenendo unicamente sul livello dati senza dover modificare la logica di dominio;
- *Testabilità*: agevola la scrittura di test unitari per il livello di dominio, consentendo l'iniezione di
  implementazioni simulate del _Repository_ che restituiscono dati predefiniti, facilitando così la verifica della
  logica di business in isolamento.
#v(0.5em)

==== Persistenza dei dati e Strategia _Offline-First_
Parallelamente alla definizione dei flussi dell'applicazione, la fase di progettazione ha richiesto un'attenta
modellazione anche della gestione e della persistenza dei dati. Invece di vincolare il funzionamento del sistema alla
disponibilità iniziale di un'infrastruttura di rete, si è adottato un paradigma _Offline-First_. In questo modello, il
dispositivo locale non funge da semplice _cache_ temporanea, ma rappresenta la fonte di verità primaria (_Single Source
of Truth_) per l'interfaccia utente. Tutte le operazioni di lettura e scrittura avvengono istantaneamente sul livello di
persistenza locale, garantendo un'esperienza fluida, reattiva e priva di latenze.
#v(0.5em)
Dal punto di vista architetturale, il sistema è stato progettato per supportare una sincronizzazione asincrona con una
fonte di dati remota. Per prevenire inconsistenze distribuite, la progettazione prevede un meccanismo di allineamento
basato su una coda di operazioni transazionali: ogni modifica eseguita localmente viene registrata nella coda con un
identificativo univoco e marcata con uno stato di attesa (_pending_). Non appena si stabilisce un collegamento con il
_cloud_, l'applicazione avvia il processo di svuotamento della coda inter-scambiando i dati con la fonte remota,
attendendo conferma prima di dichiarare conclusa la sincronizzazione. Tale meccanismo è stato progettato per supportare
l'accesso _multidevice_ da parte dello stesso utente, garantendo coerenza dei dati su tutti i dispositivi.
#v(0.5em)
Nella versione attuale dell'applicazione, la persistenza è interamente locale: il meccanismo di sincronizzazione
descritto costituisce un'estensione architetturale pianificata per sviluppi futuri.


==== _Routing_ dichiarativo
Per quanto riguarda la navigazione tra le schermate dell'applicazione, è stato adottato un approccio di _routing_
dichiarativo. Questo paradigma consente di definire in modo chiaro e centralizzato tutte le rotte e transizioni tra le
schermate, migliorando sia la leggibilità del codice sia la comprensione della struttura dell'applicazione. Le rotte
sono definite come indirizzi simili a _Uniform Resource Locator_ (_URL_) web, con supporto a parametri di percorso per
identificare le risorse, come ad esempio il profilo di uno specifico bambino. Questo approccio offre numerosi vantaggi:
#v(0.5em)
- *_Deep Linking_*: consente di accedere direttamente a specifiche schermate tramite un collegamento esterno
  inizializzandole con i parametri corretti;
- *Guardie di Navigazione*: consente di implementare logiche di controllo dell'accesso a determinate schermate; ad
  esempio, il tentativo di accedere a una schermata di misurazione reindirizza automaticamente alla schermata di
  tutorial corrispondente se questo non è stato completato;
- *Sincronizzazione con lo stato*: la logica di reindirizzamento reagisce in modo reattivo ai cambiamenti di stato
  dell'applicazione, garantendo che la navigazione rifletta sempre il contesto corrente senza richiedere interventi
  manuali da parte dell'utente.
#v(0.5em)
Tale approccio favorisce la prevedibilità del comportamento dell'interfaccia utente, riduce l'accoppiamento tra i
componenti e semplifica le attività di manutenzione ed evoluzione del sistema.
==== Internazionalizzazione
L'internazionalizzazione (_i18n_) e la relativa localizzazione (_l10n_) rappresentano requisiti non funzionali
fondamentali per garantire l'accessibilità e l'usabilità dell'applicazione a un pubblico globale. Nel contesto del
progetto sviluppato, è stato concepito un sistema dinamico in grado non solo di supportare molteplici lingue, ma anche
di adattarsi in tempo reale alle convenzioni stilistiche di ciascuna lingua. A livello architetturale, è stato imposto
il vincolo di non inserire alcuna stringa di testo definita in modo statico (_hardcoded_) all'interno del livello di
presentazione. Ogni elemento testuale visibile all'utente viene astratto sotto forma di chiave identificativa (ad
esempio `welcomeMessage`). Questa chiave viene poi mappata a una stringa specifica per ciascuna lingua supportata,
definita in file di risorse esterni. Per garantire un'esperienza utente coerente, la lingua corrente è trattata a tutti
gli effetti come uno stato globale, quest'ultimo viene gestito da un _ViewModel_ dedicato, il quale viene iniettato alla
radice dell'albero dei componenti. Questa scelta progettuale permette a tutte le schermate e ai componenti visivi di
mettersi in ascolto passivo delle variazioni di stato: un cambio della lingua all'interno dell'applicazione o del
sistema operativo comporta un aggiornamento automatico di tutte le stringhe visualizzate, senza la necessità di
interventi manuali o di ricaricare l'applicazione.

==== Privacy by Design
L'applicazione è stata progettata per garantire il rispetto dei paradigmi _Privacy by Design_ e _Privacy by Default_,
che stabiliscono come la tutela della privacy debba essere integrata nelle scelte architetturali sin dalle prime fasi di
sviluppo, garantendo il massimo livello di protezione dei dati senza richiedere alcuna azione aggiuntiva da parte
dell'utente. In questo contesto, i dati personali degli utenti sono protetti attraverso una cifratura attiva per
impostazione predefinita. Le chiavi crittografiche vengono gestite esclusivamente attraverso meccanismi di sicurezza
forniti dal sistema operativo utilizzato, senza mai transitare in chiaro attraverso gli strati dell'applicazione. Ogni
utente autenticato dispone inoltre di un database e di una chiave indipendenti, consentendo all'applicazione di poter
gestire più utenti senza compromettere la sicurezza dei dati.

==== Conversione delle misure e Calibrazione del dispositivo <sez:calibrazione>
Una delle sfide progettuali principali affrontate nello sviluppo dell'applicazione riguarda la conversione delle misure
rilevate tramite lo schermo del dispositivo in unità fisiche reali. Il problema nasce da una caratteristica intrinseca
dei dispositivi mobili, ovvero la variabilità di densità di _pixel_ degli schermi differenti. La densità è espressa in
_Pixels Per Inch_ (_PPI_), di conseguenza, un oggetto che occupa un determinato numero di _pixel_ su uno schermo non
corrisponde alla stessa dimensione fisica su un dispositivo diverso.
#v(0.5em)
Per risolvere questo problema è stato progettato un componente dedicato, responsabile della calibrazione del dispositivo
in uso. Tale componente, classificato come _DataSource_ di dispositivo, ha il compito di determinare la densità fisica
effettiva dello schermo, fornendo al resto del sistema un fattore di conversione espresso in _pixel_ per millimetro.
Questo valore viene poi utilizzato dal livello di presentazione per tradurre le misure in _pixel_ rilevate sullo schermo
nelle corrispondenti misure fisiche in millimetri.
#v(0.5em)
La complessità progettuale di questa funzionalità risiede nella necessità di gestire la calibrazione nelle due
piattaforme supportate. Su _Android_ è possibile interrogare direttamente l'_Hardware_ per ottenere la densità fisica
reale dello schermo, mentre su _iOS_ è stato necessario progettare una strategia alternativa basata su una tabella di
calibrazione predefinita, che associa i modelli di dispositivo a fattori di conversione specifici.

=== Codifica Applicazione
==== Gestione dello stato
La gestione dello stato è implementata tramite il _package_ _provider_, che realizza concretamente i _pattern_ _MVVM_ e
_Observer_ descritti in @sez:prog-gestione-stato. Ogni _ViewModel_ è una classe che estende `ChangeNotifier`, fornita
dal _framework_ _Flutter_, e comunica i cambiamenti di stato alle _View_ tramite chiamate esplicite al metodo
`notifyListeners()`.
#v(0.5em)
Tutta la configurazione è centralizzata in una classe chiamata `Providers`, che restituisce una lista di
`SingleChildWidget` montata nella radice dell'albero dei _widget_. In questa classe vengono usati tre tipi di _provider_
distinti:
#v(0.5em)
- `Provider<T>`: fornisce oggetti immutabili e privi di stato, come _use case_ o _repository_. Non notificano
  aggiornamenti;
- `ChangeNotifierProvider<T>`: sono i _ViewModel_ con stato reattivo. I _widget_ che li ascoltano si ricostruiscono
  automaticamente a ogni `notifyListeners()`;
- `ChangeNotifierProxyProvider<A, B>`: sono i _ViewModel_ il cui stato dipende da un altro _ViewModel_ reattivo. Ogni
  volta che _A_ cambia il _framework_ invoca il _callback_ `update` che propaga il cambiamento a _B_.
#v(0.5em)
Queste tre tipologie sono visibili nell'esempio di codice in @fig:provider-types.

#figure(
  ```Dart
  Provider<Login>(
    create: (ctx) => Login(ctx.read<AuthRepository>()),
  ),
  ChangeNotifierProvider<AuthViewmodel>(
    create: (ctx) => AuthViewmodel(
      login: ctx.read<Login>(),
      logout: ctx.read<Logout>(),
      // ...
    )..initialize(),
  ),
  ChangeNotifierProxyProvider<AuthViewmodel, ChildViewModel>(
    lazy: false,
    create: (ctx) => ChildViewModel(
      addChild: ctx.read<AddChild>(),
      getChildren: ctx.read<GetChildren>(),
      // ...
    ),
    update: (ctx, authViewModel, childViewModel) =>
        childViewModel!..syncWithAuth(
          isLoggedIn: authViewModel.isLoggedIn,
          email: authViewModel.user.email,
        ),
  ),
  ```,
  caption: [Esempio delle tipologie di provider utilizzati],
  kind: raw,
)<fig:provider-types>
#v(0.5em)
L'autenticazione è gestita da un _ViewModel_ centrale `AuthViewModel`, che espone i campi `isLoggedIn` `isProgressing`,
`user` e `errorMessage`. I metodi di autenticazione seguono uno schema uniforme, impostano `isProgressing = true` prima
dell'operazione asincrona, aggiornano lo stato e chiamano `notifyListeners()` nel blocco `finally` come visibile nel
blocco d'esempio in @fig:login-method.
#v(0.5em)
#figure(
  ```Dart
    Future<void> login() async {
    isProgressing = true;
    notifyListeners();
    try {
      user = await _login();
      await _databaseService.open(user.sub);
      isLoggedIn = true;
      notifyListeners();
    } catch (e) {
      errorMessage = 'Login failed: $e';
    } finally {
      isProgressing = false;
      notifyListeners();
    }
  }
  ```,
  caption: [Metodo login in `AuthViewModel`],
  kind: raw,
)<fig:login-method>
#v(0.5em)
Il blocco `finally` garantisce sempre che la _View_ riceva un aggiornamento conclusivo indipendentemente dall'esito. I
_widget_ che ascoltano i cambiamenti di stato di un _ViewModel_ accedono allo stato esposto in due modi visibili in
@fig:state-access:
#v(0.5em)
#figure(
  ```Dart
  final avm = context.watch<AuthViewmodel>();
  onTap: () => context.read<AuthViewmodel>().login(),
  ```,
  caption: [Esempio di accesso allo stato di un _ViewModel_],
  kind: raw,
)<fig:state-access>
#v(0.5em)
Quando soltanto una porzione dell'albero deve reagire a un cambiamento di stato, si utilizza `Consumer<T>`, che delimita
il sotto albero che effettivamente si ricostruisce ad esempio in @fig:consumer-example.
#v(0.5em)
#figure(
  ```Dart
  Consumer<AuthViewmodel>(
    builder: (ctx, avm, child) {
      if (avm.isProgressing) {
        return CircularProgressIndicator();
      } else if (avm.isLoggedIn) {
        return Text('Welcome, ${avm.user.email}!');
      } else {
        return ElevatedButton(
          onPressed: () => avm.login(),
          child: Text('Login'),
        );
      }
    },
  ),
  ```,
  caption: [Esempio di utilizzo di `Consumer<T>`],
  kind: raw,
)<fig:consumer-example>

==== Routing e navigazione
La navigazione è gestita tramite il _package_ _go_router_, che implementa un sistema di routing dichiarativo basato su
_URL_. Ogni schermata è associata a un percorso definito come `String`, e la navigazione avviene tramite metodi
`context.push()` e `context.go()` che accettano il percorso come argomento. Il _router_ è istanziato in una classe
dedicata `AppRouter`, nella quale viene definita la mappa completa delle rotte, comprese le guardie di navigazione e i
reindirizzamenti in caso di errore o di accesso non autorizzato. Grazie a questo pacchetto, è possibile implementare le
schermate accessibili dalla barra di navigazione inferiore, queste infatti vengono raggruppate in
`StatefulShellRoute.indexedStack`, se le schermate necessitano di mantenere il proprio stato in memoria come visibile in
@fig:shell-route.
#v(0.5em)
#figure(
  caption: "Implementazione di `ShellRoute` per la barra di navigazione inferiore",
  kind: raw,
)[
  ```Dart
    StatefulShellRoute.indexedStack(
    pageBuilder: (context, state, navigationShell) => NoTransitionPage(
      child: Scaffold(
        body: navigationShell,
        bottomNavigationBar: CustomNavigationBar(
          location: state.uri.path,
          childId: state.uri.pathSegments.length > 1
              ? state.uri.pathSegments[1]
              : '',
        ),
      ),
    ),
    branches: [
      StatefulShellBranch(routes: [
        GoRoute(path: '/dashboard', ...),
      ]),
      StatefulShellBranch(routes: [
        GoRoute(path: '/info', ...),
      ]),
    ],
  )

  ```
]<fig:shell-route>
#v(0.5em)
Altrimenti #highlight([le schermate vengono]) raggruppate in `ShellRoute` che le ricostruisce da zero a ogni
navigazione. Attraverso questo meccanismo é possibile avere barre di navigazione differenti a seconda del contesto. Le
schermate del profilo bambino utilizzano percorsi con parametri dinamici `:childId`, il cui valore viene estratto e
passato al costruttore della schermata di destinazione. La possibilità di raggruppare le schermate permette di avere una
struttura alla base condivisa tra le schermate di un gruppo, risparmiando codice duplicato e garantendo coerenza tra le
schermate.
==== Database e cifratura
La persistenza locale è implementata con il _package_ _drift_, un _Object-Relational Mapping_ (_ORM_) _type-safe_ per
_SQLite_ che genera codice _Dart_ a partire dalla definizione delle tabelle visibili in @fig:db-schema.
#v(0.5em)
#figure(
  caption: [Definizione delle tabelle con _child_ e _child_log_ con _drift_],
  kind: raw,
)[
  ```SQL
  TABLE child_table (
    id           INTEGER PRIMARY KEY AUTOINCREMENT,
    uuid         TEXT    NOT NULL,
    parent_email TEXT    NOT NULL,
    name         TEXT    NOT NULL,
    birth_date   INTEGER NOT NULL,
    gender       TEXT    NOT NULL,
    height       INTEGER NOT NULL,
    weight       REAL    NOT NULL,
    foot_size    INTEGER NOT NULL,
    foot_length  REAL    NOT NULL,
    avatar_url   TEXT    NOT NULL,
    mother_height INTEGER,
    father_height INTEGER
  );

  TABLE child_log_table (
    id       INTEGER PRIMARY KEY AUTOINCREMENT,
    child_id TEXT    NOT NULL REFERENCES child_table(uuid) ON DELETE CASCADE,
    date     TEXT    NOT NULL,
    type     TEXT    NOT NULL CHECK (type IN ('footLength', 'percentile')),
    value    REAL    NOT NULL,
    value2   REAL    NOT NULL,
    value3   REAL
  );

  ```
]<fig:db-schema>
#v(0.5em)
In particolare, la colonna `birth_date` è definita come `INTEGER` perché _drift_ serializza `DateTime` come _UNIX_
_timestamp_ in millisecondi.

Per la questione della cifratura il pacchetto mette a disposizione una libreria interna chiamata _SQLite Multiple
Ciphers_, che estende _SQLite_ con supporto a molteplici algoritmi crittografici. Per garantire il rispetto della
_Privacy by Design_ è stato necessario applicare questi algoritmi crittografici per evitare l'accesso ai dati nel
dispositivo in caso di furto o smarrimento. L'algoritmo di cifratura utilizzato è il _ChaCha20-Poly1305_, un algoritmo
di cifratura autenticata con dati associati (_AEAD_) che unisce la cifratura ad alta velocità _ChaCha20_ e
l'autenticatore di dati _Poly1305_. La gestione del ciclo di vita della chiave usata per la cifratura è affidata ad una
classe dedicata `DatabaseService`. Al primo accesso, genera 32 _byte_ casuali tramite la funzione `Random.secure()` e li
converte in stringa esadecimale. La stringa viene poi memorizzata in un _keystore_ del sistema operativo, cioé un
contenitore dedicato dal sistema operativo alla conservazione delle chiavi crittografiche. Agli accessi successivi
l'utente, dopo aver eseguito l'autenticazione, recupera la chiave esistente come illustrato in @fig:key-management.
#v(0.5em)
#figure(
  ```Dart
    Future<String> _resolveKey(String sub) async {
    final storageKey = 'db_key_$sub';
    final existing = await _storage.read(key: storageKey);
    if (existing != null) return existing;

    final bytes = List<int>.generate(
      32, (_) => Random.secure().nextInt(256)
    );
    final keyHex = bytes
        .map((b) => b.toRadixString(16).padLeft(2, '0'))
        .join();
    await _storage.write(key: storageKey, value: keyHex);
    return keyHex;
  }

  ```,
  caption: [Gestione della chiave di cifratura in `DatabaseService`],
  kind: raw,
)<fig:key-management>
#v(0.5em)
La chiave è identificata da `db_key_$sub`, dove `$sub` è l'identificativo univoco dell'utente autenticato, in questo
modo è possibile gestire più utenti sullo stesso dispositivo senza compromettere la sicurezza dei dati. Infatti il _sub_
viene fornito dal servizio di autenticazione esterno, garantendo un ulteriore livello di sicurezza. L'apertura del
database avviene tramite il metodo `open()` di `DatabaseService`, che accetta come parametro il _sub_ dell'utente
autenticato e la chiave esadecimale a 256 _bit_ recuperata, `NativeDatabase` è una classe fornita da _drift_ che con un
_callback_ `setup` consente di eseguire l'operazione `PRAGMA key` (comando interno di _SQLite_) prima di qualsiasi altra
operazione, attivando la cifratura _ChaCha20-Poly1305_ sull'intero file.
#v(0.5em)
#figure(
  ```Dart
  static Future<AppDatabase> open(String sub, String keyHex) async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, _fileNameFor(sub)));
    final db = NativeDatabase(
      file,
      setup: (rawDb) {
        rawDb.execute("PRAGMA key = \"x'$keyHex'\";");
      },
    );
    return AppDatabase._(db);
  }
  ```,
  caption: [Apertura del database con cifratura in `DatabaseService`],
  kind: raw,
)<fig:database-open>
#v(0.5em)
Come visibile in @fig:database-open, la funzione restituisce il database, il file fisico salvato viene derivato dal
_sub_ tramite l'utilizzo di una funzione _custom_ `_fileNameFor()`, che sostituisce i caratteri non alfanumerici con
_underscore_, producendo ad esempio `app_db_auth0_12345.sqlite`

==== Autenticazione
L'autenticazione è gestita tramite il servizio esterno _Auth0_ che fornisce un pacchetto ufficiale chiamato
_auth0_flutter_. Il flusso implementato è _OAuth 2.0_, già descritto precedentemente nella @tech:oauth2.0, eseguito
tramite _browser_ di sistema. Il meccanismo _DPoP_ viene abilitato tramite il parametro `useDPoP: true`, che lega i
_token_ all'istanza dell'applicazione riducendo il rischio di _token theft_. Il flusso di _login_ e registrazione parte
dal sorgente di dati `RemoteAuthDataSource` che espone tre metodi: `login()`, `register()` e `logout()`, tutti delegati
a `auth0.webAuthentication()`. La distinzione tra _login_ e registrazione avviene tramite il parametro `screen_hint`.
#v(0.5em)
#figure(
  ```Dart
  final credentials = await auth0
      .webAuthentication(scheme: AUTH0_SCHEME)
      .login(
        useDPoP: true,
        useHTTPS: true,
        parameters: {'screen_hint': 'signup'},
      );
  final credentials = await auth0
      .webAuthentication(scheme: AUTH0_SCHEME)
      .login(useDPoP: true, useHTTPS: true);

  ```,
  caption: [Implementazione dei metodi di login e registrazione in `RemoteAuthDataSource`],
  kind: raw,
)<fig:auth-methods>
#v(0.5em)
Come visibile in @fig:auth-methods, entrambe le operazioni aprono il _browser_ di sistema sulla pagina di autenticazione
di _Auth0_ ospitata sul dominio configurato sulla piattaforma esterna. Al completamento dell'operazione i metodi
restituiscono un oggetto `Credentials` che contiene _access token_, _refresh token_ e i dati del profilo utente. Il
pacchetto automaticamente gestisce il ciclo di vita dei _token_, rinnovandoli quando necessario. Al riavvio
dell'applicazione, viene usato all'interno di `AuthViewModel` il _credentials manager_ di _Auth0_ per verificare se
esistono credenziali valide salvate invocando `auth0.credentialsManager().hasValidCredentials()`.
==== Internazionalizzazione
Le stringhe di testo nell'interfaccia sono gestite tramite il sistema di localizzazione di _Flutter_, basato su file
_Application Resource Bundle_ (_ARB_). Per ogni lingua supportata esiste un file di risorse dedicato, ad esempio
`app_it.arb` per l'italiano e `app_en.arb` per l'inglese, che contiene le coppie chiave-valore delle stringhe. Il
generatore di codice di _Flutter_ crea automaticamente la classe `AppLocalizations` con un _getter_ per ogni chiave. La
lingua corrente è gestita da un `ChangeNotifier` chiamato `LocaleProvider`, che persiste la preferenza dell'utente
tramite il pacchetto _shared_preferences_ in memoria. Al primo avvio, se non è presente una preferenza salvata, viene
utilizzata la lingua di sistema se supportata, altrimenti l'inglese come _fallback_ come mostrato in
@fig:locale-provider.
#v(0.5em)
#figure(
  ```Dart
  Future<void> loadLocale() async {
    final prefs = SharedPreferencesAsync();
    final saved = await prefs.getString(_kLocaleKey);
    if (saved != null && _kSupportedCodes.contains(saved)) {
      _locale = Locale(saved);
    } else {
      final systemCode = PlatformDispatcher.instance.locale.languageCode;
      _locale = Locale(
        _kSupportedCodes.contains(systemCode) ? systemCode : 'en'
      );
    }
    notifyListeners();
  }
  ```,
  caption: [Implementazione di `LocaleProvider`],
  kind: raw,
)<fig:locale-provider>
#v(0.5em)
Il cambio di lingua avviene tramite il metodo `setLocale()`, che aggiorna la lingua corrente e notifica il listener con
`notifyListeners()`. Il `LocaleProvider` è iniettato alla radice dell'albero dell'applicazione, per questo tutti i
_widget_ che lo osservano tramite `context.watch<LocaleProvider>()` si aggiornano in modo immediato al cambio di lingua,
senza necessità di ricaricare l'applicazione. Per facilitare la gestione delle stringhe di testo durante lo sviluppo è
stata creata un'estensione di `BuildContext` visibile in @fig:localization-extension:
#v(0.5em)
#figure(
  ```Dart
  extension Tr on BuildContext {
    AppLocalizations get tr => AppLocalizations.of(this)!;
  }
  ```,
  caption: [Estensione di `BuildContext` per semplificare l'accesso alle stringhe localizzate],
  kind: raw,
)<fig:localization-extension>
#v(0.5em)
L'estensione fornisce il _getter_ `tr` direttamente nel contesto, eliminando la necessità di scrivere
`AppLocalizations.of(context)` ogni volta che si vuole accedere a una stringa localizzata, migliorando la leggibilità
del codice. Le stringhe localizzate vengono quindi lette tramite `context.tr.someKey`, dove `someKey` è la chiave
definita nei file _ARB_.
==== Misurazione del piede e Calibrazione del dispositivo
Come descritto in @sez:calibrazione la misurazione del piede richiede che l'applicazione conosca la densità di _pixel_
fisici dello schermo del dispositivo, espressa in _pixel_ per millimetro (px/mm). Questo valore non è recuperabile in
modo uniforme tramite _API_ del _framework_, poiché questo espone solo il rapporto tra _pixel_ logici e fisici (_DPR_),
ma non la densità fisica effettiva. Seguendo la _Clean Architecture_ è stata definita una classe
`DeviceMetricsDataSource` che adotta strategie diverse in base al sistema operativo del dispositivo in uso:
- *Android*: é stato necessario implementare un canale di comunicazione nativo `MethodChannel` per interrogare
  direttamente il sistema operativo. La classe `MainActivity` registra questo canale con un nome univoco che se
  utilizzato restituisce il valore di densità fisica reale dello schermo sull'asse orizzontale.
  #v(0.5em)
  #figure(
    ```Kotlin
    MethodChannel(
        flutterEngine.dartExecutor.binaryMessenger,
        "app/display_metrics",
    ).setMethodCallHandler { call, result ->
        if (call.method == "getXDpi") {
            result.success(resources.displayMetrics.xdpi.toDouble())
        } else {
            result.notImplemented()
        }
    }
    ```,
    caption: [Implementazione del canale nativo per ottenere la densità fisica dello schermo su Android],
    kind: raw,
  )<fig:android-metrics>
- *iOS*: non essendo possibile invocare metodi nativi, viene utilizzata una tabella statica `KIosPbiByModel` visibile in
  @fig:ios-pbi-by-model indicizzata per identificatore hardware del modello.
  #v(0.5em)
  #figure(
    ```Dart
    const Map<String, double> KIosPbiByModel = {
      'iPhone8,4': 326, 'iPhone12,8': 326, 'iPhone14,6': 326,
      'iPhone7,2': 326, 'iPhone8,1': 326,
      'iPhone9,1': 326, 'iPhone9,3': 326,
      'iPhone10,1': 326, 'iPhone10,4': 326,
      };
    ```,
    caption: [Tabella di calibrazione per iOS],
    kind: raw,
  )<fig:ios-pbi-by-model>
#v(0.5em)
In entrambi i casi, se il valore specifico non é disponibile, si utilizza come _fallback_ `dpr * 160` per _Android_ e
`dpr * 163` per _iOS_. Il valore finale della densità fisica viene calcolata con la formula
`pxPerMm = physicalDpi / dpr / 25.4`, dove il divisore `dpr` converte i _DPI_ fisici in _DPI_ logici, mentre `25.4`
converte da pollici a millimetri. Il risultato è il numero di _pixel_ logici corrispondenti a 1 mm fisico sullo schermo.
In @fig:calibration-method è visibile come viene effettuata la calibrazione all'interno del metodo `getPxPerMm()` di
`DeviceMetricsDataSource`. Questa calibrazione viene effettuata una sola volta per sessione.
#v(0.5em)
#figure(
  ```Dart
  Future<double> getPxPerMm(double dpr) async {
    double physicalDpi = dpr * 160.0;
    if (Platform.isAndroid) {
      final xDpi = await _channel.invokeMethod<double>('getXDpi');
      if (xDpi != null && xDpi > 0) physicalDpi = xDpi;
    } else if (Platform.isIOS) {
      final ios = await DeviceInfoPlugin().iosInfo;
      physicalDpi = kIosPpiByModel[ios.utsname.machine] ?? (dpr * 163.0);
    }
    return physicalDpi / dpr / 25.4;
  }

  ```,
  caption: [Metodo per calcolare il fattore di conversione da pixel a millimetri],
  kind: raw,
)<fig:calibration-method>
#v(0.5em)
Il righello nella schermata di misurazione del piede è disegnato tramite un componente _custom_ che utilizza questo
calcolo `y = heelLine - mm * pxPerMm` per posizionare sull'asse y ogni tacca del righello. Le tacche sono classificate
in tre categorie, ogni millimetro (12px), ogni 5 millimetri (20px) e ogni 10 millimetri (32px). Le etichette numeriche
sono renderizzate su entrambi i lati del righello. L'utente quindi trascina la linea mobile (`lineY`) per indicare la
punta del dito, la lunghezza in centimetri è derivata dalla distanza in pixel tra la linea di riferimento (`heelLine`) e
la linea trascinata utilizzando la formula `lengthCm = (heelLine − lineY) / pxPerMm / 10`, la divisione per `pxPerMm`
converte _pixel_ in millimetri, la divisione per `10` converte millimetri in centimetri. Il risultato viene poi
arrotondato al primo decimale come mostrato in @fig:length-calculation.
#v(0.5em)
#figure(
  ```Dart
  double get displayCm {
    if (manualCm != null) return manualCm!;
    return ((heelLine! - lineY!) / pxPerMm! / 10).clamp(0.0, 999.9);
  }
  double get lastFootLengthCmTemp => (displayCm * 10).round() / 10.0;
  ```,
  caption: [Calcolo della lunghezza del piede in centimetri a partire dalla posizione della linea mobile],
  kind: raw,
)<fig:length-calculation>
#v(0.5em)
Qualora il piede dovesse superare la lunghezza massima visualizzabile, l'utente può inserire il valore numerico
direttamente. In quel caso, come mostrato in @fig:length-conversion `submitLength` converte il valore in centimetri in
una posizione y equivalente.
#v(0.5em)
#figure(
  ```Dart
  void submitLength(String value) {
    final cm = double.tryParse(value);
    final newY = heelLine! - (cm * 10) * pxPerMm!;
    lineY = newY < 0 ? 0.0 : newY;
    manualCm = newY < 0 ? cm : null;
  }
  ```,
  caption: [Calcolo della posizione y della linea mobile a partire dalla lunghezza del piede in centimetri],
  kind: raw,
)<fig:length-conversion>
#v(0.5em)
La misura in centimetri calcolata viene poi utilizzata per eseguire la conversione in numero di scarpa europeo
applicando la formula dello standard europeo

`shoeSize = ⌊ (footLengthCm + 1.5) / 0.667 ⌋`, dove il valore `1.5` rappresenta il margine standard aggiunto alla
lunghezza del piede nudo, e `0.667` è la misura di un punto parigino cioè l'unità base della taglia europea. Il
risultato viene poi troncato all'intero inferiore

`int call(double footLengthCm) => ((footLengthCm + 1.5) / 0.667).toInt();`

==== Calcolo del percentile _BMI_
Il calcolo del percentile _BMI_ è implementato in uno _use case_ dedicato `CalculateBmiPercentile`. Il flusso si
articola in tre fasi, calcolo del _BMI_, selezione della riga di riferimento dalla tabella _OMS_ e interpolazione del
percentile. Il calcolo del _BMI_ è eseguito con la formula `BMI = weightKg / (heightM * heightM)`. Essendo l'età
espressa in mesi interi, viene calcolata sottraendo anno e mese di nascita dalla data corrente
`ageMonths = (now.year − birthDate.year) × 12 + (now.month − birthDate.month)`. L'applicazione quindi carica dal
_repository_ la tabella di riferimento _OMS_ specifica per sesso, contenente per ogni fascia di età mensile i valori di
BMI corrispondenti ai percentili 3°, 15°, 50°, 85° e 97°. La riga selezionata è quella con età in mesi più vicina
all'età calcolata come visibile in @fig:row-selection.
#v(0.5em)
#figure(
  ```Dart
  BmiEntryEntity _entryForAge(List<BmiEntryEntity> table, int ageMonths) {
    return table.reduce((a, b) =>
      (a.months - ageMonths).abs() <= (b.months - ageMonths).abs() ? a : b,
    );
  }

  ```,
  caption: [Selezione della riga di riferimento per il calcolo del percentile BMI],
  kind: raw,
)<fig:row-selection>
#v(0.5em)
I valori della riga selezionata vanno a definire cinque bande: [0, 3°], (3°, 15°\], (15°, 50°\], (50°, 85°\], (85°,
97°\], (97°, +100°\]. Il percentile del bambino è calcolato con un'interpolazione lineare all'interno della banda in cui
ricade il _BMI_ osservato, come visibile in @fig:percentile-calculation.
#v(0.5em)
#figure(
  ```Dart
    percentile = pLow + (bmi − bmiLow) / (bmiHigh − bmiLow) × (pHigh − pLow)
    double _interpolatePercentile(double bmi, BmiEntryEntity e) {
    final bands = [
      (0.0,   double.negativeInfinity),
      (3.0,   e.p3),
      (15.0,  e.p15),
      (50.0,  e.median),
      (85.0,  e.p85),
      (97.0,  e.p97),
      (100.0, double.infinity),
    ];
    for (int i = 1; i < bands.length - 1; i++) {
      final (pLow, bmiLow) = bands[i];
      final (pHigh, bmiHigh) = bands[i + 1];
      if (bmi >= bmiLow && bmi < bmiHigh) {
        if (bmiHigh == double.infinity) return 100.0;
        return pLow + (bmi - bmiLow) / (bmiHigh - bmiLow) * (pHigh - pLow);
      }
    }
    return bmi < e.p3 ? 0 : 100;
  }
  ```,
  caption: [Interpolazione lineare per il calcolo del percentile BMI],
  kind: raw,
)<fig:percentile-calculation>
#v(0.5em)
Infine il percentile risultante viene classificato in cinque categorie: criticamente basso (percentile < 3°), basso (3°
≤ percentile < 15°), normale (15° ≤ percentile < 85°), alto (85° ≤ percentile < 97°) e criticamente alto (percentile ≥
97°). Queste categorie vengono poi utilizzate per fornire feedback all'utente e per guidare le raccomandazioni
personalizzate.

==== Schermata - _Home Page_
La _Home Page_ rappresenta la prima schermata visibile all'utente appena avviata l'applicazione. Il suo scopo principale
è quello di fornire un punto di accesso centrale a tutte le funzionalità principali dell'applicazione, fungendo da _hub_
di navigazione.

#figure(
  caption: "Stati della Home Page",
)[
  #box(width: 77%)[
    #grid(
      columns: 3,
      column-gutter: 0.3em,

      image("../images/home-page.png", width: 100%),
      image("../images/home-page1.png", width: 100%),
      image("../images/home-page2.png", width: 100%),
    )
  ]
]<fig:home-page-states>
#v(0.5em)
Come mostrato in @fig:home-page-states, la _Home Page_ è progettata per adattarsi dinamicamente al contesto dell'utente.
Nella parte inferiore della schermata sono sempre presenti i pulsanti di accesso rapido alle funzionalità di
misurazione, accessibili indipendentemente dallo stato di autenticazione. La parte centrale della schermata varia invece
in base al contesto:
#v(0.5em)
- *Utente non autenticato*: viene mostrato un messaggio di benvenuto con un pulsante che consente di effettuare
  l'accesso o la registrazione;
- *Utente autenticato ma senza dati salvati*: viene mostrato un messaggio che invita l'utente a registrare un primo
  profilo bambino per poter accedere alle funzionalità di tracciamento e monitoraggio;
- *Utente autenticato con dati salvati*: viene mostrata la lista dei profili bambino registrati, con la possibilità di
  aggiungerne uno nuovo tramite il pulsante *+* in alto a destra.

==== Schermata - Informazioni sanitarie
La schermata delle informazioni sanitarie raccoglie contenuti informativi e divulgativi su diversi ambiti della salute e
della crescità del bambino. La schermata è composta da un elenco verticale di _card_, ciascuna composta da un titolo che
identifica l'argomento trattato e da una breve descrizione di sintesi. Quando una _card_ contiene altri sottoargomenti,
sulla _card_ compare un'icona a freccia che ne segnala la navigabilità, toccando infatti la _card_ si apre una nuova
schermata, con la stessa struttura a elenco, contenente le sue sotto-_card_. Questo meccanismo di navigazione,
ripetibile su più livelli, permette di organizzare i contenuti in una gerarchia ad albero, in cui ogni nodo può
funzionare sia da categoria (contenitore di sottoargomenti) sia da contenuto terminale, a seconda della profondità a cui
ci si trova.

#figure(
  caption: "Schermata delle informazioni sanitarie",
)[
  #box(width: 59%)[
    #grid(
      columns: 2,
      column-gutter: 0.3em,

      image("../images/info-page.png", width: 100%), image("../images/info-page2.png", width: 100%),
    )
  ]
]<fig:info-page>



==== Schermata - Creazione profilo bambino
La schermata di creazione del profilo bambino consente all'utente, in veste di genitore, di creare un nuovo profilo
bambino per poter iniziare a monitorare le misurazioni del bambino. #figure(caption: "Schermata di creazione profilo bambino")[#box(width: 40%)[
  #image("../images/create-child.png", width: 100%)]]<fig:create-child-profile>
#v(0.5em)
Come visibile in @fig:create-child-profile, la schermata è composta da un form suddiviso in sezioni. La prima sezione
consente di selezionare un _avatar_ tra quelli disponibili per rappresentare il profilo. La seconda raccoglie le
informazioni anagrafiche del bambino, quali nome, data di nascita e sesso. La terza richiede le misurazioni iniziali di
altezza e peso. Al momento della conferma, i dati vengono salvati localmente e contestualmente viene eseguito il calcolo
del percentile, evitando di dover ripetere tale operazione alla prima visualizzazione del profilo.

==== Schermata - Impostazioni
La schermata di impostazioni consente all'utente di personalizzare il comportamento e l'aspetto dell'applicazione. Anche
in questa schermata il contenuto varia in base allo stato di autenticazione, come si può vedere in @fig:settings. Se
l'utente non è autenticato, non vengono mostrate le sezioni relative alla gestione dei dati. La schermata è organizzata
in sezioni distinte. Nella parte superiore se l'utente è autenticato, viene mostrata una card con l'indirizzo _email_
dell'_account_ associato. La sezione Preferenze consente di modificare la lingua dell'interfaccia, selezionabile tra
italiano e inglese, e il tema grafico dell'applicazione, disponibili in due varianti cromatiche. La sezione _Privacy_
fornisce un accesso diretto alla schermata dell'informativa sulla _privacy_. Infine, per gli utenti autenticati, è
presente una sezione _Account_ che espone le operazioni di gestione, come eliminazione selettiva dei profili bambino
registrati, disconnessione ed eliminazione dell'account. L'eliminazione dei profili bambino avviene tramite un dialogo
che elenca i profili disponibili con selezione multipla, consentendo all'utente di scegliere quali rimuovere prima di
confermare l'operazione. #figure(caption: "Schermata di impostazioni")[#box(width: 60%)[#grid(
  columns: 2,
  column-gutter: 0.3em,

  image("../images/settings-page.png", width: 100%), image("../images/settings-page1.png", width: 100%),
)]]<fig:settings>

==== Schermata - Misurazione del piede e risultato
La schermata di misurazione del piede consente di rilevare la lunghezza del piede del bambino utilizzando direttamente
lo schermo del dispositivo come strumento di misura. Il flusso si articola in due schermate distinte visibili in
@fig:foot-measurement.
#v(0.5em)
#figure(
  caption: "Schermata di misurazione del piede e del risultato",
)[#box(width: 100%)[#grid(
  columns: 4,
  column-gutter: 0.1em,

  image("../images/foot-meas2.png", width: 100%),
  image("../images/foot-meas4.png", width: 100%),
  image("../images/foot-meas1.png", width: 100%),
  image("../images/foot-meas3.png", width: 100%),
)]]<fig:foot-measurement>
#v(0.5em)
- *Schermata di misurazione*: la schermata presenta un righello digitale calibrato sulla densità fisica dello schermo
  del dispositivo, come descritto nella @sez:calibrazione. Il righello é suddiviso in tacche millimetriche e
  centimetriche, con etichette numeriche posizionate su entrambi i lati. In fondo allo schermo è present#highlight([e])
  una linea di riferimento fissa che indica il punto di appoggio del tallone. Una seconda linea mobile, trascinabile
  verticalmente tramite _gesture_, indica il punto delle dita e determina la lunghezza rilevata, visualizzata in tempo
  reale in centimetri. È possibile affinare il valore anche tramite input testuale diretto nella barra superiore.
  Tramite il pulsante di conferma, la misurazione viene salvata temporaneamente e si accede alla schermata del
  risultato;
- *Schermata del risultato*: la schermata mostra la lunghezza del piede rilevata e la corrispondente taglia di scarpe
  calcolata. Per gli utenti autenticati viene mostrato anche un consiglio dell'esperto contestualizzato in base all'età
  del bambino. Se la misurazione è associata a un profilo bambino, viene mostrato il grafico dell'andamento storico
  delle misurazioni. Se invece la misurazione è quella veloce, cioè non associata a un profilo bambino, è possibile
  assegnarla a un profilo esistente o crearne uno nuovo direttamente dal dialogo di salvataggio. Per gli utenti non
  autenticati al posto del consiglio dell'esperto viene mostrato un messaggio che invita a registrarsi per accedere a
  contenuti personalizzati e alla funzionalità di monitoraggio storico.


==== Schermata - Calcolo percentile e risultato
Il flusso di calcolo percentile si articola in due schermate distinte che seguono una logica simile a quella della
misurazione del piede, visibili in @fig:calcolo-percentile.
#v(0.5em)
#figure(
  caption: "Schermata del calcolo percentile e del risultato",
)[#box(width: 100%)[#grid(
  columns: 4,
  column-gutter: 0.1em,

  image("../images/percentile2.png", width: 100%),
  image("../images/percentile.png", width: 100%),
  image("../images/percentile3.png", width: 100%),
  image("../images/percentile1.png", width: 100%),
)]]<fig:calcolo-percentile>
#v(0.5em)
- *Schermata di inserimento dati*: la schermata presenta un form suddiviso in due sezioni. Se il calcolo percentile è
  avviato da un profilo bambino, la prima sezione raccoglie solamente l'altezza e il peso del bambino, mentre la data di
  nascita e il sesso sono raccolti in modo automatico dal profilo. Se invece il calcolo è quello veloce, cioè non
  associato a un profilo bambino, vengono raccolti anche data di nascita e sesso. Alla conferma, il sistema calcola
  immediatamente il percentile _BMI_ e naviga alla schermata dei risultati;
- *Schermata dei risultati*: la schermata dei risultati mostra una card riepilogativa con altezza, peso, valore del
  percentile calcolato e un indicatore visivo della categoria di appartenenza, classificata in cinque livelli:
  criticamente basso, basso, normale, alto e criticamente alto. A ciascuna categoria è associato un colore e un'icona di
  tendenza che facilitano la lettura immediata del risultato. Per gli utenti autenticati vengono mostrati inoltre un
  grafico BMI-per-età-per-sesso che posiziona la misurazione corrente rispetto alle curve percentili di riferimento, e
  un consiglio dell'esperto contestualizzato in base alla categoria di percentili rilevata. Per gli utenti non
  autenticati come la misurazione del piede, al posto dei contenuti personalizzati viene mostrato un invito alla
  registrazione. Se la misurazione non è associata a un profilo bambino esistente, l'utente autenticato può creare un
  nuovo profilo direttamente dalla schermata dei risultati tramite un dialogo che richiede nome e _avatar_, utilizzando
  i dati anagrafici e le misurazioni già inserite senza doverli reinserire.


==== Schermata - Diario di Bambino
Il diario costituisce la vista principale del profilo bambino ed è organizzato in sotto-schermate visibili in
@fig:diario-bambino.
#v(0.5em)
#figure(
  caption: "Schermata del diario di bambino",
)[#box(width: 90%)[#grid(
  columns: 3,
  column-gutter: 0.1em,

  image("../images/diary-page.png", width: 100%),
  image("../images/diary-page1.png", width: 100%),
  image("../images/diary-page2.png", width: 100%),
)]]<fig:diario-bambino>
#v(0.5em)
- *Schermata del Diario*: la schermata del diario mostra nella parte superiore un'intestazione con le informazioni
  anagrafiche essenziali, data nascita e sesso, nella barra di navigazione il nome e l'_avatar_ del profilo, con la
  possibilità di modificarli tramite un dialogo. Nella parte centrale è presente un riepilogo delle misurazioni del
  bambino organizzato in _card_, una per la misurazione del piede, una per il percentile _BMI_ e una per l'altezza
  potenziale. Ciascuna _card_ mostra l'ultimo valore registrato assieme alla data della misurazione e consente di
  avviare direttamente una nuova misurazione o visualizzare il dettaglio dell'ultima. In fondo alla schermata
  accessibile tramite scorrimento è presente una _card_ riepilogativa con le ultime misurazioni registrate per
  tipologia;
- *Schermata delle tappe di crescita*: la schermata delle tappe di crescita mostra una timeline verticale delle fasi di
  sviluppo del bambino, calcolate dinamicamente in base alla data di nascita. In cima alla schermata è presente un
  _banner_ che mostra la tappa successiva e il tempo rimanente per raggiungerla visibile da una barra di avanzamento. Le
  tappe già superate sono collassabili e distinguibili visivamente da quelle attive e future tramite indicatori colorati
  e animazioni. È presente uno _slider_ che consente di simulare l'età del bambino in modalità anteprima, permettendo al
  genitore di visualizzare le tappe future. Toccando una singola tappa si apre un pannello di dettaglio con descrizione,
  fascia d'età e stato della tappa;
- *Schermata della lista delle misurazioni*: la schermata della lista delle misurazioni mostra lo storico completo di
  tutte le misurazione effettuate per un profilo bambino, ordinate per data decrescente. Ogni voce è rappresentata da
  una _card_ che indica il tipo di misurazione, percentile o piede, la data di rilevazione e i valori registrati. In
  assenza di misurazioni viene mostrato un messaggio informativo.

