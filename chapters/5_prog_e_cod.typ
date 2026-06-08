= Progettazione e Codifica<cap:progettazione-e-codifica>
#text(style: "italic", [
  In questo capitolo vengono presentate le scelte progettuali ed esposta la descrizione dettagliata dell'architettura e
  dei pattern adottati per la realizzazione del prodotto finale.
])
== Architettura e pattern dell'applicazione
Per lo sviluppo dell'applicazione è stata adottata un'architettura multilivello ispirata ai principi della _Clean
Architecture_. Questo paradigma integra e sintetizza i concetti di approcci preesistenti, quali _Hexagonal Architecture_
e la _Onion Architecture_, con l'obiettivo di offrire linee guida per la progettazione di sistemi software
caratterizzati da un'elevata modularità, una netta separazione delle responsabilità (_Separation of Concerns_) e
un'ottima manutenibilità del codice sorgente.

#figure(
  caption: "Clean Architecture",
)[#image("../images/clean-architecture.jpg", width: 70%)]<fig:clean-architecture>
#v(0.5em)
Come illustrato in @fig:clean-architecture, alla base della _Clean Architecture_ vi è il principio denominato _The
Dependency Rule_ (Regola delle Dipendenze). Secondo tale principio, le dipendenze tra i diversi livelli del software
devono essere unidirezionali e rivolte verso l'interno. I componenti dei livelli più interni non devono possedere alcuna
conoscenza delle implementazioni o dei dettagli presenti nei livelli più esterni. In modo analogo, gli elementi definiti
esternamente non possono essere referenziati nei livelli più interni, inclusi i formati dei dati utilizzati, variabili,
funzioni e strutture dati. Questa separazione risulta evidente nell'architettura di sistema descritta in
@fig:app-architecture, in cui il livello di dominio racchiude le entità di business pure, mentre il livello _data_
definisce i modelli specifici utilizzati per la rappresentazione e la persistenza dei dati nell'applicazione. Le entità
di dominio rimangono completamente agnostiche sia rispetto ai modelli di dati esterni, sia rispetto alle operazioni di
basso livello effettuate su di essi.
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
- l'applicazione del _Single Responsibility Principle_ (Principio della Responsabilità Singola), favorisce una maggiore
  testabilità, rendendo i livelli interni testabili tramite utilizzo di oggetti simulati (_mock_) o implementazioni
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

Nello specifico, la @fig:app-architecture mostra come i principi della _Clean Architecture_ siano stati declinati nella
struttura dell'applicazione. Il livello di dominio si configura come nucleo logico, mentre i livelli di presentazione e
dati gestiscono rispettivamente l'interfaccia utente e l'accesso ai dati. #figure(
  caption: "Architettura dell'applicazione",
)[#image("../images/app-architecture.png", width: 100%)]<fig:app-architecture>

=== Model-View-ViewModel<sez:mvvm>
#figure(
  caption: "Model-View-ViewModel",
)[#image("../images/mvvm-pattern.png", width: 70%)]<fig:mvvm>
Il _Model-View-ViewModel_ (MVVM) è un pattern architetturale che consente di separare in modo chiaro l'interfaccia
utente dalla logica di business, strutturando ogni funzionalità in tre parti: _Model_, _ViewModel_ e la _View_. Il
_Model_ è rappresentato dalle entità di dominio, mentre la _View_ e il _ViewModel_ costituiscono il livello di
presentazione della funzionalità. Seguendo questo approccio, ogni modulo dispone di una propria _View_ (composta da una
o più schermate) e del relativo _ViewModel_. Quest'ultimo ha il compito esclusivo di gestire e preservare lo stato della
schermata; il _ViewModel_ non possiede alcun riferimento diretto ai componenti dell'interfaccia utente, ma si limita a
esporre un flusso di stati discreti a cui la _View_ reagisce in modo reattivo, aggiornando l'interfaccia utente di
conseguenza.

=== Command Pattern e gli Use Case
Il _Command Pattern_ è un pattern architetturale comportamentale che consente di incapsulare una richiesta o una
specifica operazione all'interno di un oggetto a sé stante. L'obiettivo principale di questo pattern è disaccoppiare
l'oggetto che invoca l'operazione dall'oggetto che possiede la conoscenza per eseguirla concretamente. Nel contesto
della _Clean Architecture_ esposta in precedenza, il _Command Pattern_ trova la sua applicazione pratica
nell'implementazione degli _Use Case_ (Casi d'uso), definiti come interazioni. All'interno del livello di dominio, un
_Use Case_ è un componente architetturale che incapsula una singola e ben definita regola di business o una specifica
azione offerta dall'applicazione (ad esempio, "Autenticazione dell'utente" o "Calcolo del percentile"). L'_Use Case_
funge da orchestratore centrale per quella specifica funzionalità, riceve dati di input dal livello di presentazione,
nel nostro caso dal _ViewModel_, coordina le entità di dominio e invoca i metodi necessari esposti dalle interfacce dei
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


