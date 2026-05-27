#import "../config/thesis-config.typ": *

= Tecnologie utilizzate <cap:tecnologie>
#text(style: "italic", [
  In questo capitolo viene effettuata una panoramica delle tecnologie adottate per il progetto, con particolare attenzione agli aspetti principali che le caratterizzano.
])

== Dart
_Dart_ #cite(<dart>) è un linguaggio di programmazione _open-source_ sviluppato da _Google_, progettato con l'obiettivo
di ottimizzare lo sviluppo per piattaforme multiple. È un linguaggio fortemente tipizzato e _type safe_, il sistema di
tipi interno utilizza verifiche statiche per garantire la coerenza tra i valori e tipi delle variabili a partire dalla
fase di compilazione, riducendo drasticamente gli errori rilevabili solo a _runtime_.
#v(0.5em)
Una delle caratteristiche distintive di _Dart_ è il suo sistema di tipi flessibile, oltre a quelli statici tradizionali,
supporta il tipo special `dynamic`, che consente di posticipare il controllo nel momento dell'esecuzione, dando la
possibilità di maggiore flessibilità ove necessario. Un'altra importante caratteristica è la _null safety_ come
funzionalità predefinita e questo comporta alcune implicazioni:
#v(0.5em)
- I tipi sono non nulli per _default_, una variabile di tipo `String`, ad esempio, non potrà mai contenere il valore
  `null` a meno che non venga esplicitamente dichiarata come nullable tramite la notazione `String?`;
- Le variabili di tipo non nullo devono essere quindi inizializzate prima di poter compilare e possono essere assegnate
  esclusivamente a valori dello stesso tipo non nullo;
- Il compilatore di _Dart_ è in grado tramite analisi statica di rilevare potenziali accessi o verifiche su valori
  `null`, eliminando alla radice la possibilità di valori `null` inintenzionali che potrebbero casuare errori _runtime_.
#v(0.5em)
Questo approccio rende il codice _Dart_ più robusto, leggibile e sicuro perchè sposta la verifica dall'esecuzione alla
compilazione.

Come mostrato in @dart-image, il _toolchain_ di compilazione di _Dart_ è progettato per supportare scenari di sviluppo e
rilascio diversi, adattandosi alla piattaforma di destinazione. #figure(caption: [Pipeline di compilazione di Dart#[\ #text()[Fonte dell'immagine: #cite(<dart>)]]<no-index>])[
  #image("../images/Dart-platforms.png")
]<dart-image>
Dart può dunque essere utilizzato per sviluppare applicazioni su due principali categorie di piattaforme:
#v(0.5em)
- *Piattaforme native*: _Dart_ dispone di una macchina virtuale (VM) con compilatore _just-in-time_ (#gl("JIT")),
  utilizzato principalmente in fase di sviluppo e di un compilatore _ahead-of-time_ (#gl("AOT")) per la produzione, che
  genera codice macchina nativo altamente ottimizzato, garantendo particolari prestazioni elevate.
- *Piattaforme web*: oltre alle piattaforme native _Dart_ può essere convertito in _JavaScript_ oppure compilato
  direttamente in _WebAssembly_, un formato binario supportato da tutti i tipi di _browser_.
#v(0.5em)
Sono queste le caratteristiche che hanno reso _Dart_ una scelta ideale per lo sviluppo del progetto.
== Flutter
_Flutter_ #cite(<flutter>) è un _toolkit UI_ open-source sviluppato da _Google_, progettato per favorire il massimo
riutilizzo del codice tra diversi sistemi operativi, garantendo al contempo compatibilità diretta dell'applicazione con
i servizi nativi della piattaforma di destinazione. L'architettura di _Flutter_ si basa su una serie di librerie
indipendenti e stratificate, ciascun livello dipende strettamente da quello sottostante, rendendo ogni componente del
livello più alto opzionale e facilmente sostituibile. Data la sua natura di essere uno strumento per la creazione di
elementi grafici, _Flutter_ dà la possibilità agli sviluppatori di poter creare i propri componenti personalizzati,
senza dipendere necessariamente da quelli predefiniti. Il linguaggio di programmazione utilizzato da _Flutter_ è _Dart_,
che offre una funzionalità chiamata _hot reload_, dando la possibilità agli sviluppatori di vedere in modo immediato i
cambiamenti apportati al codice sorgente senza dover ricompilare l'intera applicazione.
#v(0.5em)
Per il progetto questa funzionalità è stata particolarmente utile nella fase della progettazione delle componenti, questo perchè rendeva i test visivi più rapidi e immediati, permettendo di iterare più velocemente sul design dell'applicazione.

== Node JS
_Node JS_ #cite(<nodejs>) è un ambiente di runtime _JavaScript_ _open-source_ e multipiattaforma, progettato per
eseguire codice lato server al di fuori del contesto browser. Si basa su un'architettura orientata agli eventi in cui la
quasi totalità delle librerie native esegue operazioni modo asincrono rendendo _Node JS_ particolarmente adatto per lo
sviluppo di applicazioni e _Application Programming Interface_ (#gl("API")) che richiedono una comunicazione in tempo
reale. Il suo _manager_ di pacchetti ufficale ospita milioni di librerie pronte all'uso ed è questa caratteristica che
ha contribuito a rendere _Node JS_ una delle tecnologie più popolari nel panorama dello sviluppo web.

== Fastify
_Fastify_ #cite(<fastify>) è un framework web per _Node JS_ ideato e sviluppato dai programmatori italiani Matteo
Collina e Tomas Della Vedova. Il framework è stato concepito con l'obiettivo fondamentale di offrire un'eccellente
esperienza di sviluppo senza scendere a compromessi di _performance_, grazie a una potente architettura basata su
plugin. _Fastify_ è riconosciuto per essere uno dei framework web più veloci nell'ambiente di _Node JS_, sfrutta schemi
_JSON_ per la validazione delle rotte e per l'ottimizzazione della serializzazione dei dati in uscita. Fornisce
nativamente un sistema di _logging_ interno ad alte prestazioni e come principale caratteristica distintiva, offre uno
sviluppo basato su _TypeScript_, garantendo robustezza grazie al sistema di tipi statici.




