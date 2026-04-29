#import "../config/thesis-config.typ": (
  gl, glpl, obj-link, objectives-data, prod-link, products-data, render-objectives, render-products,
)
#import "../config/variables.typ": myTutor
#pagebreak(to: "odd")
= Descrizione stage<cap:descrizione-stage>
#text(style: "italic", [
  In questo capitolo approfondisco i vari aspetti legati allo stage, come, gli obiettivi, prodotti attesi, la
  pianificazione in dettaglio e l'analisi dei rischi.
])
#v(1em)
== Obiettivi <sez-obiettivi>
Si farà riferimento agli obiettivi secondo le seguenti notazioni:
- *O* per gli obiettivi obbligatori, vincolanti in quanto obiettivo primario richiesto dal committente;
- *D* per gli obiettivi desiderabili, non vincolanti o strettamente necessari, ma dal riconoscibile valore aggiunto;
- *F* per gli obiettivi facoltativi, rappresentanti valore aggiunto non strettamente competitivo.
Le sigle saranno seguite da una coppia sequenziale di numeri, identificativo dell'obiettivo.

#render-objectives(objectives-data)
== Prodotti attesi <sez-prodotti-attesi>
Per ogni prodotto atteso elencato di seguito si intende come versione minima attesa il completamento degli obiettivi
citati e come versione massima tutti gli obiettivi citati nella @sez-obiettivi.

#render-products(products-data)

== Pianificazione del lavoro
Lo stage prevedeva un impiego di 300-320 ore, distribuite nei mesi di maggio-giugno, 8 ore al giorno, ibrido, quindi con
presenza in sede alternata a giorni di lavoro da remoto.
=== Pianificazione Settimanale
Durante lo stage è stato deciso di far partire la pianificazione degli _sprint_ di una settimana di durata, a partire
dalla terza settimana. A termine di ogni sprint è previsto un incontro con gli stakeholder per una revisione e un
allineamento sui risultati raggiunti, con l'aggiunta di definizione delle task per lo sprint successivo. Per ogni
periodo di lavoro è associato un riferimento ai prodotti attesi specificati nella @sez-prodotti-attesi.
#v(0.8em)
- *Prima Settimana* (40 ore): #prod-link("PA-01"), #prod-link("PA-02")
  #v(0.8em)
  - Incontro con gli stakeholder per definire i dettagli del progetto, per discutere requisiti e richieste relativamente
    all'applicazione da sviluppare;
  - Introduzione alla Cultura Aziendale;
  - Formazione sulle tecnologie adottate (_Flutter_, _Node.js_ con _Fastify_, _Auth0_);
  - Presa visione dell'infrastruttura esistente e assegnazione dei relativi strumenti necessari;
  - Analisi dei requisiti.
#v(0.8em)
- *Seconda Settimana* (40 ore): #prod-link("PA-01"), #prod-link("PA-02")
  #v(0.8em)
  - Analisi dei requisiti;
  - Progettazione architetturale (Struttura app Flutter, modello dati locale, definizione API backend).
#v(0.8em)
- *Terza Settimana* (40 ore): #prod-link("PA-02")
  #v(0.8em)
  - Progettazione architetturale;
  - Analisi e definizione storie per il backlog dello Sprint successivo assieme al referente.
#v(0.8em)
- *Quarta Settimana* (40 ore): #prod-link("PA-03")
  #v(0.8em)
  - Sviluppo tramite la metodologia #gl("TDD") delle storie assegnate (motore di misurazione, interfaccia touch con
    guide mobili);
  - Stesura documentazione.
#v(0.8em)
- *Quinta Settimana* (40 ore): #prod-link("PA-03")
  #v(0.8em)
  - Sviluppo tramite la metodologia del _TDD_ delle storie assegnate (storico misurazioni locale, tutorial misurazione);
  - Stesura documentazione.
