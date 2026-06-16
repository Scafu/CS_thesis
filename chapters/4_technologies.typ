#import "../config/thesis-config.typ": *

= Tecnologie e strumenti utilizzati <cap:tecnologie>
#text(style: "italic", [
  In questo capitolo viene effettuata una panoramica delle tecnologie e degli strumenti adottati per il progetto, con
  particolare attenzione agli aspetti principali che li caratterizzano.
])
== Tecnologie
=== Dart
_Dart_ #cite(<dart>) è un linguaggio di programmazione _open-source_ sviluppato da _Google_, progettato con l'obiettivo
di ottimizzare lo sviluppo per piattaforme multiple. È un linguaggio fortemente tipizzato e _type safe_: il sistema di
tipi interno utilizza verifiche statiche per garantire la coerenza tra i valori e tipi delle variabili sin dalla fase di
compilazione, riducendo drasticamente gli errori rilevabili solo a _runtime_.
#v(0.5em)
Una delle caratteristiche distintive di _Dart_ è il suo sistema di tipi flessibile, oltre a quelli statici tradizionali,
supporta il tipo speciale `dynamic`, che consente di posticipare il controllo al momento dell'esecuzione, offrendo
maggiore flessibilità ove necessario. Un'altra importante caratteristica è la _null safety_ come funzionalità
predefinita e questo comporta alcune implicazioni:
#v(0.5em)
- i tipi sono non nulli per _default_; una variabile di tipo `String`, ad esempio, non potrà mai contenere il valore
  `null` a meno che non venga esplicitamente dichiarata come _nullable_ tramite la notazione `String?`;
- le variabili di tipo non nullo devono quindi essere inizializzate prima di poter compilare e possono essere assegnate
  esclusivamente a valori dello stesso tipo non nullo;
- il compilatore di _Dart_ è in grado, tramite analisi statica, di rilevare potenziali accessi o verifiche su valori
  `null`, eliminando alla radice la possibilità di valori `null` inintenzionali che potrebbero casuare errori _runtime_.
#v(0.5em)
Questo approccio rende il codice _Dart_ più robusto, leggibile e sicuro perchè sposta la verifica dall'esecuzione alla
compilazione.

