Class {
	#name : #CIMAbstractModelTest,
	#superclass : #TestCase,
	#instVars : [
		'bibliotheques',
		'tickets',
		'tps',
		'typeSessions',
		'devs',
		'typeCorrs',
		'versions',
		'tests',
		'modules',
		'retours',
		'typeRetours',
		'testDb'
	],
	#category : #CIMTicketsAnalyseTest
}

{ #category : #running }
CIMAbstractModelTest >> createBibliotheques [
	bibliotheques := Tbl_biblio new
		rows:
			(STONReader
				on:
					'OrderedCollection[Tbl_biblio_row{#biblio_id:''366 201'',#biblio_nom:''vue_fiche_test.asp'',#biblio_old:''79'',#biblio_new:''80'',#biblio_date:''2008-09-10'',#biblio_niveau:''1'',#biblio_modif_id:''280 821'',#biblio_version_id:''1'',#biblio_old_str:'''',#biblio_new_str:'''',#tickets:Tbl_ft_row{#ft_id:''361 521'',#ft_numordre:''33799'',#ft_refclt:''INFOGERANCE du 21/08/2008'',#ft_datecrea:Date[''2008-08-21''],#ft_priorite:''2'',#ft_test:''1'',#ft_type:''2'',#ft_etat:''12'',#ft_objet:''Nom du bordereau NET101 non correct.'',#ft_constat:''Après vérifications des bordereaux du flux pdf, un bordereau BL100, qui a été créé le 20/08/2008, est en réalité un bordereau NET101. <br>\nVoir &quot;Fiche Incident 33799&quot; ci-jointe.'',#ft_version_id:''15 521'',#ft_resultsouhait:''Le bordereau NET101 doit avoir un nom de fichier pdf correspondant au NET101 et non au BL100.'',#ft_ddedevis:''0'',#ft_delaisouhait:'''',#ft_delaicommentaire:'''',#ft_cc:'''',#ft_facture_id:''1'',#ft_devis_id:''1'',#ft_modif_id:''280 821'',#ft_cim_id:''361'',#ft_clt_id:''1 002'',#ft_theme_id:''54'',#ft_dev_id:''326 881'',#ft_test_id:''104 041'',#ft_nonlu:'',,,1,,1,cim2781,cim36,cim361,cim2081,cim27,'',#ft_hist_id:''1'',#ft_contexte:'''',#ft_nbretour:''2'',#ft_attinfos:''0'',#ft_version_souhait:''15 681'',#ft_deplacement:'''',#ft_typcorr_id:''4'',#ft_compta:''0'',#ft_createur:''1 221'',#dev:Tbl_dev_row{#dev_id:''326 881'',#dev_fin:''2008-09-26'',#dev_tps_total:Duration{#nanos:0,#seconds:10200},#dev_tps_clt:''//00//02//50//'',#dev_tps_estim:Duration{#nanos:0,#seconds:16200},#dev_valid_greg:''1'',#dev_semaine_id:''1 161'',#dev_cim_id:''1 101'',#dev_tps_fact:''//00//02//50//'',#dev_typ_fact:''0'',#dev_com_cim:'''',#dev_com_clt:'''',#dev_semaine_clt:''1 162'',#dev_total:''AN//00//05//30//'',#dev_total_clt:''AN//00//05//30//'',#dev_total_fact:''AN//00//05//30//'',#dev_comm_estim:'''',#dev_tps_requis:''//00//04//30//'',#dev_comm_tps_requis:''Recopie automatique de l’estimation'',#dev_ordre:''50''},#typeCorrection:Tbl_type_correction_row{#typcorr_id:''4'',#typcorr_libelle:''CORRECTION'',#typcorr_actif:''0''},#bibliotheques:OrderedCollection[@2,Tbl_biblio_row{#biblio_id:''366 221'',#biblio_nom:''cwm_xxx_dw_3'',#biblio_old:''76'',#biblio_new:''77'',#biblio_date:''2008-09-10'',#biblio_niveau:''1'',#biblio_modif_id:''280 821'',#biblio_version_id:''1'',#biblio_old_str:'''',#biblio_new_str:'''',#tickets:@3},Tbl_biblio_row{#biblio_id:''366 241'',#biblio_nom:''cwm_xxx_dw_3'',#biblio_old:''82'',#biblio_new:''83'',#biblio_date:''2008-09-10'',#biblio_niveau:''1'',#biblio_modif_id:''280 821'',#biblio_version_id:''1'',#biblio_old_str:'''',#biblio_new_str:'''',#tickets:@3},Tbl_biblio_row{#biblio_id:''363 181'',#biblio_nom:''cwm_xxx_dw_3'',#biblio_old:''78'',#biblio_new:''79'',#biblio_date:''2008-09-02'',#biblio_niveau:''1'',#biblio_modif_id:''280 821'',#biblio_version_id:''1'',#biblio_old_str:'''',#biblio_new_str:'''',#tickets:@3},Tbl_biblio_row{#biblio_id:''364 941'',#biblio_nom:''cwm_xxx_dw_3'',#biblio_old:''75'',#biblio_new:''76'',#biblio_date:''2008-09-05'',#biblio_niveau:''1'',#biblio_modif_id:''280 821'',#biblio_version_id:''1'',#biblio_old_str:'''',#biblio_new_str:'''',#tickets:@3},Tbl_biblio_row{#biblio_id:''364 961'',#biblio_nom:''cwm_xxx_dw_3'',#biblio_old:''81'',#biblio_new:''82'',#biblio_date:''2008-09-05'',#biblio_niveau:''1'',#biblio_modif_id:''280 821'',#biblio_version_id:''1'',#biblio_old_str:'''',#biblio_new_str:'''',#tickets:@3},Tbl_biblio_row{#biblio_id:''371 601'',#biblio_nom:''cwm_brd'',#biblio_old:''171'',#biblio_new:''172'',#biblio_date:''2008-09-26'',#biblio_niveau:''1'',#biblio_modif_id:''280 821'',#biblio_version_id:''14 341'',#tickets:@3},Tbl_biblio_row{#biblio_id:''371 621'',#biblio_nom:''cwm_brd'',#biblio_old:''169'',#biblio_new:''170'',#biblio_date:''2008-09-26'',#biblio_niveau:''1'',#biblio_modif_id:''280 821'',#biblio_version_id:''15 681'',#tickets:@3},Tbl_biblio_row{#biblio_id:''371 641'',#biblio_nom:''cwm_brd'',#biblio_old:''169'',#biblio_new:''170'',#biblio_date:''2008-09-26'',#biblio_niveau:''1'',#biblio_modif_id:''280 821'',#biblio_version_id:''15 781'',#tickets:@3}],#timeDev:OrderedCollection[Tbl_tps_row{#tps_id:''1 423 361'',#tps_temps:Duration{#nanos:0,#seconds:2100},#tps_date:''2008-08-21'',#tps_commentaire:'''',#tps_order:''1'',#tps_cim_id:''361'',#tps_dev_id:''326 881'',#tps_test_id:''21'',#tps_type:''2''},Tbl_tps_row{#tps_id:''1 424 241'',#tps_temps:Duration{#nanos:0,#seconds:600},#tps_date:''2008-08-21'',#tps_commentaire:'''',#tps_order:''2'',#tps_cim_id:''1 041'',#tps_dev_id:''326 881'',#tps_type:''2''},Tbl_tps_row{#tps_id:''1 432 781'',#tps_temps:Duration{#nanos:0,#seconds:300},#tps_date:''2008-08-26'',#tps_commentaire:'''',#tps_order:''3'',#tps_cim_id:''1 101'',#tps_dev_id:''326 881'',#tps_type:''2''},Tbl_tps_row{#tps_id:''1 446 321'',#tps_temps:Duration{#nanos:0,#seconds:1800},#tps_date:''2008-09-02'',#tps_commentaire:'''',#tps_order:''4'',#tps_cim_id:''1 101'',#tps_dev_id:''326 881'',#tps_type:''2''},Tbl_tps_row{#tps_id:''1 446 661'',#tps_temps:Duration{#nanos:0,#seconds:2700},#tps_date:''2008-09-02'',#tps_commentaire:'''',#tps_order:''5'',#tps_cim_id:''1 101'',#tps_dev_id:''326 881'',#tps_type:''0''},Tbl_tps_row{#tps_id:''1 446 701'',#tps_temps:Duration{#nanos:0,#seconds:900},#tps_date:''2008-09-02'',#tps_commentaire:'''',#tps_order:''6'',#tps_cim_id:''1 101'',#tps_dev_id:''326 881'',#tps_type:''1''},Tbl_tps_row{#tps_id:''1 455 222'',#tps_temps:Duration{#nanos:0,#seconds:600},#tps_date:''2008-09-04'',#tps_commentaire:'''',#tps_order:''7'',#tps_cim_id:''361'',#tps_dev_id:''326 881'',#tps_test_id:''21'',#tps_type:''2''},Tbl_tps_row{#tps_id:''1 456 481'',#tps_temps:Duration{#nanos:0,#seconds:1200},#tps_date:''2008-09-05'',#tps_commentaire:'''',#tps_order:''8'',#tps_cim_id:''1 101'',#tps_dev_id:''326 881'',#tps_type:''0''},Tbl_tps_row{#tps_id:''1 464 901'',#tps_temps:Duration{#nanos:0,#seconds:900},#tps_date:''2008-09-10'',#tps_commentaire:'''',#tps_order:''9'',#tps_cim_id:''1 103'',#tps_dev_id:''326 881'',#tps_type:''2''},Tbl_tps_row{#tps_id:''1 465 581'',#tps_temps:Duration{#nanos:0,#seconds:900},#tps_date:''2008-09-10'',#tps_commentaire:'''',#tps_order:''10'',#tps_cim_id:''1 121'',#tps_dev_id:''326 881'',#tps_test_id:''21'',#tps_type:''2''},Tbl_tps_row{#tps_id:''1 471 053'',#tps_temps:Duration{#nanos:0,#seconds:600},#tps_date:''2008-09-12'',#tps_commentaire:'''',#tps_order:''11'',#tps_cim_id:''1 101'',#tps_dev_id:''326 881'',#tps_type:''2''},Tbl_tps_row{#tps_id:''1 500 599'',#tps_temps:Duration{#nanos:0,#seconds:7200},#tps_date:''2008-09-25'',#tps_commentaire:'''',#tps_order:''12'',#tps_cim_id:''1 101'',#tps_dev_id:''326 881'',#tps_type:''2''},Tbl_tps_row{#tps_id:''1 501 301'',#tps_temps:Duration{#nanos:0,#seconds:1200},#tps_date:''2008-09-25'',#tps_commentaire:'''',#tps_order:''13'',#tps_cim_id:''1 101'',#tps_dev_id:''326 881'',#tps_type:''0''},Tbl_tps_row{#tps_id:''1 501 321'',#tps_temps:Duration{#nanos:0,#seconds:1800},#tps_date:''2008-09-25'',#tps_commentaire:'''',#tps_order:''14'',#tps_cim_id:''1 101'',#tps_dev_id:''326 881'',#tps_type:''1''},Tbl_tps_row{#tps_id:''1 502 021'',#tps_temps:Duration{#nanos:0,#seconds:1200},#tps_date:''2008-09-25'',#tps_commentaire:'''',#tps_order:''15'',#tps_cim_id:''1 101'',#tps_dev_id:''326 881'',#tps_type:''2''},Tbl_tps_row{#tps_id:''1 503 221'',#tps_temps:Duration{#nanos:0,#seconds:3600},#tps_date:''2008-09-26'',#tps_commentaire:'''',#tps_order:''16'',#tps_cim_id:''1 101'',#tps_dev_id:''326 881'',#tps_type:''2''},Tbl_tps_row{#tps_id:''1 503 241'',#tps_temps:Duration{#nanos:0,#seconds:1200},#tps_date:''2008-09-26'',#tps_commentaire:'''',#tps_order:''17'',#tps_cim_id:''1 101'',#tps_dev_id:''326 881'',#tps_type:''0''},Tbl_tps_row{#tps_id:''1 503 261'',#tps_temps:Duration{#nanos:0,#seconds:1200},#tps_date:''2008-09-26'',#tps_commentaire:'''',#tps_order:''18'',#tps_cim_id:''1 101'',#tps_dev_id:''326 881'',#tps_type:''1''}]}},@10,@11,Tbl_biblio_row{#biblio_id:''366 261'',#biblio_nom:''cwm_cot_uo'',#biblio_old:''1 001'',#biblio_new:''1 002'',#biblio_date:''2008-09-10'',#biblio_niveau:''1'',#biblio_modif_id:''281 341'',#biblio_version_id:''14 341'',#tickets:Tbl_ft_row{#ft_id:''362 661'',#ft_numordre:''33863'',#ft_refclt:''Anomalie sur génération BAC GP300 2T08'',#ft_datecrea:Date[''2008-08-26''],#ft_priorite:''2'',#ft_test:''1'',#ft_type:''1'',#ft_etat:''12'',#ft_objet:''Anomalie sur génération BAC GP300 2T08'',#ft_constat:''Bonjour,<br>\nNous avons constaté des anomalies lors de la génération des bordereaux d&rsquo;appel de cotisations santé du 2T2008 (BC 416).<br>\nLes lignes concernant la déclaration de la masse salariale et le forfait maladie apparaissent en double. Les taux ont été également multiplié par 2.<br>\n<br>\nVoici la liste des pharmacies concernées:<br>\n- Selas La Rosa : E050089<br>\n- Pharmacie du Sud : E050845<br>\n- Pharmacie de l&rsquo;Océan : E016809<br>\n- Pharmacie des Arums : E050200<br>\n<br>\nCette liste n&rsquo;est pas définitive car nous n&rsquo;avons pas eu en retour tous les BAC.<br>\n<br>\nBonne réception,<br>\nGaëlle Chow Cheuk'',#ft_version_id:''14 681'',#ft_resultsouhait:'''',#ft_ddedevis:''0'',#ft_delaisouhait:'''',#ft_delaicommentaire:'''',#ft_facture_id:''1'',#ft_devis_id:''1'',#ft_modif_id:''281 341'',#ft_cim_id:''282'',#ft_clt_id:''3 701'',#ft_theme_id:''181'',#ft_dev_id:''328 121'',#ft_test_id:''104 281'',#ft_nonlu:'',,,,,cim701,cim27,'',#ft_hist_id:''1'',#ft_contexte:'''',#ft_nbretour:''0'',#ft_attinfos:''0'',#ft_version_news:''1'',#ft_version_souhait:''1'',#ft_typcorr_id:''4'',#ft_date_transfert:''2008-08-26'',#ft_createur:''1 101'',#dev:Tbl_dev_row{#dev_id:''328 121'',#dev_fin:''2008-09-10'',#dev_tps_total:Duration{#nanos:0,#seconds:21300},#dev_tps_clt:''//00//05//55//'',#dev_tps_estim:'''',#dev_valid_greg:''0'',#dev_semaine_id:''1 161'',#dev_cim_id:''61'',#dev_tps_fact:''//00//05//55//'',#dev_typ_fact:''0'',#dev_com_cim:'''',#dev_com_clt:'''',#dev_semaine_clt:''1 150'',#dev_total:''AN//01//03//50//'',#dev_total_clt:''AN//01//03//50//'',#dev_total_fact:''AN//01//03//50//'',#dev_ordre:''60''},#typeCorrection:@8,#bibliotheques:OrderedCollection[@55,Tbl_biblio_row{#biblio_id:''366 281'',#biblio_nom:''cwm_cot_uo'',#biblio_old:''953'',#biblio_new:''954'',#biblio_date:''2008-09-10'',#biblio_niveau:''1'',#biblio_modif_id:''281 341'',#biblio_version_id:''15 781'',#tickets:@56},Tbl_biblio_row{#biblio_id:''366 301'',#biblio_nom:''cwm_cot_uo'',#biblio_old:''867'',#biblio_new:''868'',#biblio_date:''2008-09-10'',#biblio_niveau:''1'',#biblio_modif_id:''281 341'',#biblio_version_id:''15 581'',#tickets:@56},Tbl_biblio_row{#biblio_id:''364 321'',#biblio_nom:''cwm_cot_uo'',#biblio_old:''996'',#biblio_new:''997'',#biblio_date:''2008-09-04'',#biblio_niveau:''1'',#biblio_modif_id:''281 341'',#biblio_version_id:''14 341'',#tickets:@56},Tbl_biblio_row{#biblio_id:''364 322'',#biblio_nom:''cwm_cot_uo'',#biblio_old:''950'',#biblio_new:''951'',#biblio_date:''2008-09-04'',#biblio_niveau:''1'',#biblio_modif_id:''281 341'',#biblio_version_id:''15 661'',#tickets:@56},Tbl_biblio_row{#biblio_id:''364 323'',#biblio_nom:''cwm_cot_uo'',#biblio_old:''864'',#biblio_new:''865'',#biblio_date:''2008-09-04'',#biblio_niveau:''1'',#biblio_modif_id:''281 341'',#biblio_version_id:''15 581'',#tickets:@56}],#timeDev:OrderedCollection[Tbl_tps_row{#tps_id:''1 433 566'',#tps_temps:Duration{#nanos:0,#seconds:3600},#tps_date:''2008-08-26'',#tps_commentaire:'''',#tps_order:''1'',#tps_cim_id:''801'',#tps_dev_id:''328 121'',#tps_test_id:''21'',#tps_type:''2''},Tbl_tps_row{#tps_id:''1 439 089'',#tps_temps:Duration{#nanos:0,#seconds:300},#tps_date:''2008-08-28'',#tps_commentaire:'''',#tps_order:''2'',#tps_cim_id:''801'',#tps_dev_id:''328 121'',#tps_test_id:''21'',#tps_type:''2''},Tbl_tps_row{#tps_id:''1 440 101'',#tps_temps:Duration{#nanos:0,#seconds:1800},#tps_date:''2008-08-28'',#tps_commentaire:'''',#tps_order:''3'',#tps_cim_id:''30'',#tps_dev_id:''328 121'',#tps_type:''2''},Tbl_tps_row{#tps_id:''1 447 901'',#tps_temps:Duration{#nanos:0,#seconds:3600},#tps_date:''2008-09-02'',#tps_commentaire:'''',#tps_order:''4'',#tps_cim_id:''801'',#tps_dev_id:''328 121'',#tps_test_id:''21'',#tps_type:''2''},Tbl_tps_row{#tps_id:''1 452 221'',#tps_temps:Duration{#nanos:0,#seconds:14700},#tps_date:''2008-09-03'',#tps_commentaire:'''',#tps_order:''5'',#tps_cim_id:''61'',#tps_dev_id:''328 121'',#tps_type:''2''},Tbl_tps_row{#tps_id:''1 453 041'',#tps_temps:Duration{#nanos:0,#seconds:7200},#tps_date:''2008-09-04'',#tps_commentaire:'''',#tps_order:''6'',#tps_cim_id:''61'',#tps_dev_id:''328 121'',#tps_type:''2''},Tbl_tps_row{#tps_id:''1 453 421'',#tps_temps:Duration{#nanos:0,#seconds:7800},#tps_date:''2008-09-04'',#tps_commentaire:'''',#tps_order:''7'',#tps_cim_id:''61'',#tps_dev_id:''328 121'',#tps_type:''0''},Tbl_tps_row{#tps_id:''1 453 607'',#tps_temps:Duration{#nanos:0,#seconds:3600},#tps_date:''2008-09-04'',#tps_commentaire:'''',#tps_order:''8'',#tps_cim_id:''61'',#tps_dev_id:''328 121'',#tps_type:''1''},Tbl_tps_row{#tps_id:''1 460 548'',#tps_temps:Duration{#nanos:0,#seconds:10800},#tps_date:''2008-09-08'',#tps_commentaire:'''',#tps_order:''9'',#tps_cim_id:''61'',#tps_dev_id:''328 121'',#tps_type:''2''},Tbl_tps_row{#tps_id:''1 460 549'',#tps_temps:Duration{#nanos:0,#seconds:3000},#tps_date:''2008-09-08'',#tps_commentaire:'''',#tps_order:''10'',#tps_cim_id:''61'',#tps_dev_id:''328 121'',#tps_type:''0''},Tbl_tps_row{#tps_id:''1 464 781'',#tps_temps:Duration{#nanos:0,#seconds:600},#tps_date:''2008-09-10'',#tps_commentaire:'''',#tps_order:''11'',#tps_cim_id:''61'',#tps_dev_id:''328 121'',#tps_type:''2''},Tbl_tps_row{#tps_id:''1 464 821'',#tps_temps:Duration{#nanos:0,#seconds:5400},#tps_date:''2008-09-10'',#tps_commentaire:'''',#tps_order:''12'',#tps_cim_id:''61'',#tps_dev_id:''328 121'',#tps_type:''0''},Tbl_tps_row{#tps_id:''1 464 941'',#tps_temps:Duration{#nanos:0,#seconds:1500},#tps_date:''2008-09-10'',#tps_commentaire:'''',#tps_order:''13'',#tps_cim_id:''61'',#tps_dev_id:''328 121'',#tps_type:''1''}]}}]'
						readStream) next.
	testDb tbl_biblio: bibliotheques
]

{ #category : #'as yet unclassified' }
CIMAbstractModelTest >> createTestDb [
	testDb := CIMDatabase new
]

{ #category : #running }
CIMAbstractModelTest >> createTestDevs [
	devs := Tbl_dev new
		rows:
			{(Tbl_dev_row new
				dev_id: '1';
				yourself).
			(Tbl_dev_row new
				dev_id: '2';
				yourself).
			(Tbl_dev_row new
				dev_id: '3';
				yourself).
			(Tbl_dev_row new
				dev_id: '4';
				yourself)} asOrderedCollection.
	testDb tbl_dev: devs
]

{ #category : #running }
CIMAbstractModelTest >> createTestModule [
	modules := Tbl_Module new
		database: testDb;
		rows:
			{(Tbl_Module_row new nom: 'Prestation').
			(Tbl_Module_row new nom: 'Bordereau').
			(Tbl_Module_row new nom: 'Cotisation')} asOrderedCollection.
	testDb tbl_module: modules
]

{ #category : #running }
CIMAbstractModelTest >> createTestRetour [
	retours := Tbl_retour new
		rows:
			{(Tbl_retour_row new
				retour_id: '1';
				cc_type_retour_id: '2';
				dev_type_retour_id: '1';
				ft_id: '123456').
			(Tbl_retour_row new
				retour_id: '2';
				ft_id: '123456').
			(Tbl_retour_row new
				retour_id: '3';
				ft_id: '214')} asOrderedCollection.
	testDb tbl_retour: retours
]

{ #category : #running }
CIMAbstractModelTest >> createTestTest [
	tests := Tbl_test new
		rows:
			{(Tbl_test_row new test_id: '0').
			(Tbl_test_row new test_id: '1').
			(Tbl_test_row new test_id: '2')} asOrderedCollection.
	testDb tbl_test: tests
]

{ #category : #running }
CIMAbstractModelTest >> createTestTickets [
	tickets := Tbl_ft new
		rows:
			{(Tbl_ft_row new
				ft_id: '214' , (Character value: 160) asString , '778';
				ft_lienft_list: '123456,789456';
				ft_dev_id: '1';
				ft_typcorr_id: '4';
				ft_modif_id: '280 821';
				ft_version_id: '8';
				ft_test_id: '0';
				ft_nbretour: '1';
				ft_datecrea: (Date fromString: '10/15/2007');
				yourself).
			(Tbl_ft_row new
				ft_id: '123456';
				ft_dev_id: '2';
				ft_typcorr_id: '2';
				ft_modif_id: '281 341';
				ft_version_id: '1';
				ft_test_id: '1';
				ft_datecrea: (Date fromString: '05/20/2019');
				yourself).
			(Tbl_ft_row new
				ft_id: '789' , (Character value: 160) asString , '456';
				ft_typcorr_id: '3';
				ft_dev_id: '4';
				ft_test_id: '2';
				ft_nbretour: '2';
				ft_datecrea: (Date fromString: '10/15/2012');
				yourself)} asOrderedCollection.
	testDb tbl_ft: tickets
]

{ #category : #running }
CIMAbstractModelTest >> createTestTps [
	tps := Tbl_tps new
		rows:
			{(Tbl_tps_row new
				tps_dev_id: '1';
				tps_type: '1';
				tps_test_id: '1').
			(Tbl_tps_row new
				tps_dev_id: '2';
				tps_type: '1';
				tps_test_id: '2').
			(Tbl_tps_row new
				tps_dev_id: '3';
				tps_type: '2';
				tps_test_id: '0').
			(Tbl_tps_row new
				tps_dev_id: '4';
				tps_type: '3').
			(Tbl_tps_row new
				tps_dev_id: '2';
				tps_type: '2').
			(Tbl_tps_row new
				tps_dev_id: '1';
				tps_type: '4')} asOrderedCollection.
	testDb tbl_tps: tps
]

{ #category : #running }
CIMAbstractModelTest >> createTestTypCorrs [
	typeCorrs := Tbl_type_correction new
		rows:
			{(Tbl_type_correction_row new
				typcorr_id: '1';
				yourself).
			(Tbl_type_correction_row new
				typcorr_id: '2';
				yourself).
			(Tbl_type_correction_row new
				typcorr_id: '3';
				yourself).
			(Tbl_type_correction_row new
				typcorr_id: '4';
				yourself)} asOrderedCollection.
	testDb tbl_type_correction: typeCorrs
]

{ #category : #running }
CIMAbstractModelTest >> createTestTypeRetour [
	typeRetours := Tbl_type_retour new
		rows:
			{(Tbl_type_retour_row new
				type_retour_id: '1';
				libelle: 'Fiche incomplète').
			(Tbl_type_retour_row new
				type_retour_id: '2';
				libelle: 'Anomalie sur le développement').
			(Tbl_type_retour_row new
				type_retour_id: '3';
				libelle: 'Bug sans lien avec la fiche')} asOrderedCollection.
	testDb tbl_type_retour: typeRetours
]

{ #category : #running }
CIMAbstractModelTest >> createTestTypeSessions [
	typeSessions := Tbl_type_session new
		rows:
			{(Tbl_type_session_row new
				typsession_id: 1;
				typsession_type: 0;
				typsession_code: 'TD').
			(Tbl_type_session_row new
				typsession_id: 2;
				typsession_type: 0;
				typsession_code: 'DV').
			(Tbl_type_session_row new
				typsession_id: 3;
				typsession_type: 1;
				typsession_code: 'TS').
			(Tbl_type_session_row new

				typsession_id: 4;
				typsession_type: 0;
				typsession_code: '')} asOrderedCollection.

	testDb tbl_type_session: typeSessions

]

{ #category : #running }
CIMAbstractModelTest >> createTestVersions [
	versions := Tbl_version new
		rows:
			{(Tbl_version_row new
				version_id: '1';
				yourself).
			(Tbl_version_row new
				version_id: '2';
				yourself).
			(Tbl_version_row new
				version_id: '3';
				yourself).
			(Tbl_version_row new
				version_id: '4';
				yourself)} asOrderedCollection.
	testDb tbl_version: versions
]

{ #category : #running }
CIMAbstractModelTest >> setUp [
	self createTestDb.
	self createBibliotheques.
	self createTestTickets.
	self createTestTps.
	self createTestTypeSessions.
	self createTestDevs.
	self createTestTypCorrs.
	self createTestVersions.
	self createTestTest.
	self createTestModule.
	self createTestRetour.
	self createTestTypeRetour
]
