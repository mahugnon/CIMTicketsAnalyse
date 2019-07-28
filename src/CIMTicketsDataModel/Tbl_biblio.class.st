Class {
	#name : #'Tbl_biblio',
	#superclass : #Tbl,
	#category : #'CIMTicketsDataModel-Model'
}

{ #category : #accessing }
Tbl_biblio >> groupedByName [
	^ ((rows groupedBy: #biblio_nom) associations
		select: [ :b | b key matchesRegex: '.*cwm.*' ]) asDictionary
]

{ #category : #'as yet unclassified' }
Tbl_biblio >> izyProtectActualBibliotheque [
	^ rows
		select:
			[ :bib | self izyProtectActualBibliothequeNames includes: bib biblio_nom ]
]

{ #category : #'as yet unclassified' }
Tbl_biblio >> izyProtectActualBibliothequeNames [
	^ #('cwm_abc' 'cwm_abc_dw' 'cwm_abc_uo' 'cwm_app' 'cwm_app_dw' 'cwm_brd' 'cwm_brd_dw_1' 'cwm_brd_dw_2' 'cwm_brd_uo' 'cwm_corb' 'cwm_cot' 'cwm_cot_dw_1' 'cwm_cot_dw_2' 'cwm_cot_dw_3' 'cwm_cot_uo' 'cwm_cpt' 'cwm_cpt_dw_1' 'cwm_cpt_dw_2' 'cwm_cpt_dw_3' 'cwm_cpt_dw_4' 'cwm_cpt_uo' 'cwm_ctr' 'cwm_ctr_dw_1' 'cwm_ctr_dw_2' 'cwm_ctr_uo' 'cwm_dwh' 'cwm_dwh_dw' 'cwm_dwh_uo' 'cwm_edi' 'cwm_edi_dw' 'cwm_edi_uo' 'cwm_exp' 'cwm_exp_dw' 'cwm_exp_uo' 'cwm_fdb' 'cwm_gui' 'cwm_liq' 'cwm_liq_2' 'cwm_liq_dw_1' 'cwm_liq_dw_2' 'cwm_liq_maj' 'cwm_liq_uo' 'cwm_mdb' 'cwm_net' 'cwm_net_dw' 'cwm_net_uo' 'cwm_noe' 'cwm_noe_dw_1' 'cwm_noe_dw_2' 'cwm_noe_irm' 'cwm_noe_lec' 'cwm_noe_liq' 'cwm_noe_uo' 'cwm_org' 'cwm_org_dw' 'cwm_org_uo' 'cwm_output' 'cwm_pai' 'cwm_pai_dw' 'cwm_pai_uo' 'cwm_par' 'cwm_par_dw' 'cwm_par_uo' 'cwm_prev' 'cwm_prev_dw' 'cwm_prev_uo' 'cwm_prt' 'cwm_prt_dw' 'cwm_prt_uo' 'cwm_pub' 'cwm_pub_dw_2' 'cwm_pub_uo' 'cwm_req' 'cwm_res' 'cwm_res_dw' 'cwm_res_uo' 'cwm_soc' 'cwm_soc_dw' 'cwm_soc_uo' 'cwm_sta' 'cwm_sta_cot_dw_1' 'cwm_sta_cpt_dw' 'cwm_sta_liq_dw_1' 'cwm_sta_liq_dw_2' 'cwm_sta_lst_dw' 'cwm_sta_prev_dw_1' 'cwm_sta_prev_dw_2' 'cwm_sta_prt_dw_1' 'cwm_sta_prt_dw_2' 'cwm_sta_sp_dw' 'cwm_sta_uo' 'cwm_tmp' 'cwm_tmp_dw' 'cwm_tmp_uo' 'cwm_tool' 'cwm_tool_dw' 'cwm_tool_uo' 'cwm_tools_dev' 'cwm_tpy' 'cwm_tpy_dw' 'cwm_tpy_uo' 'cwm_trs' 'cwm_trs_dw' 'cwm_trs_uo' 'cwm_trt' 'cwm_trt_dw' 'cwm_trt_uo' 'cwm_tuc' 'cwm_tuc_dw' 'cwm_tuc_uo' 'cwm_txt' 'cwm_txt_dw' 'cwm_txt_uo' 'cwm_usr' 'cwm_xxx_dw' 'cwm_xxx_dw_2' 'cwm_xxx_dw_3')
]

{ #category : #'as yet unclassified' }
Tbl_biblio >> renameUsing: aCollection [
	rows do: [ :row | row renameUsing: aCollection ]
]

{ #category : #utility }
Tbl_biblio >> rowClass [
	^ Tbl_biblio_row
]