=== Repository Pattern
Il _Repository Pattern_ è un pattern architetturale progettato per mediare e separare in modo netto la logica di accesso
ai dati dalla logica di business dell'applicazione. Il _Repository_ funge da interfaccia tra il livello di dominio e il
livello dei dati, offrendo un'astrazione che consente di nascondere i dettagli implementativi relativi a _database_,
_API_ esterne o qualsiasi altra fonte di dati. Nel contesto della _Clean Architecture_, l'implementazione di questo
_pattern_ assume una struttura divisa in due parti essenziale per garantire il rispetto della regola delle dipendenze:
#v(0.5em)
- *_Repository_ come Interfaccia di Dominio*: all'interno del livello di dominio, il _Repository_ viene definito
  unicamente come contratto (interfaccia), questo contratto definisce le operazioni sui dati richieste dal sistema,
  senza specificarne l'implementazione. Gli _Use Case_ dipendono solo da questa astrazione rimanendo isolati;
- *_Repository_ come Implementazione di Infrastruttura*: nel livello dei dati risiede l'implementazione concreta del
  _Repository_, questa componente contiene la logica effettiva e operativa per recuperare, mappare e memorizzare i dati,
  interagendo nel caso della _Clean Architecture_ con fonti di dati locali o remoti.
#v(0.5em)
All'interno dell'architettura dell'applicazione, l'implementazione concreta del _Repository_ assolve un ulteriore
compito cruciale: orchestrare molteplici fonti di dati, definite _DataSource_. Queste ultime si suddividono tipicamente
in due categorie principali:
- *_DataSource_ Locale*: rappresenta una fonte di dati locale, ad esempio un database interno o un sistema di caching,
  utilizzato per memorizzare e recuperare dati in modo efficiente senza dover necessariamente accedere a fonti esterne;
- *_DataSource_ Remoto*: rappresenta una fonte di dati esterna, come un'API REST, un servizio web o qualsiasi altra
  risorsa accessibile tramite rete, utilizzata per recuperare dati aggiornati o per inviare informazioni a sistemi
  esterni.
#v(0.5em)
Il _Repository_ assume il ruolo di orchestratore delle diverse fonti dati, applicando frequentemente il principio della
_Single Source of Truth_ (Singola Fonte di Verità), quando un _Use Case_ richiede un dato, il _Repository_ decide
autonomamente la strategia di recupero migliore, ad esempio, restituire immediatamente i dati presenti localmente e,
parallelamente, interrogare in modo asincrono la fonte remota per ottenere dati aggiornati.
#v(0.5em)
L'adozione del _Repository Pattern_ comporta numerosi vantaggi:
- *Centralizzazione e coerenza*: concentra in un unico punto tutte le regole di gestione dei dati, evitando duplicazione
  del codice;
- *Flessibilità e manutenibilità*: rende possibile la sostituzione o l'aggiornamento delle tecnologie di persistenza
  intervenendo unicamente sul livello dati senza dover modificare la logica di dominio;
- *Testabilità*: agevola la scrittura di test unitari per il livello di dominio, consentendo l'iniezione di
  implementazioni simulate del _Repository_ che restituiscono dati predefiniti, facilitando così la verifica della
  logica di business in isolamento.
#v(0.5em)

