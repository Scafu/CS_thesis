#import "../config/thesis-config.typ": integration-tests-data, render-tests, system-tests-data, unit-tests-data

= Verifica e Validazione<cap:test-e-validazione>
#text(style: "italic", [
  In questo capitolo vengono riportate le attività di verifica e validazione svolte durante lo sviluppo
  dell'applicazione, con particolare attenzione ai _test_ implementati per garantire la qualità del software e alla fase di
  collaudo ed accettazione del prodotto finale.
])

== Accessibilità e le linee guida utilizzate
Al fine di rendere l'applicazione accessibile su entrambe le piattaforme di utilizzo, si è deciso di aderire alle linee
guida fornite da _Google_ per _Android_ (_Material Design Accessibility Guidelines_) #cite(<material-accessibility>), e da _Apple_ per _iOS_ (_Human Interface Guidelines_) #cite(<ios-accessibility>), integrandole con le funzionalità di
accessibilità native del _framework_ _Flutter_. Quest'ultimo gestisce l'accessibilità attraverso un albero semantico parallelo all'albero dei _widget_. Tale struttura viene sfruttata dai servizi di assistenza delle rispettive
piattaforme, ovvero _TalkBack_ per _Android_ e _VoiceOver_ per _iOS_, per fornire feedback vocali e altre forme di
supporto. Ogni componente interattivo dell'applicazione espone etichette semantiche e, ove applicabile, un _flag_
`isSelected` per indicarne lo stato. Ciò riguarda in particolare i componenti di navigazione, come la
`CustomNavigationBar`, e i controlli di selezione come i _toggle_, la cui corretta semantica è stata verificata attraverso
_test_ automatizzati.