Come mostrato in @dart-image, il _toolchain_ di compilazione di _Dart_ è progettata per supportare diversi scenari di
sviluppo e rilascio, adattandosi alla piattaforma di destinazione. #figure(caption: [Pipeline di compilazione di Dart#[\
    #text()[Fonte dell'immagine: #cite(<dart>)]]<no-index>])[
  #image("../images/Dart-platforms.png")
]<dart-image>
Dart può dunque essere utilizzato per sviluppare applicazioni su due principali categorie di piattaforme:
#v(0.5em)
- *Piattaforme native*: _Dart_ dispone di una macchina virtuale (#gl("VM")) con compilatore _just-in-time_ (#gl("JIT")),
  utilizzato principalmente in fase di sviluppo e di un compilatore _ahead-of-time_ (#gl("AOT")) per la produzione, che
  genera codice macchina nativo altamente ottimizzato, garantendo prestazioni elevate;
- *Piattaforme web*: oltre alle piattaforme native _Dart_ può essere convertito in _JavaScript_ oppure compilato
  direttamente in _WebAssembly_, un formato binario supportato da tutti i principali _browser_.
#v(0.5em)
Sono queste le caratteristiche che hanno reso _Dart_ una scelta ideale per lo sviluppo del progetto.
=== Flutter
_Flutter_ #cite(<flutter>) è un _toolkit UI_ _open-source_ sviluppato da _Google_, progettato per favorire il massimo
riutilizzo del codice tra diversi sistemi operativi, garantendo al contempo compatibilità diretta dell'applicazione con
i servizi nativi della piattaforma di destinazione. L'architettura di _Flutter_ si basa su una serie di librerie
indipendenti e stratificate, ciascun livello dipende strettamente da quello sottostante, rendendo ogni componente del
livello più alto opzionale e facilmente sostituibile. Data la sua natura di essere uno strumento per la creazione di
interfacce grafiche, _Flutter_ offre agli sviluppatori la possibilità di poter creare componenti personalizzati senza
dipendere necessariamente da quelli predefiniti.
#v(0.5em)
Il linguaggio di programmazione utilizzato da _Flutter_ è _Dart_, che mette a disposizione una funzionalità chiamata
_hot reload_, che permette di visualizzare in modo immediato i cambiamenti apportati al codice sorgente senza dover
ricompilare l'intera applicazione. Per il progetto questa funzionalità è stata particolarmente utile nella fase della
progettazione delle componenti, perchè ha reso i test visivi più rapidi e immediati, facendo risparmiare tempo durante
lo sviluppo.

=== Node JS
_Node JS_ #cite(<nodejs>) è un ambiente di _runtime_ _JavaScript_ _open-source_ e multipiattaforma, progettato per
eseguire codice lato server al di fuori del contesto _browser_. Si basa su un'architettura orientata agli eventi in cui
la quasi totalità delle librerie native esegue operazioni modo asincrono, rendendo _Node JS_ particolarmente adatto per
lo sviluppo di applicazioni e _API_ che richiedono una comunicazione in tempo reale. Il suo gestore di pacchetti
ufficiale ospita milioni di librerie pronte all'uso ed è questa caratteristica che ha contribuito a rendere _Node JS_
una delle tecnologie più popolari nel panorama dello sviluppo web.

All'interno del progetto di stage, _Node JS_ è stato impiegato per lo sviluppo del backend, nello specifico per la
realizzazione di un server _HTTP_.

=== Fastify
_Fastify_ #cite(<fastify>) è un _framework web_ per _Node JS_ ideato e sviluppato dai programmatori italiani Matteo
Collina e Tomas Della Vedova. Il _framework_ è stato concepito con l'obiettivo fondamentale di offrire un'eccellente
esperienza di sviluppo senza scendere a compromessi sulle prestazioni, grazie a una potente architettura basata su
_plugin_. _Fastify_ è uno dei _framework_ web più veloci nell'ecosistema _Node JS_, sfrutta schemi _JSON_ per la
validazione delle rotte e per l'ottimizzazione della serializzazione dei dati in uscita. Fornisce nativamente un sistema
di _logging_ interno ad alte prestazioni e come principale caratteristica distintiva, offre uno sviluppo basato su
_TypeScript_, che garantisce robustezza grazie al sistema di tipi statici.
#v(0.5em)

=== OAuth 2.0 <tech:oauth2.0>
L'OAuth 2.0 #cite(<oauth2.0>) è un protocollo di autorizzazione che dà la possibilità a un'applicazione di terze parti
di ottenere un accesso limitato a particolare servizio _HTTP_. Questo avviene agendo per conto del proprietario di una
risorsa, implementando un flusso di approvazione tra il proprietario e il servizio, oppure consentendo all'applicazione
di ottenere l'accesso per proprio conto. Questo protocollo è una diretta evoluzione del precedente _OAuth 1.0_.
#v(0.5em)
Il protocollo definisce un flusso di autorizzazione che coinvolge quattro ruoli principali:
#v(0.5em)
- *Proprietario della risorsa*: è un'entità in grado di concedere l'accesso a una risorsa protetta; se si tratta di una
  persona fisica, prende il nome di utente finale;
- *Server delle risorse*: é il server che detiene la risorsa protetta ed è in grado di rispondere a richieste di accesso
  utilizzando un _token_ di accesso valido;
- *Client*: è l'applicazione che desidera accedere alla risorsa protetta;
- *Server di autorizzazione*: è il server che rilascia i _token_ di accesso al client dopo aver autenticato
  correttamente il proprietario della risorsa e aver ottenuto la sua autorizzazione. Questo server può coincidere con il
  server delle risorse o essere un'entità separata.
#v(0.5em)

#figure(caption: [Flusso di autorizzazione OAuth 2.0])[
  #image("../images/oauth2.png", width: 80%)
]<fig:flow-oauth>

Come si può notare dalla @fig:flow-oauth, il flusso di autorizzazione inizia quando il _client_ richiede
l'autorizzazione al proprietario della risorsa, che può essere diretta o indiretta passando attraverso il server di
autorizzazione (1). Il _client_ riceve l'autorizzazione sotto forma di credenziale che certifica il permesso concesso
dal proprietario della risorsa (2). Il _client_ richiede quindi un _token_ di accesso autenticandosi presso il server di
autorizzazione (3); il server convalida l'autorizzazione e autentica il _client_, se tutto è valido, rilascia un _token_
di accesso (4). Il _client_ richiede la risorsa protetta al server che la detiene presentando il _token_ di accesso (5);
infine, il server valida il _token_ e, se confermato, fornisce la risorsa protetta (6).
#v(0.5em)
Per evitare possibili fraintendimenti terminologici, è opportuno chiarire la differenza tra i termini *Autenticazione* e
*Autorizzazione*:
#v(0.5em)
- *Autenticazione*: è il processo che consente al server di verificare l'identità del l'utente, è un processo che
  risponde alla domanda: "Chi sei?";
- *Autorizzazione*: è il processo che concede il permesso di eseguire determinate azioni o di accedere a specifiche
  risorse. È un processo che risponde in modo diretto alla domanda dal punto di vista del _client_: "Cosa posso fare?".

=== Auth0
_Auth0_ è una piattaforma _Identity and Access Management (IAM)_ ovvero un sistema che gestisce il ciclo di vita
_end-to-end_ delle identità e dei diritti degli utenti. Questo servizio permette di ridurre drasticamente i tempi di
implementazione dei flussi di autenticazione e autorizzazione nel proprio _backend_, prendendosi carico dell'intera
gestione della sicurezza e centralizzando la gestione degli accessi. _Auth0_ supporta numerosi flussi di autorizzazione,
tra cui il flusso del codice di autorizzazione con _Proof Key for Code Exchange (PKCE)_ ovvero un'estensione del flusso
di autorizzazione descritto in @fig:flow-oauth che inserisce un ulteriore livello di sicurezza. Questo livello di
sicurezza aggiuntivo consiste nell'introduzione di una chiave segreta crittografica (_code verifier_), che viene creata
dal _client_ per ogni richiesta di autorizzazione; tale chiave deve avere una lunghezza compresa tra 43 e 128 caratteri
ed è generata in modo tale da essere impossibile l'individuazione del valore. A partire da questa chiave il _client_
genera un ulteriore stringa chiamata _code challenge_ utilizzando algoritmi di hashing (tipicamente _SHA-256_).
#v(1em)
#figure(caption: [Flusso di autorizzazione con PKCE])[
  #image("../images/pkce.png")
]<fig:flow-pkce>
#v(1em)
Dalla @fig:flow-pkce si può notare come le due chiavi segrete vengano inviate in due momenti diversi, questo perchè il
meccanismo tramite _PKCE_ è stato progettato specificatamente per mitigare gli attacchi di intercettazione del codice di
autorizzazione. Infatti, con questo approccio, anche se un malintenzionato riuscisse a intercettare il codice di
autorizzazione, non potrebbe utilizzarlo senza conoscere il valore della chiave segreta generata dal _client_, rendendo
così il processo di autorizzazione più sicuro.
#v(0.5em)
Oltre a evitare l'implementazione del sistema di gestione delle identità, _Auth0_ offre una libreria sviluppata per
_Flutter_ chiamata _auth0_flutter_ che semplifica ulteriormente l'integrazione. All'interno di questo pacchetto oltre a
essere implementato di _default_ il flusso di autorizzazione con _PKCE_, viene offerto un meccanismo avanzato di difesa
contro attacchi di tipo _replay attack_ e _token theft_ denominato _Demonstrating Proof of Possession (DPoP)_. Questo
standard, basato sempre sul protocollo _OAuth 2.0_, utilizza la crittografia asimmetrica e i _Json Web Token_ (#gl(
  "JWT",
)) per vincolare l'utilizzo dell'_token_ di accesso alle richieste provenienti esclusivamente dal _client_ legittimo.

