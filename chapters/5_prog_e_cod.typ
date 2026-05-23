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
@fig:architettura-infrastruttura, nell'architettura sia dell'applicazione che del Backend è possibile distinguere tre
livelli principali:
- *_Presentation Layer_*: è il livello più alto, per l'applicazione, rappresenta l'interfaccia utente e tutto quello che
  riguarda la gestione delle interazioni tra quest'utltimo e il sistema, all'interno si può notare l'utilizzo del
  pattern MVVM (_Model-View-ViewModel_) dove la UI si occupa esclusivamente della rappresentazione grafica (_Widgets_) e
  il _ViewModel_ della logica sottostante. Per il Backend, invece, rappresenta l'interfaccia di comunicazione con
  l'applicazione, all'interno si trovano tutte le rotte che espongono le API del sistema.
- *_Domain Layer_*: rappresenta il nucleo dei contratti e delle interfacce dell'applicazione, è il livello da cui tutte
  le altre dipendono, contiene entità e interfacce dei _repository_.
- *_Data Layer_*: è il livello più basso, si occupa della gestione dei dati che fuoriscono dall'infrastruttura oppure
  che entrano al suo interno, contiene, per l'applicazione, l'implementazione dei repository, mapping tra entità e
  modelli e le logiche che permettono di contattare il Backend. Per quest'ultimo invece, contiene le logico per gestire
  l'autenticazione e tutti passaggi di dati con il Database.



