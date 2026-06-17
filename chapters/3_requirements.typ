#import "../config/thesis-config.typ": (
  glpl, obj-link, objectives-data, prod-link, products-data, render-objectives, render-products,
)
#import "data/requirements_list.typ": *

= Analisi dei requisiti<cap:analisi-requisiti>

#text(style: "italic", [
  In questo capitolo viene effettuata l'analisi degli utenti, delle _user stories_, degli obiettivi e dei prodotti
  attesi al termine dello stage.
])

== Analisi degli utenti
Nelle fasi iniziali dell'analisi dei requisiti, l'attenzione si è focalizzata sull'identificazione degli utenti finali
che avrebbero utilizzato l'applicazione.

In particolare sono stati individuati due attori principali:
#v(0.5em)
- *Utente _Guest_*: rappresenta l'utente non autenticato che può accedere alla piattaforma senza effettuare il _login_.
  Questo tipo di utente ha accesso alle funzionalità di misurazione del piede e di calcolo del percentile, ma non può
  accedere alla gestione dei dati e a tutto quello che concerne le informazioni sanitarie offerte dall'applicazione;
- *Utente Autenticato*: rappresenta un utente che ha effettuato correttamente il _login_ e ha, di conseguenza, accesso
  completo alle funzionalità dell'applicazione.
#v(0.5em)
Oltre alla semplice distinzione tra i due tipi di utenti, è stata effettuata un'ulteriore analisi per identificare i
possibili bisogni di ciascuna categoria. L'utente _Guest_ potrebbe essere un genitore che desidera effettuare una rapida
misurazione senza dover creare un account, mentre l'utente autenticato è generalmente un genitore interessato a
monitorare la crescita del proprio bambino nel tempo.
#v(0.5em)
La scelta di limitare la divisione degli utenti in sole due categorie deriva dalla necessità di ridurre la complessità
del progetto nelle prime fasi di sviluppo, concentrandosi maggiormente sulle funzionalità ritenute essenziali dal
cliente. Non si esclude, tuttavia, la possibilità di introdurre ulteriori categorie di utenti in futuro.
#v(0.5em)
In @fig:utenti è possibile vedere un diagramma che rappresenta le funzionalità divise per tipo di utente, evidenziando
quelle accessibili a ciascuna categoria.


#figure(caption: "Funzionalità dell'applicazione")[#image(
  "../images/utenti.png",
  width: 100%,
)]<fig:utenti>


== Sviluppo delle user stories
Nelle prime fasi dell'analisi dei requisiti, è stata definita una lista di _user stories_ ritenute necessarie per
soddisfare le esigenze del cliente, organizzandole successivamente in _epic_ in base alla loro area di implementazione.
#v(0.5em)
A ciascuna _user story_ è stato associato un punteggio di complessità, utilizzato per la pianificazione del lavoro
durante le iterazioni. La stima della complessità seguiva la sequenza di Fibonacci; il valore 13 rappresentava il
livello massimo di complessità gestibile all'interno di una singola iterazione.
#v(0.5em)
Ogni _user story_ seguiva la seguente struttura:
#v(0.5em)

*Titolo*: breve descrizione della funzionalità o del requisito descritto;

*Descrizione*: come utente [*ruolo*], voglio [*funzionalità*] per [*ragione*];

