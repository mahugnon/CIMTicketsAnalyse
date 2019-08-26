Class {
	#name : #'Tbl_Module',
	#superclass : #Tbl,
	#category : #'CIMTicketsDataModel-Model'
}

{ #category : #api }
Tbl_Module >> allModules [
	^ {('408' -> #('cwm_noe_irm.pbl.src')).
	('AideSocial'
		-> #('cwm_soc.pbl.src' 'cwm_soc_dw.pbl.src' 'cwm_soc_uo.pbl.src')).
	('Datawarehouse'
		-> #('cwm_dwh.pbl.src' 'cwm_dwh_dw.pbl.src' 'cwm_dwh_uo.pbl.src')).
	('Bordereau'
		->
			#('cwm_brd_dw_1.pbl.src' 'Cwm_brd.pbl.src' 'cwm_brd_dw_2.pbl.src' 'cwm_brd_uo.pbl.src' 'cwm_xxx_dw.pbl.src' 'cwm_xxx_dw_2.pbl.src' 'cwm_xxx_dw_3.pbl.src')).
	('CartierPayant'
		-> #('cwm_tpy.pbl.src' 'cwm_tpy_dw.pbl.src' 'cwm_tpy_uo.pbl.src')).
	('Commun'
		->
			#('cwm_abc.pbl.src' 'cwm_abc_dw.pbl.src' 'cwm_abc_uo.pbl.src' 'Cwm_app.pbl.src' 'cwm_app_dw.pbl.src' 'cwm_ctr_dw_1.pbl.src' 'cwm_ctr_dw_2.pbl.src' 'cwm_ctr_uo.pbl.src' 'Cwm_fdb.pbl.src' 'Cwm_ctr.pbl.src' 'cwm_gui.pbl.src' 'cwm_mdb.pbl.src' 'Cwm_org.pbl.src' 'cwm_org_dw.pbl.src' 'cwm_org_uo.pbl.src' 'cwm_output.pbl.src' 'cwm_par.pbl.src' 'Cwm_par_dw.pbl.src' 'cwm_par_uo.pbl.src' 'Cwm_prt.pbl.src' 'cwm_prt_dw.pbl.src' 'cwm_prt_uo.pbl.src' 'Cwm_req.pbl.src' 'cwm_res.pbl.src' 'cwm_res_dw.pbl.src' 'cwm_res_uo.pbl.src' 'cwm_tmp.pbl.src' 'cwm_tmp_dw.pbl.src' 'cwm_tmp_uo.pbl.src' 'cwm_tool.pbl.src' 'cwm_tools_dev.pbl.src' 'cwm_tool_dw.pbl.src' 'cwm_tool_uo.pbl.src' 'Cwm_trs.pbl.src' 'cwm_trs_dw.pbl.src' 'cwm_trs_uo.pbl.src' 'Cwm_trt.pbl.src' 'cwm_trt_dw.pbl.src' 'cwm_trt_uo.pbl.src')).
	('Comptabilite'
		->
			#('Cwm_cpt.pbl.src' 'cwm_cpt_dw_1.pbl.src' 'cwm_cpt_dw_2.pbl.src' 'cwm_cpt_dw_3.pbl.src' 'cwm_cpt_dw_4.pbl.src' 'cwm_cpt_uo.pbl.src')).
	('Cotisation'
		->
			#('Cwm_cot.pbl.src' 'Cwm_cot_dw_1.pbl.src' 'cwm_cot_dw_2.pbl.src' 'Cwm_cot_dw_3.pbl.src' 'cwm_cot_uo.pbl.src' 'Cwm_pai.pbl.src' 'Cwm_pai_dw.pbl.src' 'cwm_pai_uo.pbl.src')).
	('GED' -> #('cwm_corb.pbl.src')).
	('ImportExport'
		->
			#('cwm_noe_irm.pbl.src' 'cwm_txt.pbl.src' 'Cwm_txt_dw.pbl.src' 'Cwm_txt_uo.pbl.src')).
	('MutCIM.net'
		->
			#('cwm_ctr_dw_2.pbl.src' 'cwm_net.pbl.src' 'cwm_net_dw.pbl.src' 'cwm_net_uo.pbl.src')).
	('Prestation'
		->
			#('Cwm_edi.pbl.src' 'cwm_edi_dw.pbl.src' 'cwm_edi_uo.pbl.src' 'cwm_exp.pbl.src' 'cwm_exp_dw.pbl.src' 'cwm_exp_uo.pbl.src' 'Cwm_liq.pbl.src' 'cwm_liq_2.pbl.src' 'Cwm_liq_dw_1.pbl.src' 'cwm_liq_dw_2.pbl.src' 'cwm_liq_maj.pbl.src' 'cwm_liq_uo.pbl.src' 'Cwm_noe.pbl.src' 'cwm_noe_dw_1.pbl.src' 'cwm_noe_dw_2.pbl.src' 'cwm_noe_lec.pbl.src' 'cwm_noe_liq.pbl.src' 'cwm_noe_uo.pbl.src' 'Cwm_pai.pbl.src' 'Cwm_pai_dw.pbl.src' 'cwm_pai_uo.pbl.src' 'cwm_prev.pbl.src' 'Cwm_prev_dw.pbl.src' 'cwm_prev_uo.pbl.src')).
	('Publipostage'
		-> #('Cwm_pub.pbl.src' 'cwm_pub_dw_2.pbl.src' 'cwm_pub_uo.pbl.src')).
	('Statistique'
		->
			#('Cwm_sta.pbl.src' 'cwm_sta_cot_dw_1.pbl.src' 'cwm_sta_cpt_dw.pbl.src' 'cwm_sta_liq_dw_1.pbl.src' 'cwm_sta_liq_dw_2.pbl.src' 'cwm_sta_lst_dw.pbl.src' 'cwm_sta_prev_dw_1.pbl.src' 'cwm_sta_prev_dw_2.pbl.src' 'cwm_sta_prt_dw_1.pbl.src' 'cwm_sta_prt_dw_2.pbl.src' 'cwm_sta_sp_dw.pbl.src' 'cwm_sta_uo.pbl.src'))}
		asOrderedDictionary
]

{ #category : #api }
Tbl_Module >> copyDirectory: sourceLib to: destLib [
	^ sourceLib visibleFiles
		do: [ :file | file copyTo: destLib / file basename ]
]

{ #category : #api }
Tbl_Module >> createModulesFrom: sourceFolder to: destinationFolder [
	| destinationFolderReference |
	destinationFolderReference := destinationFolder asFileReference
		ensureCreateDirectory.
	self allModules
		keysDo: [ :moduleName | 
			| module |
			module := (destinationFolderReference / moduleName)
				ensureCreateDirectory.
			(self
				getModuleLibrary: moduleName
				from: sourceFolder asFileReference directories)
				do: [ :sourceLib | 
					| destLib |
					destLib := (module / sourceLib basename) ensureCreateDirectory.
					self copyDirectory: sourceLib to: destLib ] ]
]

{ #category : #api }
Tbl_Module >> getModuleLibrary: moduleName from: libraries [
	^ libraries
		select: [ :b | (self allModules at: moduleName) includes: b basename ]
]

{ #category : #initialization }
Tbl_Module >> initialize [
	super initialize.
	rows := (self modulesAsLowercase keys
		collect: [ :moduleNom | 
			self rowClass new
				nom: moduleNom;
				setTickets;
				setBibliotheques;
				yourself ]) asOrderedCollection
]

{ #category : #utility }
Tbl_Module >> modulesAsLowercase [
	^ (self allModules keys
		collect: [ :key | 
			key
				-> ((self allModules at: key) collect: [ :module | module asLowercase ]) ])
		asOrderedDictionary
]

{ #category : #utility }
Tbl_Module >> rowClass [
	^ Tbl_Module_row
]

{ #category : #api }
Tbl_Module >> selectModuleFor: aLibraryName [
	| modules |
	"self haltIf: (aLibraryName ='cwm_brd')."
	modules := self modulesAsLowercase.
	^ modules keys
		select: [ :key | (modules at: key) includes: aLibraryName ]
]
