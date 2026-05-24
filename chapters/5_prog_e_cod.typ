= Progettazione e Codifica<cap:progettazione-e-codifica>
#text(style: "italic", [
  In questo capitolo vengono esposte le conclusioni sulla fase di progettazione e la descrizione dettagliata di ogni
  aspetto del prodotto finale.
])
== Architettura dell'infrastruttura
#figure(
  caption: "Architettura dell'infrastruttura",
)[#image("../images/architettura-sistema.png")]<fig:architettura-infrastruttura>
Per la progettazione dell'applicazione è stata adottata un'architettura a livelli, principalmente per avere una chiara
separazione delle responsabilità e una maggiore manutenibilità del codice. Come illustrato in
@fig:architettura-infrastruttura, sia nell'architettura dell'applicazione sia in quella del Backend è possibile distinguere tre
livelli principali:
#v(0.5em)
- *_Presentation Layer_ (Livello di Presentazione)*: rappresenta il livello più alto dell'architettura. Nel caso dell'applicazione comprende l'interfaccia utente e tutti gli aspetti legati alla gestione delle interazioni tra quest'utltima e il sistema. Al suo interno viene adottato il pattern _MVVM_ (_Model-View-ViewModel_) in cui la UI si occupa esclusivamente della rappresentazione grafica tramite _widgets_, mentre il _ViewModel_ gestisce la logica sottostante. Nel Backend, invece, questo livello rappresenta l'interfaccia di comunicazione con l'applicazione, e contiene tutte le rotte che espongono le API del sistema;
- *_Domain Layer_ (Livello di Dominio)*: costituisce il nucleo dell'applicazione e contiene i contratti e le interfacce condivise tra i vari livelli. È il livello da cui tutti gli altri dipendono e include le entità di dominio e le interfacce dei _repository_. Nel Backend, contiene il _service_ che rappresenta la logica di business;
- *_Data Layer_ (Livello dei Dati)*: rappresenta il livello più basso dell'architettura e si occupa della gestione dei dati in ingresso e in uscita dall'infrastruttura. Nell'applicazione contiene le implementazioni dei _repository_, il mapping tra le entità e modelli e le logiche necessarie alla comunicazione con il backend. In quest'ultimo, invece, comprende le logiche di autenticazione e tutte le operazioni di accesso e persistenza dei dati nel database.
#v(0.5em)
La scelta di adottare questa architettura è stata effettuata seguendo le best practice delle tecnologie utilizzate. Nei paragrafi successivi viene presentata un'analisi più dettagliata delle due parti principali del sistema e dei pattern adottati.

=== Applicazione
È importante sottolineare che l'architettura rappresentata in @fig:architettura-infrastruttura descrive la struttura interna adottata per ciascuna funzionalità dell'applicazione. L'intero sistema, infatti, è organizzato secondo un approccio _Feature-First_, nel quale ogni funzionalità implementa al proprio interno i principi della _Clean Architecture_. L'organizzazione complessiva del progetto secondo questo approccio è approfondita nelle sezioni successive.

==== Clean Architecture
#figure(
  caption: "Clean Architecture",
)[#image("../images/clean-architecture.jpg", width: 70%)]<fig:clean-architecture>
La _Clean Architecture_ rappresenta un paradigma architetturale che integra e sintetizza i principi fondamentali delle _Layered Architecture_, tra cui _Hexagonal Architecture_ e la _Onion Architecture_, con l'obiettivo di fornire linee guida per la progettazione di software caratterizzati da un alta modularità, separazione delle responabilità e richiesta di manutenibilità del codice sorgente.
#v(0.5em)
Alla base della _Clean Architecture_ vi è il principio denominato _The Dependency Rule_ (Regola delle Dipendenze), secondo il quale le dipendenze tra i livelli del software devono essere unidirezionali verso l'interno. In particolare, i componenti appartenenti ai livelli più interni non devono avere alcuna conoscenza delle implementazioni presenti nei livelli più esterni. In modo analogo, gli elementi definiti esternamente non possono essere referenziati nei livelli più interni, inclusi i formati dei dati utilizzati, variabili, funzioni e strutture dati. Tale separazione risulta evidente in @fig:architettura-infrastruttura, dove il livello di dominio contiene le proprie entità mentre il livello _data_ contiene i modelli utilizzati per rappresentare tali dati nel contesto dell'applicazione.
Tali entità di dominio non sono a conoscenza nè dei modelli nè delle operazioni che vengono effettuate su di esse.
#v(0.5em)
Come mostrato in @fig:clean-architecture, la direzione delle dipendenze risulta opposta rispetto al flusso di controllo e dei dati. Questa caratteristica deriva dall'applicazione del _Dependency Inversion Principle_ (Principio di Inversione delle Dipendenze), necessario per garantire il rispetto della regola delle dipendenze precedentemente descritta.
#v(0.5em)
Anche i dati che attraversano i confini tra i livelli devono sottostare alla regola delle dipendenze, perciò i dati devono sottostare alla regola delle dipendenze, perciò devono essere passati sotto forma di oggetti, oppure come parametri di funzione, ma mai come valori primitivi isolati. Questo approccio consente ai livelli interni di mantenere la propria indipendenza rispetto ai dettagli implementativi dei livelli esterni, garantendo che ogni livello possa manipolare i dati nella forma più appropriata alle proprie esigenze.
#v(0.5em)
L'adozione di questa architettura comporta diversi vantaggi:
- Consente di cambiare le tecnologie utilizzate nei livelli esterni senza introdurre cambiamenti nella logica dei livelli interni, aumentando la flessibilità del sistema rispetto a possibili evoluzioni future;
- L'applicazione del _Single Responsibility Principle_ (Principio della Responsabilità Singole), favorisce una maggiore testabilità, rendendo i livelli interni testabili tramite utilizzo di _mock_ o implementazioni simulate;
- L'organizzazione del codice permette un riutilizzo frequente e migliora la collaborazione tra più sviluppatori del progetto.
#v(0.5em)
Tuttavia la _Clean Architecture_ presenta anche alcuni svantaggi da non sottovalutare:
- L'utilizzo di molteplici livelli architetturali aumenta notevolmente la complessità strutturale e progettuale, questo rende il paradigma potenzialmente eccessivo per applicazioni di piccole dimensioni;
- La curva di apprendimento risulta elevata e richiede un maggiore investimento di tempo e risorse iniziale per padroneggiare il paradigma;
- Si verifica un incremento della quantità di codice dovuto al rispetto della regola delle dipendenze, che richiede differenti rappresentazioni dei dati per ciascun livello, oltre alla definizione di interfacce e relative implementazioni.
#v(0.5em)
Nonostante tali criticità suggeriscano l'utilizzo del paradigma per progetti complessi, nel sistema sviluppato duranto lo stage si è scelto comunque di adottare questa architettura, introducendo tuttavia alcune semplificazioni per rendere compatibile l'applicazione con i vincoli temporali dello stage.
In particolare, sono stati rimossi gli _Use Case_ al fine di evitare un ulteriore aumento di complessità. Nel contesto del progetto di stage, infatti, è risultato sufficiente l'utilizzo dei _ViewModel_ per la gestione della logica applicativa. Non si esclude tuttavia, un loro impiego in future evoluzioni.
#v(0.5em)
La scelta della _Clean Architecture_ è stata inoltre motivata dalla possibilità di supportare future modifiche sia dal punto di vista tecnologico sia funzionale, mantenendo un'elevata modularità senza compromettere la manutenibilità del sistema #cite(<clean-architecture>).
==== Approccio _Feature-First_<sez:feature-first>
L'approccio _Feature-First_ rappresenta una strategia di organizzazione del codice sorgente che prevede la suddivisione delle componenti non in base al loro ruolo tecnico, ma in base alle funzionalità che l'utente finale può effettivamente utilizzare. Grazie a questo approccio lo sviluppo è orientato alla realizzazione di moduli funzionali completi e indipendenti, ciascuno responsabile di una specifica area dell'applicazione. Ciò permette un efficiente sviluppo parallelo tra più membri del team, riducendo conflitti e limitando dipendenze incrociate. Come accennato in precedenza ogni funzionalità incapsula al proprio interno i principi della _Clean Architecture_ e i livelli architetturali della @fig:architettura-infrastruttura, garantendo una elevata coesione interna e un basso accoppiamento con le altre funzionalità. Il risultato dell'utilizzo di questa suddivisione è una leggibilità più chiara e un codice più manutenibile, poiché la struttura del progetto riflette il dominio applicativo e l'esperienza dell'utente finale.
Tra gli svantaggi principali di questo approccio vi è la possibile duplicazione di codice tra le funzionalità, che può essere mitigata attraverso l'utilizzo di componenti condivisi.

==== Model-View-ViewModel
#figure(
  caption: "Model-View-ViewModel",
)[#image("../images/mvvm-pattern.png", width: 70%)]<fig:mvvm>
Il _Model-View-ViewModel_ (MVVM) è un pattern architetturale che consente di separare in modo chiaro la UI dalla logica di business, in particolare divide una funzionalità in tre parti _Model_, _ViewModel_ e la _View_. Il _Model_ rappresenta la parte di dati che nell'architettura dell'applicazione è descritta dalle entità di dominio, mentre la _View_ assieme al _ViewModel_ rappresentano il livello di presentazione della funzionalità. Utilizzando gli approcci precedentemente descritti, ogni funzionalità avrà una propria _View_ rappresentata da una o più schermate con annesse i loro _ViewModel_. Il ruolo del _ViewModel_ è quello di gestire lo stato della schermata, infatti il _ViewModel_ non dipende da nessuna componente di UI, ma emette soltanto stato, a cui poi la _View_ reagisce cambiando l'interfaccia. Qualora il _ViewModel_ avesse troppa responsabilità nel collegamento tra _View_ e _Model_ è il caso in cui è necessario inserire gli _Use Case_.
