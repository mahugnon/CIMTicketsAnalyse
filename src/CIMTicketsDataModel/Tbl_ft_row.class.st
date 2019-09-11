Class {
	#name : #'Tbl_ft_row',
	#superclass : #'Tbl_row',
	#instVars : [
		'ft_id',
		'ft_numordre',
		'ft_refclt',
		'ft_datecrea',
		'ft_priorite',
		'ft_test',
		'ft_type',
		'ft_etat',
		'ft_etatcommentaire',
		'ft_objet',
		'ft_constat',
		'ft_version_id',
		'ft_propo',
		'ft_resultsouhait',
		'ft_ddedevis',
		'ft_delaiprevu',
		'ft_delaisouhait',
		'ft_delaicommentaire',
		'ft_delaireel',
		'ft_delaiexpir',
		'ft_cc',
		'ft_facture_id',
		'ft_devis_id',
		'ft_modif_id',
		'ft_cim_id',
		'ft_clt_id',
		'ft_dossier_list',
		'ft_theme_id',
		'ft_lienft_list',
		'ft_dev_id',
		'ft_test_id',
		'ft_nonlu',
		'ft_hist_id',
		'ft_contexte',
		'ft_nbretour',
		'ft_attinfos',
		'ft_version_news',
		'ft_version_souhait',
		'ft_deplacement',
		'ft_typcorr_id',
		'ft_compta',
		'ft_nbretour_test',
		'ft_date_transfert',
		'ft_createur',
		'ft_sous_categorie_id',
		'ft_tnr',
		'dev',
		'typeCorrection',
		'bibliotheques',
		'timeDev',
		'versions',
		'dependenceModel',
		'modules',
		'associatedPhysiqueFiles',
		'modulesFromAssociatedFile',
		'connectedTickets'
	],
	#category : #'CIMTicketsDataModel-Model'
}

