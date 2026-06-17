#import "data/requirements_list.typ": *
#import "../config/variables.typ": *

= Conclusioni<cap:conclusioni>
#text(style: "italic", [
  In questo capitolo traggo le conclusioni sul progetto.
])
#v(1em)
== Consuntivo finale
Il fulcro di questo progetto è consistito nell'analisi e nella progettazione di un'applicazione _mobile_ multi-piattaforma in grado di calcolare la misura del piede di un bambino e di fornire un riscontro matematico relativo al percentile di crescita.
#v(0.5em)
Il lavoro svolto ha dimostrato come sia possibile ottenere una calibrazione dello schermo stabile e affidabile, strutturando al contempo l'applicazione per permettere una futura integrazione di un _backend_ senza dover intaccare l'architettura preesistente.
#v(0.5em)
L'applicativo è stato progettato affinché l'utente possa registrare i dati in locale solo se provvisto di un _account_ _Auth0_; questa tecnologia sfrutta un flusso di autenticazione con _PKCE_ descritto nel @cap:tecnologie. La combinazione tra quest'ultimo e la crittografia locale, descritta in @cap:progettazione-e-codifica, permette all'applicazione di gestire utenti multipli, garantendo contemporaneamente il rigoroso rispetto delle normative del _GDPR_ sulla sicurezza e sulla gestione dei dati personali.
== Raggiungimento degli obiettivi
Durante lo _stage_ sono stati raggiunti tutti gli obiettivi obbligatori descritti nella @sez:obiettivi-stage e prefissati nel piano di lavoro concordato con l'azienda ospitante. In particolare, sono stati completati:
#v(1em)
- *O-01*: apprendimento delle tecnologie di sviluppo come _Flutter_ e _Node.js_ con _Fastify_, e per il versionamento con _git_;
- *O-02*: analisi e studio delle tecnologie di calibrazione dello schermo e di rilevazione della misura tramite _touch_;
- *O-03*: sviluppo del motore di misurazione del piede con guide mobili e calcolo della lunghezza in centimetri basato sui _PPI_ del dispositivo;
- *O-04*: sviluppo dell'interfaccia per il tutorial di misurazione e per la visualizzazione del risultato;
- *O-05*: sviluppo della persistenza locale delle misurazioni e dell'interfaccia per la consultazione dello storico.
#v(0.5em)
Gli obiettivi desiderabili raggiunti sono stati:
#v(0.5em)
- *D-01*: sviluppo di un sistema di autenticazione con _Auth0_ e crittografia locale dei dati per la gestione di utenti multipli.
#v(0.5em)
Sono stati raggiunti anche alcuni obiettivi opzionali, tra cui:
#v(0.5em)
- *F-01*: sviluppo di un'interfaccia per la visualizzazione grafica dell'andamento delle misurazioni nel tempo;
- *F-02*: Sincronizzazione dei dati locali con il backend al ripristino della connessione.
#v(0.5em)
La progettazione di un _backend_ in grado di gestire la sincronizzazione tra più dispositivi, rispettando l'obbligo imposto dal _GDPR_ di utilizzare una _Hard-delete_ nel database relazionale, avrebbe richiesto tempistiche eccessive, nonostante la stesura approfondita di un documento di fattibilità. Per questo motivo, l'obiettivo desiderabile *D-02* non è stato implementato, ma è stata comunque definita una soluzione architetturale che potrà essere sviluppata in futuro.

== Conoscenze acquisite
Durante il periodo di tirocinio ho avuto la possibilità di raffinare le mie conoscenze pregresse e di acquisirne di nuove, in particolare:
#v(0.5em)
- *Flussi per la crittografia dei dati*: la necessità di sottostare al _GDPR_ mi ha spinto a studiare e implementare un sistema di crittografia locale dei dati. L'esplorazione di diverse soluzioni mi ha permesso di approfondire le molteplici sfaccettature di questo dominio;
- *Flussi di autenticazione*: l'adozione di _Auth0_ come piattaforma di autenticazione mi ha dato la possibilità di comprendere a fondo i flussi di autenticazione offerti dalla piattaforma, con particolare attenzione al flusso con _PKCE_ implementato poi nell'applicazione;
- *Calibrazione dello schermo e misurazione tramite _touch_*: la necessità di sviluppare un motore di misurazione basato sullo schermo dello _smartphone_ mi ha portato a comprendere concetti fisici e logici come i _PPI_, applicando formule matematiche per convertire la rilevazione digitale in centimetri effettivi;
- *Tecniche di sincronizzazione*: la progettazione teorica del sistema di sincronizzazione mi ha permesso di analizzare le tecniche per la gestione di dati provenienti da fonti distribuite, garantendo la consistenza e l'aggiornamento.
== Valutazione personale
L'attività di _stage_ si è rivelata al di sopra delle mie aspettative, permettendomi non solo di ampliare il mio bagaglio tecnico, ma anche di maturare professionalmente. Ho avuto l'opportunità di lavorare su un progetto reale, commissionato da un cliente, affrontando le naturali evoluzioni dei requisiti e delle priorità, e imparando a gestire queste dinamiche in modo efficace.
#v(0.5em)
L'ambiente lavorativo è stato stimolante e collaborativo; ho avuto lo spazio necessario per esprimere le mie idee e per guidare le scelte architetturali dell'applicazione, supportando ogni fase con un'adeguata documentazione tecnica di fattibilità.
#v(0.5em)
Reputo che l'inclusione di un'attività di tirocinio curricolare all'interno del percorso accademico sia una scelta estremamente valida. Offre agli studenti l'occasione di interfacciarsi per la prima volta con il mondo aziendale, le cui dinamiche differiscono profondamente da quelle universitarie, e di consolidare competenze trasversali determinanti per il futuro professionale.
#v(0.5em)
Infine, il solido _background_ culturale fornito dallo studio accademico mi ha permesso di assimilare rapidamente i meccanismi alla base delle tecnologie adottate. Questo ha ridotto drasticamente il tempo altrimenti necessario per colmare le lacune sui concetti fondamentali, dandomi la libertà di concentrarmi sugli aspetti più avanzati, come la scalabilità del codice e i _design pattern_.