=== Persistenza dei dati e Strategia _Offline-First_
Parallelamente alla definizione dei flussi dell'applicazione, la fase di progettazione ha richiesto un'attenta
modellazione anche della gestione e della persistenza dei dati. Invece di vincolare il funzionamento del sistema alla
disponibilità iniziale di un'infrastruttura di rete, si è adottato un paradigma _Offline-First_. In questo modello, il
dispositivo locale non funge da semplice _cache_ temporanea, ma rappresenta la fonte di verità primaria (_Single Source
of Truth_) per l'interfaccia utente. Tutte le operazioni di lettura e scrittura avvengono istantaneamente sul livello di
persistenza locale, garantendo un'esperienza fluida, reattiva e priva di latenze.
#v(0.5em)
L'adozione di tale strategia ha comportato la necessità di progettare anche un meccanismo robusto di sincronizzazione
asincrona con la fonte di dati remota. Per prevenire inconsistenze distribuite, si è optato per un sistema di
allineamento che opera in _background_, attivato a intervalli regolari o innescato da specifici eventi applicativi
(aggiornamento richiesto dall'utente).
#v(0.5em)
Dal punto di vista architetturale, il sistema implementa una coda di operazioni transazionali. Ogni volta che l'utente
esegue una modifica in locale, il dispositivo registra l'operazione nella coda transazionale, associandole un
identificativo univoco (_ID_) e marcandola con uno stato di attesa (_pending_). Non appena si stabilisce il collegamento
con il _cloud_, il _client_ avvia il processo di svuotamento della coda trasmettendo le variazioni al _server_, e
attende di ricevere la conferma e i dati aggiornati dal _cloud_ prima di dichiarare conclusa la sincronizzazione.
#v(0.5em)
Questo approccio strutturato si rivela fondamentale per supportare l'accesso _multidevice_ da parte dello stesso utente,
assicurando l'integrità e la coerenza dei dati in tutto l'ecosistema applicativo.




=== Gestione dello stato
L'utilizzo del pattern _MVVM_ necessita di particolare attenzione nel progettare un meccanismo per la gestione e la
propagazione dello stato dei singoli componenti all'interno dell'applicazione. L'obiettivo progettuale di partenza è
stato quello di disaccoppiare completamente la logica di _business_ dall'interfaccia utente, garantendo un flusso di
dati rigorosamente unidirezionale. A livello logico, il sistema è stato progettato in modo tale che la _View_ si
comporti come un componente passivo e reattivo. Invece di richiedere esplicitamente i dati, l'interfaccia si mette in
ascolto (tramite l'implementazione del pattern _Observer_) dei cambiamenti di stato esposti dal _ViewModel_. #figure(
  caption: "Gestione dello stato via MVVM",
)[#image("../images/state-management.png", width: 90%)]<fig:state-management>
Come mostrato in @fig:state-management, quando l'utente compie un'azione, come ad esempio avviare una misurazione, il
_ViewModel_ elabora la richiesta e notifica la _View_ di aggiornare l'interfaccia in uno stato di caricamento, una volta
completata l'operazione, il _ViewModel_ emetterà nuovamente uno stato che porta la _View_ ad uno stato finale che può
essere di successo o di errore. L'infrastruttura di gestione dello stato è quella che permette di intercettare questi
stati emessi e di aggiornare le parti dell'applicazione interessate. Questo approccio permette di evitare il cosiddetto
_prop-drilling_, ovvero la necessità di passare dati come parametri del costruttore per ogni livello dell'albero dei
componenti, semplificando notevolmente la gestione dello stato e migliorando la manutenibilità del codice.
=== _Routing_ dichiarativo
Per quanto riguarda la navigazione tra le schermate dell'applicazione, è stato adottato un approccio di _routing_
dichiarativo. Questo paradigma consente di definire in modo chiaro e centralizzato tutte le rotte e transizioni tra le
schermate, migliorando sia la leggibilità del codice sia la comprensione della struttura dell'applicazione. In questo
progetto le rotte sono definite come indirizzi (simili a _URL_ web), questo approccio offre diversi vantaggi:
- *_Deep Linking_*: consente di accedere direttamente a specifiche schermate tramite un link esterno (ad esempio,
  redirezione dopo un autenticazione) inizializzandole con i parametri corretti;
- *Guardie di Navigazione*: consente di implementare facilmente logiche di controllo dell'accesso a determinate
  schermate;
- *Sincronizzazione con lo stato*: la pila di navigazione viene costruita in modo dinamico in base allo stato
  dell'applicazione, ad esempio la pila di navigazione viene cambiata in modo reattivo all'autenticazione dell'utente
  eseguita con successo.
#v(0.5em)
Tale approccio favorisce la prevedibilità del comportamento dell'interfaccia utente, riduce l'accoppiamento tra i
componenti e semplifica le attività di manutenzione ed evoluzione del sistema.
=== Internazionalizzazione
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
sistema operativo, comporta un aggiornamento automatico di tutte le stringhe visualizzate, senza la necessità di
interventi manuali o di ricaricare l'applicazione.

