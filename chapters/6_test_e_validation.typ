#import "../config/thesis-config.typ": integration-tests-data, render-tests, system-tests-data, unit-tests-data

= Verifica e Validazione<cap:test-e-validazione>
#text(style: "italic", [
  In questo capitolo vengono riportate le attività di verifica e validazione svolte durante lo sviluppo
  dell'applicazione, con particolare attenzione ai test svolti per garantire la qualità del software e alla fase di
  collaudo ed accettazione del prodotto.
])

== Accessibilità e le linee guida utilizzate
Al fine di rendere l'applicazione accessibile su entrambe le piattaforme di utilizzo, si è deciso di seguire le linee
guida per l'accessibilità fornite da _Google_ per _Android_ (_Material Design Accessibility Guidelines_) #cite(
  <material-accessibility>,
), e da _Apple_ per _iOS_ (_Human Interface Guidelines_) #cite(
  <ios-accessibility>,
), integrate con le funzionalità di accessibilità native del _framework_ _Flutter_. _Flutter_ gestisce l'accessibilità
attraverso un albero semantico che vive parallelamente all'albero dei _widget_. Questo albero viene utilizzato dai
servizi di assistenza delle rispettive piattaforme, _TalkBack_ per _Android_ e _VoiceOver_ per _iOS_, che forniscono
feedback vocali e altre forme di assistenza. Ogni componente interattivo dell'applicazione espone etichette semantiche
e, ove applicabile, un _flag_ `isSelected` per indicare lo stato di selezione. Ciò riguarda in particolare i componenti
di navigazione, come la `CustomNavigationBar`, e i controlli di selezione come _toggle_, la cui corretta semantica è
stata verificata attraverso _test_ automatizzati.

Le linee guida di _Material Design_ richiedono che le aree interattive abbiano una dimensione minima di 48x48 dp
(_Device-indipendent pixels_), mentre le linee guida di _iOS_ indicano una dimensione minima di 44x44 pt (_points_). Il
rispetto di queste dimensioni viene attestato in modo automatico grazie alla _suite_ di _test_ di accessibilità
integrata nella classe `AccessibilityGuidelines` di _Flutter_ (in particolare `androidTapTargetGuideline`,
`iOSTapTargetGuideline` e `labeledTapTargetGuideline`, #cite(
  <flutter-accessibility>,
)) che viene eseguita sui componenti principali dell'interfaccia.
#v(0.5em)
Le convenzioni grafiche e di navigazione sono state mantenute coerenti in tutte le schermate, cercando di fornire
un'esperienza utente fluida e intuitiva. Per facilitare lo sviluppo e garantirne la coerenza, i componenti
dell'applicazione sono stati sviluppati partendo da un elemento di base. Inoltre, per consentire un corretto
ridimensionamento sui diversi display, è stato adottato un _layout_ responsivo tramite la classe _AppDimensions_, che
fornisce dimensioni scalate in base alla grandezza dello schermo utilizzato. I messaggi relativi al risultato delle
operazioni (come la modifica, l'aggiunta di un elemento o il completamento di una nuova misurazione) vengono mostrati
tramite _snackbar_, fornendo un feedback immediato all'utente. Un controllo complessivo dell'accessibilità è stato
effettuato tramite la suite di _test_ automatizzata descritta in questo capitolo, la quale ha permesso di individuare e
correggere le non conformità riscontrate, ove possibile, o di fornire soluzioni alternative per garantire un'esperienza
utente accessibile e inclusiva.

I test che verrano che verrano descritti di seguito sono stati eseguiti grazie ad una libreria nativa di _Flutter_,
_flutter_test_, che espone costruttori utilizzati per configurare e eseguire i test.

== Test di Unità
I test di unità verificano il corretto funzionamento delle singole unità logiche dell'applicazione, senza dipendenze
reali da infrastrutture esterne. Per simulare queste dipendenze necessarie, sono state fatte implementazione fittizie,
che restituiscono dati predicibili. All'interno di questa categoria rientrano i test di _widget_, nei quali _Flutter_
permette di renderizzare e interagire con singoli componenti dell'interfaccia grafica in un ambiente simulato, evitando
di dover avviare l'intera applicazione. Questi test essendo più realistici rispetto ai test precedentemente descritti,
permettono di verificare il comportamento visivo dei componenti, la loro interazione e la corretta gestione dello stato.
I test di unità sono identificati da questa convenzione:
#v(0.5em)
#align(center, text(12pt, weight: "semibold", "T-Tipo[Numero]"))
#v(0.5em)
dove:
- *Tipo*: indica la categoria del test, *U* per unità e *W* per _widget_;
- *Numero*: è un numero progressivo che identifica univocamente il test all'interno della categoria.
#v(0.5em)
Per ogni test viene fornita una descrizione e uno stato che può essere:
- *I (_implemented_)*: il test è stato implementato e superato con successo;
- *NI (_not implemented_)*: il test non è stato implementato.
#v(0.5em)
#render-tests(unit-tests-data, cap: "Test di unità")

== Test di Integrazione
#render-tests(integration-tests-data, cap: "Test di integrazione")

== Test di Sistema
#render-tests(system-tests-data, cap: "Test di sistema")