*Task*: elenco di attività necessarie al completamento della storia;

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
  1. implementazione pagine a _step_ del tutorial;
  2. implementazione bottone per saltare il tutorial;
  3. implementazione bottone "?" per visualizzare il tutorial in qualsiasi momento;
  4. implementazione logica per mostrare il tutorial alla prima misurazione e nasconderlo nelle misurazioni successive;
  5. implementazione salvataggio presa visione del tutorial.
  #p 2

  ==== Schermata di misurazione del piede<us:schermata-misurazione-piede>
  #d Come utente *_Guest_/Autenticato* che si trova nella pagina di misurazione voglio poter misurare correttamente il
  piede del bambino, muovendo le linee guida oppure inserendo manualmente la misura.
  #t
  1. implementazione pagina di misurazione del piede;
  2. implementazione linee guida per la misurazione del piede;
  3. implementazione righello guida per la misurazione del piede;
  4. implementazione inserimento manuale della misura del piede.
  #p 3

  ==== Schermata di calcolo percentile e risultati<us:schermata-calcolo-percentile>
  #d Come utente *_Guest_/Autenticato*, voglio poter dalla schermata Home accedere a quella di calcolo percentile,
  inserire i dati necessari e visualizzare i risultati.
  #t
  1. implementazione schermata di calcolo percentile;
  2. implementazione _Form_ per l'inserimento dei dati necessari al calcolo del percentile;
  3. implementazione grafici per la visualizzazione dei risultati del calcolo percentile;
  4. implementazione consiglio dell'esperto;
  5. implementazione logica di _routing_ per accedere alla schermata di calcolo percentile dalla Home.
  #p 3

  ==== Schermata di informazioni sanitarie<us:schermata-informazioni-sanitarie>
  #d Come utente *Autenticato* che si trova nella schermata di informazioni sanitarie, voglio poter visualizzare
  contenuti informativi dell'esperto riguardo a crescita, sviluppo motorio e calzature per bambini.
  #t
  1. implementazione schermata di informazioni sanitarie;
  2. implementazione consigli sulle calzature adatte;
  3. implementazione consigli sullo sviluppo motorio;
  4. implementazione segnali di attenzione riguardo alla crescita del bambino;
  5. implementazione logica di _routing_ per accedere alla schermata di informazioni sanitarie dalla barra di
    navigazione;
  6. implementazione salvataggio informazioni come nota del diario di un bambino registrato.
  #p 2

  ==== Diario del Bambino<us:diario-bambino>
  #d Come utente *Autenticato* che si trova nella schermata “Diario Bambino” voglio poter vedere le misurazioni
  effettuate fino a quel momento, le informazioni sanitarie salvate ed eventuali note testuali aggiuntive.
  #t
  1. implementazione schermata del diario del bambino;
  2. implementazione visualizzazione misurazioni del piede/calcolo percentile effettuate in formato tabellare;
  3. implementazione visualizzazione misurazione del piede/calcolo percentile effettuate in formato grafico;
  4. implementazione visualizzazione note aggiuntive salvate;
  5. implementazione logica di _routing_ per accedere alla schermata del diario del bambino dalla _Home_;
  6. implementazione recupero dati dal _database_ locale/remoto.
  #p 5

  ==== Schermata contatti<us:schermata-contatti>
  #d Come utente *_Guest_/Autenticato*, voglio poter vedere quali esperti ci sono nella mia zona o in base ad un
  indirizzo che inserisco.
  #t
  1. implementazione schermata contatti;
  2. implementazione _form_ di inserimento zona/indirizzo;
  3. implementazione visualizzazione lista card con i contatti degli esperti;
  4. implementazione calcolo distanza tramite dati nel _database_;
  5. implementazione logica di _routing_ per accedere alla schermata contatti dalla barra di navigazione.
  #p 3

  ==== Schermata _Home_<us:schermata-home>
  #d Come utente *_Guest_/Autenticato*, voglio poter visualizzare una schermata _Home_ con le funzionalità principali
  dell'applicazione e accedere alle altre schermate.
  #t
  1. implementazione schermata _Home_;
  2. implementazione logica di _routing_ per accedere alle altre schermate;
  3. implementazione visualizzazione funzionalità principali dell'applicazione;
  4. implementazione sezioni sfocata con richiesta di registrazione/login per visualizzare i dati completi.
  #p 2

  ==== Schermata iniziale o _Splash Screen_<us:splash-screen>
  #d Come utente *_Guest_/Autenticato*, voglio poter visualizzare una schermata iniziale con il logo dell'applicazione
  durante il caricamento dell'applicazione.
  #t
  1. implementazione schermata iniziale o _Splash Screen_;
  2. implementazione visualizzazione logo dell'applicazione;
  3. implementazione logica di _routing_ per accedere alla schermata _Home_ dopo un breve periodo di tempo.
  #p 1

  #heading(numbering: none, level: 3)[Epic 2. Account]

  ==== Gestione Bambini<us:gestione-bambini-registrati>
  #d Come utente *Autenticato*, voglio poter gestire più bambini all’interno della piattaforma, avendo dati gestiti per
  ognuno di essi.
  #t
  1. implementazione sezione di gestione bambini registrati con lista dinamica;
  2. implementazione logica di registrazione e rimozione bambino;
  3. implementazione _multi-tenancy_ per gestire i dati di più bambini in modo separato;
  4. implementazione operazioni _Create, Read, Update e Delete_ (CRUD) sui dati di ogni bambino;
  5. implementazione logica di _routing_ per accedere alla sezione di registrazione tramite pulsante nella schermata
    _Home_;
  6. implementazione _form_ per l'inserimento dei dati necessari alla registrazione di un bambino.
  #p 5

  ==== Implementazione autenticazione Auth0<us:autenticazione-auth0>
  #d Come utente *_Guest_*, voglio poter registrarmi e accedere alla piattaforma tramite autenticazione _Auth0_.
  #t
  1. implementazione autenticazione tramite _Auth0_;
  2. implementazione logica di registrazione e login tramite _Auth0_;
  3. implementazione logica di _logout_ tramite _Auth0_;
  4. implementazione logica di gestione sessione utente;
  5. implementazione logica di protezione delle rotte per le funzionalità riservate agli utenti autenticati.
  #p 2

  ==== Eliminazione account e dati<us:eliminazione-account-dati>
  #d Come utente *Autenticato*, voglio poter eliminare il mio account e tutti i dati associati alla piattaforma.
  #t
  1. implementazione logica di eliminazione account utente;
  2. implementazione logica di eliminazione dati associati all'account utente;
  3. implementazione logica di conferma dell'eliminazione account e dati;
  4. implementazione _reset_ dell'applicazione dopo l'eliminazione account e dati;
  5. implementazione pulsanti e messaggi di conferma per l'eliminazione account e dati;
  6. implementazione logica per eliminare diari di bambini registrati a scelta dell'utente.
  #p 3

  #heading(numbering: none, level: 3)[Epic 3. Misurazione]
  ==== Motore di misurazione del piede<us:motore-misurazione-piede>
  #d Come utente *_Guest_/Autenticato*, voglio poter misurare il piede tramite l’applicazione.
  #t
  1. implementazione motore di misurazione del piede;
  2. implementazione conversione da _pixel_ a centimetri;
  3. implementazione conversione centimetri a taglie di calzature;
  3. implementazione salvataggio dati in database locale/remoto.
  #p 5

  ==== Calcolo Percentile<us:calcolo-percentile>
  #d Come utente *_Guest_/Autenticato*, voglio poter calcolare il percentile all'interno dell'applicazione.
  #t
  1. implementazione motore di calcolo percentile;
  2. implementazione salvataggio dati in database locale/remoto.
  #p 5

  #heading(numbering: none, level: 3)[Epic 4. Impostazioni]
  ==== Impostazioni dell'applicazione<us:impostazioni-app>
  #d Come utente *_Guest_/Autenticato*, voglio poter accedere alla sezione di impostazioni dell'applicazione per
  personalizzare alcune funzionalità e preferenze.
  #t
  1. implementazione schermata di impostazioni dell'applicazione;
  2. implementazione cambio tema dell'applicazione;
  3. implementazione cambio lingua dell'applicazione;
  4. implementazione salvataggio preferenze dell'utente in database locale/remoto;
  5. implementazione logica di _routing_ per accedere alla sezione di impostazioni tramite pulsante nella barra di
    navigazione;
  6. implementazione internazionalizzazione dell'applicazione per supportare più lingue.
  #p 2
]

== Gli obiettivi dello stage<sez:obiettivi-stage>
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
modo concreto i risultati da conseguire al termine dello stage. Per ciascun prodotto atteso riportato di seguito, il
livello minimo previsto corrisponde al completamente degli obiettivi indicati, mentre il livello massimo comprende il
conseguimento di tutti gli obiettivi citati nella sezione precedente.

#render-products(products-data)