{ #category : #visiting }
Tbl_ft_row >> acceptBuider: aGuiBuilder [
	aGuiBuilder buildTicketNode
]

{ #category : #adding }
Tbl_ft_row >> addAssociatedPhysiqueFile: aString [
	associatedPhysiqueFiles ifNil: [ associatedPhysiqueFiles := Set new ].
	associatedPhysiqueFiles add: aString
]

{ #category : #adding }
Tbl_ft_row >> addAssociatedPhysiqueModule: aString [
	modulesFromAssociatedFile
		ifNil: [ modulesFromAssociatedFile := Set new ].
	modulesFromAssociatedFile
		addAll: (Tbl_Module selectModuleFor: aString)
]

{ #category : #API }
Tbl_ft_row >> analyseContat [
	CIMConstatAnalyser new analyse: self
]

{ #category : #accessing }
Tbl_ft_row >> associatedPhysique [
	^ associatedPhysiqueFiles
]

{ #category : #accessing }
Tbl_ft_row >> associatedPhysique: anObject [
	^ associatedPhysiqueFiles := anObject
]

{ #category : #accessing }
Tbl_ft_row >> bibliotheques [
	^ bibliotheques
]

{ #category : #accessing }
Tbl_ft_row >> bibliotheques: anObject [
	bibliotheques := anObject
]

{ #category : #accessing }
Tbl_ft_row >> connectedTickets [
	^ connectedTickets
]

{ #category : #accesing }
Tbl_ft_row >> connectedTickets: aCollection [
	connectedTickets := aCollection
]

{ #category : #accessing }
Tbl_ft_row >> content [
	^ {}
]

{ #category : #API }
Tbl_ft_row >> dateClosing [
	^ dev dateClosing
]

{ #category : #API }
Tbl_ft_row >> dateOpening [
	^ dev ft_datecrea
]

{ #category : #accessing }
Tbl_ft_row >> dependenceModel [
	^ dependenceModel
]

{ #category : #accessing }
Tbl_ft_row >> dependenceModel: anObject [
	dependenceModel := anObject
]

{ #category : #accessing }
Tbl_ft_row >> dev [
	^ dev
]

{ #category : #accessing }
Tbl_ft_row >> dev: arg1 [
	dev := arg1
]

{ #category : #api }
Tbl_ft_row >> devTpsDev [
	^ self timeDev select: #isDevelopment
]

{ #category : #API }
Tbl_ft_row >> devTpsEstim [
	dev dev_tps_estim = String empty
		ifTrue: [ ^ 0 asDuration ].
	^ dev dev_tps_estim
]

{ #category : #api }
Tbl_ft_row >> devTpsTest [
	^ self timeDev select: #isDevelopmentTest
]

{ #category : #API }
Tbl_ft_row >> devTpsTotalMinusEstim [
	^ dev devTpsTotalMinusEstim
]

{ #category : #accessing }
Tbl_ft_row >> ft_attinfos [
	^ ft_attinfos
]

{ #category : #accessing }
Tbl_ft_row >> ft_attinfos: arg1 [
	ft_attinfos := arg1
]

{ #category : #accessing }
Tbl_ft_row >> ft_cc [
	^ ft_cc
]

{ #category : #accessing }
Tbl_ft_row >> ft_cc: arg1 [
	ft_cc := arg1
]

{ #category : #accessing }
Tbl_ft_row >> ft_cim_id [
	^ ft_cim_id
]

{ #category : #accessing }
Tbl_ft_row >> ft_cim_id: arg1 [
	ft_cim_id := arg1
]

{ #category : #accessing }
Tbl_ft_row >> ft_clt_id [
	^ ft_clt_id
]

{ #category : #accessing }
Tbl_ft_row >> ft_clt_id: arg1 [
	ft_clt_id := arg1
]

{ #category : #accessing }
Tbl_ft_row >> ft_compta [
	^ ft_compta
]

{ #category : #accessing }
Tbl_ft_row >> ft_compta: arg1 [
	ft_compta := arg1
]

{ #category : #accessing }
Tbl_ft_row >> ft_constat [
	^ ft_constat
]

{ #category : #accessing }
Tbl_ft_row >> ft_constat: arg1 [
	ft_constat := arg1
]

{ #category : #accessing }
Tbl_ft_row >> ft_contexte [
	^ ft_contexte
]

{ #category : #accessing }
Tbl_ft_row >> ft_contexte: arg1 [
	ft_contexte := arg1
]

{ #category : #accessing }
Tbl_ft_row >> ft_createur [
	^ ft_createur
]

{ #category : #accessing }
Tbl_ft_row >> ft_createur: arg1 [
	ft_createur := arg1
]

{ #category : #accessing }
Tbl_ft_row >> ft_date_transfert [
	^ ft_date_transfert
]

{ #category : #accessing }
Tbl_ft_row >> ft_date_transfert: arg1 [
	ft_date_transfert := arg1
]

{ #category : #accessing }
Tbl_ft_row >> ft_datecrea [
	^ ft_datecrea
]

{ #category : #accessing }
Tbl_ft_row >> ft_datecrea: arg1 [
	ft_datecrea := arg1
]

{ #category : #accessing }
Tbl_ft_row >> ft_ddedevis [
	^ ft_ddedevis
]

{ #category : #accessing }
Tbl_ft_row >> ft_ddedevis: arg1 [
	ft_ddedevis := arg1
]

{ #category : #accessing }
Tbl_ft_row >> ft_delaicommentaire [
	^ ft_delaicommentaire
]

{ #category : #accessing }
Tbl_ft_row >> ft_delaicommentaire: arg1 [
	ft_delaicommentaire := arg1
]

{ #category : #accessing }
Tbl_ft_row >> ft_delaiexpir [
	^ ft_delaiexpir
]

{ #category : #accessing }
Tbl_ft_row >> ft_delaiexpir: arg1 [
	ft_delaiexpir := arg1
]

{ #category : #accessing }
Tbl_ft_row >> ft_delaiprevu [
	^ ft_delaiprevu
]

{ #category : #accessing }
Tbl_ft_row >> ft_delaiprevu: arg1 [
	ft_delaiprevu := arg1
]

{ #category : #accessing }
Tbl_ft_row >> ft_delaireel [
	^ ft_delaireel
]

{ #category : #accessing }
Tbl_ft_row >> ft_delaireel: arg1 [
	ft_delaireel := arg1
]

{ #category : #accessing }
Tbl_ft_row >> ft_delaisouhait [
	^ ft_delaisouhait
]

{ #category : #accessing }
Tbl_ft_row >> ft_delaisouhait: arg1 [
	ft_delaisouhait := arg1
]

{ #category : #accessing }
Tbl_ft_row >> ft_deplacement [
	^ ft_deplacement
]

{ #category : #accessing }
Tbl_ft_row >> ft_deplacement: arg1 [
	ft_deplacement := arg1
]

{ #category : #accessing }
Tbl_ft_row >> ft_dev_id [
	^ ft_dev_id
]

{ #category : #accessing }
Tbl_ft_row >> ft_dev_id: arg1 [
	ft_dev_id := arg1
]

{ #category : #accessing }
Tbl_ft_row >> ft_devis_id [
	^ ft_devis_id
]

{ #category : #accessing }
Tbl_ft_row >> ft_devis_id: arg1 [
	ft_devis_id := arg1
]

{ #category : #accessing }
Tbl_ft_row >> ft_dossier_list [
	^ ft_dossier_list
]

{ #category : #accessing }
Tbl_ft_row >> ft_dossier_list: arg1 [
	ft_dossier_list := arg1
]

{ #category : #accessing }
Tbl_ft_row >> ft_etat [
	^ ft_etat
]

{ #category : #accessing }
Tbl_ft_row >> ft_etat: arg1 [
	ft_etat := arg1
]

{ #category : #accessing }
Tbl_ft_row >> ft_etatcommentaire [
	^ ft_etatcommentaire
]

{ #category : #accessing }
Tbl_ft_row >> ft_etatcommentaire: arg1 [
	ft_etatcommentaire := arg1
]

{ #category : #accessing }
Tbl_ft_row >> ft_facture_id [
	^ ft_facture_id
]

{ #category : #accessing }
Tbl_ft_row >> ft_facture_id: arg1 [
	ft_facture_id := arg1
]

{ #category : #accessing }
Tbl_ft_row >> ft_hist_id [
	^ ft_hist_id
]

{ #category : #accessing }
Tbl_ft_row >> ft_hist_id: arg1 [
	ft_hist_id := arg1
]

{ #category : #accessing }
Tbl_ft_row >> ft_id [
	^ ft_id
]

{ #category : #accessing }
Tbl_ft_row >> ft_id: arg1 [
	ft_id := arg1
]

{ #category : #accessing }
Tbl_ft_row >> ft_lienft_list [
	^ ft_lienft_list
]

{ #category : #accessing }
Tbl_ft_row >> ft_lienft_list: arg1 [
	ft_lienft_list := arg1
]

{ #category : #accessing }
Tbl_ft_row >> ft_modif_id [
	^ ft_modif_id
]

{ #category : #accessing }
Tbl_ft_row >> ft_modif_id: arg1 [
	ft_modif_id := arg1
]

{ #category : #accessing }
Tbl_ft_row >> ft_nbretour [
	^ ft_nbretour
]

{ #category : #accessing }
Tbl_ft_row >> ft_nbretour: arg1 [
	ft_nbretour := arg1
]

{ #category : #accessing }
Tbl_ft_row >> ft_nbretour_test [
	^ ft_nbretour_test
]

{ #category : #accessing }
Tbl_ft_row >> ft_nbretour_test: arg1 [
	ft_nbretour_test := arg1
]

{ #category : #accessing }
Tbl_ft_row >> ft_nonlu [
	^ ft_nonlu
]

{ #category : #accessing }
Tbl_ft_row >> ft_nonlu: arg1 [
	ft_nonlu := arg1
]

{ #category : #accessing }
Tbl_ft_row >> ft_numordre [
	^ ft_numordre
]

{ #category : #accessing }
Tbl_ft_row >> ft_numordre: arg1 [
	ft_numordre := arg1
]

{ #category : #accessing }
Tbl_ft_row >> ft_objet [
	^ ft_objet
]

{ #category : #accessing }
Tbl_ft_row >> ft_objet: arg1 [
	ft_objet := arg1
]

{ #category : #accessing }
Tbl_ft_row >> ft_priorite [
	^ ft_priorite
]

{ #category : #accessing }
Tbl_ft_row >> ft_priorite: arg1 [
	ft_priorite := arg1
]

{ #category : #accessing }
Tbl_ft_row >> ft_propo [
	^ ft_propo
]

{ #category : #accessing }
Tbl_ft_row >> ft_propo: arg1 [
	ft_propo := arg1
]

{ #category : #accessing }
Tbl_ft_row >> ft_refclt [
	^ ft_refclt
]

{ #category : #accessing }
Tbl_ft_row >> ft_refclt: arg1 [
	ft_refclt := arg1
]

{ #category : #accessing }
Tbl_ft_row >> ft_resultsouhait [
	^ ft_resultsouhait
]

{ #category : #accessing }
Tbl_ft_row >> ft_resultsouhait: arg1 [
	ft_resultsouhait := arg1
]

{ #category : #accessing }
Tbl_ft_row >> ft_sous_categorie_id [
	^ ft_sous_categorie_id
]

{ #category : #accessing }
Tbl_ft_row >> ft_sous_categorie_id: arg1 [
	ft_sous_categorie_id := arg1
]

{ #category : #accessing }
Tbl_ft_row >> ft_test [
	^ ft_test
]

{ #category : #accessing }
Tbl_ft_row >> ft_test: arg1 [
	ft_test := arg1
]

{ #category : #accessing }
Tbl_ft_row >> ft_test_id [
	^ ft_test_id
]

{ #category : #accessing }
Tbl_ft_row >> ft_test_id: arg1 [
	ft_test_id := arg1
]

{ #category : #accessing }
Tbl_ft_row >> ft_theme_id [
	^ ft_theme_id
]

{ #category : #accessing }
Tbl_ft_row >> ft_theme_id: arg1 [
	ft_theme_id := arg1
]

{ #category : #accessing }
Tbl_ft_row >> ft_tnr [
	^ ft_tnr
]

{ #category : #accessing }
Tbl_ft_row >> ft_tnr: arg1 [
	ft_tnr := arg1
]

{ #category : #accessing }
Tbl_ft_row >> ft_typcorr_id [
	^ ft_typcorr_id
]

{ #category : #accessing }
Tbl_ft_row >> ft_typcorr_id: arg1 [
	ft_typcorr_id := arg1
]

{ #category : #accessing }
Tbl_ft_row >> ft_type [
	^ ft_type
]

{ #category : #accessing }
Tbl_ft_row >> ft_type: arg1 [
	ft_type := arg1
]

{ #category : #accessing }
Tbl_ft_row >> ft_version_id [
	^ ft_version_id
]

{ #category : #accessing }
Tbl_ft_row >> ft_version_id: arg1 [
	ft_version_id := arg1
]

{ #category : #accessing }
Tbl_ft_row >> ft_version_news [
	^ ft_version_news
]

{ #category : #accessing }
Tbl_ft_row >> ft_version_news: arg1 [
	ft_version_news := arg1
]

{ #category : #accessing }
Tbl_ft_row >> ft_version_souhait [
	^ ft_version_souhait
]

{ #category : #accessing }
Tbl_ft_row >> ft_version_souhait: arg1 [
	ft_version_souhait := arg1
]

{ #category : #initialization }
Tbl_ft_row >> initialize [
	associatedPhysiqueFiles := Set new
]

{ #category : #initialization }
Tbl_ft_row >> initializeWith: arg1 [
	super initializeWith: arg1.
	ft_datecrea ifNil: [ ^ self ].
	ft_datecrea := ft_datecrea asDate
]

{ #category : #testing }
Tbl_ft_row >> isBug [
	^ self typeCorrection isBug
]

{ #category : #testing }
Tbl_ft_row >> isEvolution [
	^ self typeCorrection isEvolution
]

{ #category : #testing }
Tbl_ft_row >> isMisc [
	^ self typeCorrection isMisc
]

{ #category : #utilities }
Tbl_ft_row >> joinBibsToTicket: aCollection [
	self
		bibliotheques:
			(aCollection select: [ :bib | self ft_modif_id = bib biblio_modif_id ])
]

{ #category : #utilities }
Tbl_ft_row >> joinDevToTicket: aCollection [
	self
		dev:
			(aCollection
				detect: [ :aDev | aDev dev_id = self ft_dev_id ]
				ifNone: [ nil ])
]

{ #category : #utilites }
Tbl_ft_row >> joinTpsDevToTicket: aCollection [
	self
		timeDev: (aCollection select: [ :aTps | aTps tps_dev_id = self ft_dev_id ])
]

{ #category : #utilities }
Tbl_ft_row >> joinTypeCorrectionToTicket: aCollection [
	self
		typeCorrection:
			(aCollection
				detect: [ :aTypeCorrection | aTypeCorrection typcorr_id = self ft_typcorr_id ]
				ifNone: [ nil ])
]

{ #category : #utilities }
Tbl_ft_row >> joinVersionsToTicket: aCollection [
	self
		versions:
			(aCollection
				select: [ :version | self ft_version_id = version version_id ])
]

{ #category : #API }
Tbl_ft_row >> keepInterestingBibliotheques [
	^ bibliotheques select: #isInterestingBibliotheque
]

{ #category : #accessing }
Tbl_ft_row >> modules [
	^ modules
]

{ #category : #accessing }
Tbl_ft_row >> modulesFromAssociatedFile [
	^ modulesFromAssociatedFile
]

{ #category : #accessing }
Tbl_ft_row >> month [
	^ ft_datecrea month
]

{ #category : #API }
Tbl_ft_row >> monthClosing [
	^ self dev monthClosing
]

{ #category : #API }
Tbl_ft_row >> monthCreation [
	^ self ft_datecrea month
]

{ #category : #API }
Tbl_ft_row >> numberOfBibliotheques [
	^ bibliotheques size
]

{ #category : #initialization }
Tbl_ft_row >> setModules [
	modules := Set new.
	bibliotheques
		do: [ :bib | 
			bib setModules.
			modules addAll: bib modules ].
	^ modules
]

{ #category : #accessing }
Tbl_ft_row >> timeDev [
	^ timeDev
]

{ #category : #accessing }
Tbl_ft_row >> timeDev: anObject [
	timeDev := anObject
]

{ #category : #accessing }
Tbl_ft_row >> totalTps [
	^ dev dev_tps_total
]

{ #category : #API }
Tbl_ft_row >> tpsEstim [
	^ dev dev_tps_estim
]

{ #category : #accessing }
Tbl_ft_row >> typeCorrection [
	^ typeCorrection
]

{ #category : #accessing }
Tbl_ft_row >> typeCorrection: anObject [
	typeCorrection := anObject
]

{ #category : #API }
Tbl_ft_row >> updateBibliothequesWith: aCollection [
	self
		bibliotheques: (aCollection select: [ :bib | bib biblio_modif_id = ft_modif_id ])
]

{ #category : #API }
Tbl_ft_row >> updateDevWith: aCollection [
	self
		dev: (aCollection select: [ :aDev | aDev dev_cim_id = ft_dev_id ])
]

{ #category : #accessing }
Tbl_ft_row >> versions [
	^ versions
]

{ #category : #accessing }
Tbl_ft_row >> versions: anObject [
	versions := anObject
]

{ #category : #accessing }
Tbl_ft_row >> year [
	^ self ft_datecrea year
]