#v(0.8em)
- *Sesta Settimana* (40 ore): #prod-link("PA-03")
  #v(0.8em)
  - Sviluppo tramite la metodologia del _TDD_ delle storie assegnate (integrazione autenticazione tramite _Auth0_, #gl(
      "API",
    ) _backend_ per il salvataggio misurazioni);
  - Stesura documentazione.
#v(0.8em)
- *Settima Settimana* (40 ore): #prod-link("PA-03"), eventuale #prod-link("PA-04")
  #v(0.8em)
  - Sviluppo tramite la metodologia del _TDD_ delle storie assegnate (sincronizzazione dati con il _backend_, gestione
    profilo bambino);
  - Stesura documentazione.
#v(0.8em)
- *Ottava Settimana* (40 ore): #prod-link("PA-03"), eventuale #prod-link("PA-04"), #prod-link("PA-05")
  #v(0.8em)
  - Sviluppo tramite la metodologia del TDD delle storie assegnate (rifinitura #gl("UI"), gestione casi limite);
  - Collaudo finale e incontro finale con gli stakeholder;
  - Stesura documentazione.
#v(0.8em)

=== Bilancio complessivo

#figure(caption: "Tabella ore complessive", table(
  columns: (1fr, 0.5fr, 0.5fr),
  align: left,
  table.header([*Attività*], [*Settimana*], [*Ore di lavoro*]),
  [Comprensione sistema e obiettivi], [1], [20],
  [Analisi dei requisiti], [1-2], [40],
  [Progettazione], [2-3], [50],
  [Implementazione], [4-8], [112],
  [Test e validazione], [4-8], [68],
  [Documentazione], [2-8], [10],
  table.cell(colspan: 2)[Totale], [300],
))

== Analisi dei rischi
In questa fase iniziale sono stati identificati i seguenti rischi divisi in tre aree principali, organizzativi,
tecnologici e personali.

=== Rischi organizzativi
I rischi organizzativi riguardano principalmente la gestione del prodotto tra i vari stakeholder coinvolti.
==== Mancato rispetto delle scadenze stabilite
- *Descrizione*: Durante lo sviluppo del prodotto possono verificarsi ritardi rispetto al conseguimento delle task
  fissate, comportando un prolungamento dei tempi di completamento delle task e nel peggiore dei casi un ritardo nella
  data di consegna finale del prodotto.
- *Mitigazione*: Eventuali ritardi dovranno essere comunicati tempestivamente e motivati, cercando di mitigare l'impatto
  sulle task successive. Qualora il ritardo mettesse a rischio la data di consegna finale, si valuterà la possibilità di
  rivedere il piano di lavoro, rivedendo le task da completare e le relative scadenze.
- *Probabilità*: Media - Bassa
- *Impatto prestazionale*: Alto


=== Rischi tecnologici
I rischi tecnologici riguardano principalmente le difficoltà tecniche che potrebbero emergere durante lo sviluppo del
prodotto.
==== Errori di programmazione
- *Descrizione*: Risulta altamente improbabile che il prodotto finale sia privo di bug o errori di programmazione, che
  potrebbero compromettere il corretto funzionamento dello stesso.
- *Mitigazione*: Sarà necessario implementare un sistema di testing e debugging efficace, al fine di limitare al minimo
  la presenza di bug e garantire il funzionamento corretto del prodotto nella sua interezza. attività, verrà richiesto
  il supporto dell’Azienda proponente.
- *Probabilità*: Media - Alta
- *Impatto prestazionale*: Medio

=== Rischi personali
I rischi personali riguardano principalmente le difficoltà personali che potrebbero emergere durante lo sviluppo del
prodotto.
==== Indisponibilità temporanee
- *Descrizione*: Durante lo sviluppo potrebbero esserci indisponibilità temporanee, causando un rallentamento momentaneo
  del lavoro.
- *Mitigazione*: In caso di assenze temporanee, sarà necessario comunicare tempestivamente la situazione, cercando di
  recuperare il tempo perso una volta rientrati.
- *Probabilità*: Bassa
- *Impatto prestazionale*: Medio
