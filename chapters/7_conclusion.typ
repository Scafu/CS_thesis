#import "data/requirements_list.typ": *
#import "../config/variables.typ": *

= Conclusioni<cap:conclusioni>
#text(style: "italic", [
  In questo capitolo traggo le conclusioni sul progetto.
])
#v(1em)
== Consuntivo finale
Il centro di questo progetto è stata l'analisi e la progettazione di un'applicazione mobile multipiattaforma, in grado di poter calcolare la misura del piede di un bambino e di poter dare un riscontro matematico riguardo al percentile BMI.
Mostrando come sia possibile avere una calibrazione dello schermo stabile e affidabile, e avere un'applicazione che possa permettere un'integrazione di un _backend_ futura senza dover modificare alcuna parte del codice.
L'applicazione è stata progettata affinchè l'utente possa registrare i dati in locale solo se provvisto di account _Auth0_ questa tecnologia utilizza un flusso di autenticazione con _PKCE_ descritto nel @cap:tecnologie. La combinazione tra quest'ultima e la crittografia locale descritta in @cap:progettazione-e-codifica, permette all'applicazione di poter gestire utenti multipli, garantendo contemporaneamente il rispetto delle leggi del _GDPR_ sulla sicurezza e gestione dei dati.
== Raggiungimento degli obiettivi
Durante lo _stage_ sono stati raggiunti tutti gli obiettivi obbligatori descritti nella @sez:obiettivi-stage prefissati dal piano di lavoro concordato con l'azienda ospitante. In particolare sono stati raggiunti i seguenti obiettivi obbligatori:
#v(1em)
- *O-01*: apprendimento delle tecnologie di sviluppo come _Flutter_ e _Node.js_ con _Fastify_, e per il versionamento con _git_;
- *O-02*: analisi e studio delle tecnologie di calibrazione dello schermo e di rilevazione della misura tramite touch;
- *O-03*: sviluppo del motore di misurazione del piede con guide mobili e calcolo della lunghezza in centimetri basato sui _PPI_ del dispositivo;
- *O-04*: sviluppo dell'interfaccia per il tutorial di misurazione e per la visualizzazione del risultato;
- *O-05*: sviluppo della persistenza locale delle misurazioni e dell'interfaccia per la consultazione dello storico.
#v(1em)
Gli obiettivi desiderabili raggiunti sono stati:
#v(1em)
- *D-01*: sviluppo di un sistema di autenticazione con _Auth0_ e crittografia locale dei dati per la gestione di utenti multipli.
#v(1em)
Sono stati raggiunti anche alcuni obiettivi opzionali, come ad esempio:
#v(1em)
- *F-01*: sviluppo di un'interfaccia per la visualizzazione grafica dell'andamento delle misurazioni nel tempo;
- *F-02*: Sincronizzazione dei dati locali con il backend al ripristino della connessione.
#v(1em)
La progettazione del _backend_ in grado di gestire la sincronizzazione tra più dispositivi con l'obbligo secondo il _GDPR_ di usare nel database relazionale una _Hard-delete_ richiedeva troppo tempo anche a seguito di una stesura approfondita di un documento di fattibilità. Per questo l'obiettivo desiderabile *D-02* non è stato raggiunto, ma è stato comunque possibile progettare una possibile soluzione che potrebbe essere implementata in futuro.

== Conoscenze acquisite
Durante lo stage, ho avuto la possibilità di raffinare le conoscenze pregresse e di acquisirne di nuove, in particolare:
#v(1em)
- *Flussi per la crittografia dei dati*: la necessità di sottostare al _GDPR_ ha obbligato a studiare e implementare un sistema di crittografia locale dei dati. La vasta gamma di algoritmi crittografici ha permesso di approfondire tutte le sfacettature di questo argomento;
- *Flussi di autenticazione*: l'utilizzo di _Auth0_ ha permesso di approfondire i flussi di autenticazione che la piattaforma offre, in particolare il flusso con _PKCE_ che è stato implementato nell'applicazione. Questi flussi di autenticazione sono fondamentali per garantire la sicurezza e la gestione degli utenti in un'applicazione moderna;
- *Calibrazione dello schermo e misurazione tramite touch*: la necessità di sviluppare un motore che si basasse sullo schermo del cellulare, mi ha permesso di comprendere concetti come i _PPI_ e il loro utilizzo tramite formule matematiche per poter calcolare la misura ottenuta in una misura reale in centimetri;
- *Tecniche di sincronizzazione*: la progettazione del sistema di sincronizzazione tra più dispositivi, anche se non implementata, ha permesso di approfondire le tecniche che permettono di gestire più dati da più fonti, garantendo che i dati siano sempre consistenti e aggiornati.
== Valutazione personale
L'attività di _stage_ si è rivelata al di sopra delle aspettative, permettendomi di acquisire competenze tecniche, ma anche di crescita personale. Ho avuto l'opportunità di lavorare su un progetto reale, commissionato da un cliente, e di affrontare cambiamenti nei requisiti e nelle priorità, imparando a gestire queste situazioni in modo efficace.
L'ambiente di lavoro è stato stimolante e collaborativo, lasciandomi spazio per esprimere le mie idee e progettare liberamente l'architettura dell'applicazione scrivendo una documentazione tecnica di fattibilità ad ogni passo del progetto.
#v(1em)
La scelta di includere l'attività di _stage_ all'interno del percorso accademico penso sia stata una decisione molto positiva, dando la possibilità agli studenti di confrontarsi a primo impatto con il mondo del lavoro (ambiente assai differente da quello accademico) e di acquisire competenze che saranno fondamentali per il loro futuro professionale.
Lo studio accademico mi ha permesso seppur in modo teorico di comprendere in modo rapido i meccanismi alla base di molte tecnologie utilizzate durante lo stage, risparmiando tempo prezioso che avrei altrimenti dovuto dedicare per comprendere concetti di base, dandomi di conseguenza la possibilità di concentrarmi su aspetti più avanzati e specifici del progetto.