Le linee guida di _Material Design_ richiedono che le aree interattive abbiano una dimensione minima di 48x48 dp
(_Device-indipendent pixels_), mentre quelle di _iOS_ indicano una dimensione minima di 44x44 pt (_points_). Il
rispetto di queste dimensioni è stato attestato in modo automatico tramite la _suite_ di _test_ di accessibilità
integrata nella classe `AccessibilityGuidelines` di _Flutter_ (nello specifico `androidTapTargetGuideline`,
`iOSTapTargetGuideline` e `labeledTapTargetGuideline`, #cite(<flutter-accessibility>)) eseguita sui componenti
principali dell'interfaccia.
#v(0.5em)
Le convenzioni grafiche e di navigazione sono state mantenute coerenti in tutte le schermate, con l'obiettivo di fornire
un'esperienza utente fluida e intuitiva. Per facilitare lo sviluppo e garantirne l'uniformità, i componenti
dell'interfaccia sono stati progettati partendo da un elemento di base comune. Inoltre, per consentire un corretto
ridimensionamento sui diversi display, è stato adottato un _layout_ responsivo tramite la classe _AppDimensions_, che
fornisce dimensioni scalate in base alla risoluzione dello schermo utilizzato. I messaggi relativi all'esito delle
operazioni (come la modifica, l'aggiunta di un elemento o il completamento di una nuova misurazione) vengono notificati all'utente
tramite _snackbar_, fornendo un riscontro visivo immediato. Un controllo complessivo dell'accessibilità è stato
effettuato mediante la _suite_ di _test_ automatizzata descritta in questo capitolo, la quale ha permesso di individuare e
correggere tempestivamente le non conformità riscontrate, ove possibile, o di fornire soluzioni alternative per garantire un'esperienza inclusiva.

I _test_ descritti di seguito nei paragrafi successivi sono stati implementati avvalendosi della libreria nativa di _flutter_test_, la quale espone i costruttori utilizzati per la configurazione e l'esecuzione degli ambienti di collaudo.

== _Test_ di Unità
I _test_ di unità verificano il corretto funzionamento delle singole unità logiche dell'applicazione, isolandole dalle dipendenze esterne. Per simulare tali componenti, sono state create implementazioni fittizie,
in grado di restituire dati predicibili. All'interno di questa categoria rientrano anche i _test_ di _widget_, i quali permettono a _Flutter_
di renderizzare e interagire con singoli componenti dell'interfaccia grafica all'interno di un ambiente simulato, senza la necessità
di avviare l'intera applicazione. Essendo più realistici rispetto ai _test_ puramente logici,
consentono di validare il comportamento visivo dei componenti, le relative interazione e la corretta gestione dello stato.
I _test_ di unità sono identificati da questa convenzione:
#v(0.5em)
#align(center, text(12pt, weight: "semibold", "T[Tipo][Numero]"))
#v(0.5em)
dove:
- *Tipo*: indica la categoria del _test_, *U* per unità e *W* per _widget_;
- *Numero*: è identificativo progressivo che identifica univocamente il _test_ all'interno della categoria.
#v(0.5em)
Per ogni _test_ viene fornita una descrizione e uno stato che può essere:
- *I (_implemented_)*: il _test_ è stato implementato e superato con successo;
- *NI (_not implemented_)*: il _test_ non è stato implementato.
#v(0.5em)
#render-tests(unit-tests-data, cap: "Test di unità")

== _Test_ di Integrazione
I _test_ di integrazione verificano la corretta interazione tra più unità logiche e vengono eseguiti in un
ambiente di _Dart_ puro. Nel contesto di questo progetto, tali _test_ si assicurano che i _datasource_ e i _repository_ si integrino
correttamente con le fonti di dati esterne o locali, garantendo che l'applicazione funzioni anche in assenza di connessione di rete.
Questi _test_ sono identificati da questa convenzione:
#v(0.5em)
#align(center, text(12pt, weight: "semibold", "T[Tipo][Numero]"))
#v(0.5em)
dove:
- *Tipo*: indica la categoria del _test_, *I* per integrazione;
- *Numero*: è un identificativo progressivo che identifica univocamente il _test_ all'interno della categoria.
#v(0.5em)
Per ogni _test_ viene fornita una descrizione e uno stato che può essere:
- *I (_implemented_)*: il _test_ è stato implementato e superato con successo;
- *NI (_not implemented_)*: il _test_ non è stato implementato.
#v(0.5em)
#render-tests(integration-tests-data, cap: "Test di integrazione")

== _Test_ di Sistema
I _test_ di sistema validano il funzionamento dell'applicazione nella sua interezza, eseguendo simulazioni automatizzate
direttamente sul dispositivo fisico o sull'emulatore. A differenza dei _test_ di unità e di integrazione, questo approccio valuta l'applicazione dal punto di vista dell'utente finale, senza conoscere la struttura interna del codice. Per queste verifiche è stato impiegato il pacchetto _Integration_test_, che permette di guidare l'applicazione e simulare interazioni reali. I controlli si concentrano sulla risposta visiva dell'interfaccia (presenza di _widget_, assenza di
indicatori di caricamento, ecc.).
#v(0.5em)
#align(center, text(12pt, weight: "semibold", "T[Tipo][Numero]"))
#v(0.5em)
dove:
- *Tipo*: indica la categoria del _test_, *S* per sistema;
- *Numero*: è un identificativo progressivo che identifica univocamente il _test_ all'interno della categoria.
#v(0.5em)
Per ogni _test_ viene fornita una descrizione e uno stato che può essere:
- *I (_implemented_)*: il _test_ è stato implementato e superato con successo;
- *NI (_not implemented_)*: il _test_ non è stato implementato.
#v(0.5em)
#render-tests(system-tests-data, cap: "Test di sistema")

== Accettazione e collaudo
Al termine di ogni _sprint_, è stato organizzato un incontro di revisione con il _tutor_ aziendale al fine di analizzare lo
stato di avanzamento del progetto, discutere eventuali criticità riscontrate e pianificare le attività per lo _sprint_
successivo. Durante questi incontri, sono stati presentati i traguardi raggiunti, compresi i _test_
superati con successo, e sono state valutate le nuove funzionalità da implementare. Queste riunioni includevano costantemente una dimostrazione pratica
dell'applicazione, utile per illustrare concretamente il funzionamento dei flussi operativi. Questo ciclo di _feedback_ si è rivelato fondamentale per mantenere l'allineamento con le aspettative iniziali e per integrare tempestivamente miglioramenti o correzioni.

L'ultima settimana di stage è stata interamente dedicata alle procedure di rilascio e alla risoluzione di eventuali anomalie minori tramite _hotfix_. In quest'ultima fase, il prodotto finale è stato consegnato ufficialmente ed è stato validato tramite la raccolta dei _feedback_ conclusivi, attestando dunque il completamento del collaudo.