#figure(caption: [Flusso ad alto livello di autorizzazione con DPoP])[
  #image("../images/dpop.png")
]<fig:flow-dpop>
#v(1em)

Questo meccanismo prevede che il _client_ generi localmente una coppia di chiavi (pubblica e privata), firmando
successivamente un _JWT_ con la chiave privata e includendo quella pubblica nell'intestazione della richiesta. Quando il
server di autorizzazione valida il _JWT_, se questo risulta autentico, associa in modo permanente il _token_ di accesso
alla chiave pubblica del _client_. In questo modo il _token_ di accesso può essere validato dal server delle risorse
solo se accompagnato da una nuova firma digitale che dimostri il possesso della corrispondente chiave privata da parte
del _client_.

Oltre a questi meccanismi di sicurezza, _Auth0_ offre il supporto all'autenticazione tramite _Identity Providers_
esterni come _Google_ e, soprattutto, l'autenticazione biometrica. Quest'ultima funzionalità risulta di vitale
importanza per le applicazioni mobili che gestiscono dati o contenuti sensibili, in quanto permette di implementare un
ulteriore livello di sicurezza rendendo allo stesso tempo l'esperienza utente più fluida e immediata.

=== Git
_Git_ è un sistema di controllo di versione distribuito _open-source_ progettato da Linus Torvalds (creatore anche del
_kernel_ _Linux_), con l'obiettivo di garantire velocità ed efficienza anche nella gestione di progetti di milioni di
righe di codice. Nato originariamente come strumento da riga di comando, nel corso degli anni ha visto lo sviluppo di
numerose piattaforme e interfacce che lo implementano, rendendolo accessibile a sviluppatori con diversi livelli di
esperienza.
#v(0.5em)
In particolare, per questo progetto di stage è stato adottato un flusso di lavoro denominato _Git Flow_, il quale, come
mostrato in @fig:gitflow, prevede l'utilizzo di rami multipli per isolare le diverse fasi di sviluppo e ottimizzare la
collaborazione tra più membri del team.

#figure(caption: [Flusso di lavoro Git Flow #[\
    #text()[Fonte dell'immagine: #cite(<gitflow>)]]<no-index>])[
  #image("../images/gitflow.png")
]<fig:gitflow>

Al posto di un singolo ramo principale, questo modello prevede un ramo _main_ (o _master_) per tracciare la cronologia
dei rilasci ufficiali e un ramo _develop_ per integrare lo sviluppo delle nuove funzionalità. Le singole funzionalità
vengono sviluppate in rami dedicati, chiamati _feature_, che si diramano da _develop_ e, una volta completati e testati,
vengono uniti nuovamente in quest'ultimo tramite _pull request_ ovvero una richiesta di revisione del codice prima di
effettuare l'unione.
#v(0.5em)
Questo flusso di lavoro permette inoltre di gestire correzioni urgenti sul codice già in produzione senza interrompere
lo sviluppo corrente, in questi casi si creano rami chiamati _hotfix_ a partire dal ramo _main_, che vengono uniti sia
in quest'ultimo che in _develop_ una volta risolto il problema.
#v(0.5em)
Infine, prima di un rilascio ufficiale, viene isolato un ramo di _release_ per rifinire il codice ed eliminare eventuali
_bug_; al termine di quest'ultimo, sempre tramite _pull request_, viene unito sia in _main_ che in _develop_
contrassegnato con un'etichetti che identifica la versione rilasciata.
== Strumenti

=== Visual Studio Code
_Visual Studio Code_ è un _editor_ di codice sviluppato da _Microsoft_, progettato per essere leggero, veloce e
altamente personalizzabile. Supporta un'ampia gamma di funzionalità tra cui, _debugging_, l'evidenziazione della
sintassi, il completamento del codice e il versionamento integrato con _Git_.
#v(0.5em)
Questo strumento ha acquisito una notevole popolarità grazie al suo ampio ecosistema di estensioni, le quali consentono
di adattare l'ambiente di sviluppo alle esigenze specifiche del progetto. In particolare, per questo progetto di stage,
sono state utilizzate estensioni specifiche per _Dart_ e _Flutter_ che hanno permesso di integrare direttamente
nell'interfaccia gli emulatori dei dispositivi mobili e strumenti di analisi _runtime_, garantendo uno sviluppo più
fluido e orientato alla qualità del codice.

=== Figma
_Figma_ è uno strumento basato su _web_ per la progettazione di interfacce utente, che offre la possibilità di creare
prototipi interattivi e di collaborare in tempo reale con altri membri del _team_. In particolare questo strumento è
stato utilizzato durante le fasi preliminari del progetto per il disegno dell'interfaccia grafica, permettendo di
definire in modo dettagliato i singoli componenti visivi prima della loro effettiva implementazione.
#v(0.5em)
Oltre alla progettazione dei vettoriali e degli elementi di _UI_, _Figma_ è stato utilizzato per realizzazione dei
_wireframe_, ovvero riproduzioni schematiche volte a delineare i flussi di navigazione principali e le logiche di
interazione tra le varie schermate dell'applicazione.

=== Gitlab
_Gitlab_ è una piattaforma integrata per la gestione dell'intero ciclo di vita del software, che offre funzionalità
avanzate di controllo di versione del codice, gestione dei progetti, integrazione continua e distribuzione continua.
#v(0.5em)
All'interno di questa piattaforma sono state coordinate tutte le fasi del progetto, dalla pianificazione iniziale
tramite la definizione di _user stories_ tracciate sotto forma di _issue_, passando per la gestione collaborativa del
codice all'interno di una _repository_ _Git_, fino alla configurazione di _pipeline_ di test automatizzati. Queste
ultime hanno permesso l'esecuzione dei flussi di test a ogni singolo _commit_ e il monitoraggio costante ad ogni
rilascio e avanzamento di versione del software, garantendo così un elevato standard di qualità e affidabilità del
prodotto finale.
