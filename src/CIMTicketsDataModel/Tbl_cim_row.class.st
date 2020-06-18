Class {
	#name : #'Tbl_cim_row',
	#superclass : #'Tbl_row',
	#instVars : [
		'cim_id',
		'cim_libelle',
		'cim_email',
		'cim_tel',
		'cim_telabrege',
		'cim_portable',
		'cim_portableabrege',
		'cim_securite_id',
		'cim_tps_dev',
		'cim_mail_qes_res',
		'cim_jour_envoi',
		'cim_plage_envoi'
	],
	#category : #'CIMTicketsDataModel-Model'
}

{ #category : #accessing }
Tbl_cim_row >> cim_email [
	^ cim_email
]

{ #category : #accessing }
Tbl_cim_row >> cim_email: arg1 [
	cim_email := arg1
]

{ #category : #accessing }
Tbl_cim_row >> cim_id [
	^ cim_id
]

{ #category : #accessing }
Tbl_cim_row >> cim_id: arg1 [
	cim_id := arg1
]

{ #category : #accessing }
Tbl_cim_row >> cim_jour_envoi [
	^ cim_jour_envoi
]

{ #category : #accessing }
Tbl_cim_row >> cim_jour_envoi: arg1 [
	cim_jour_envoi := arg1
]

{ #category : #accessing }
Tbl_cim_row >> cim_libelle [
	^ cim_libelle
]

{ #category : #accessing }
Tbl_cim_row >> cim_libelle: arg1 [
	cim_libelle := arg1
]

{ #category : #accessing }
Tbl_cim_row >> cim_mail_qes_res [
	^ cim_mail_qes_res
]

{ #category : #accessing }
Tbl_cim_row >> cim_mail_qes_res: arg1 [
	cim_mail_qes_res := arg1
]

{ #category : #accessing }
Tbl_cim_row >> cim_plage_envoi [
	^ cim_plage_envoi
]

{ #category : #accessing }
Tbl_cim_row >> cim_plage_envoi: arg1 [
	cim_plage_envoi := arg1
]

{ #category : #accessing }
Tbl_cim_row >> cim_portable [
	^ cim_portable
]

{ #category : #accessing }
Tbl_cim_row >> cim_portable: arg1 [
	cim_portable := arg1
]

{ #category : #accessing }
Tbl_cim_row >> cim_portableabrege [
	^ cim_portableabrege
]

{ #category : #accessing }
Tbl_cim_row >> cim_portableabrege: arg1 [
	cim_portableabrege := arg1
]

{ #category : #accessing }
Tbl_cim_row >> cim_securite_id [
	^ cim_securite_id
]

{ #category : #accessing }
Tbl_cim_row >> cim_securite_id: arg1 [
	cim_securite_id := arg1
]

{ #category : #accessing }
Tbl_cim_row >> cim_tel [
	^ cim_tel
]

{ #category : #accessing }
Tbl_cim_row >> cim_tel: arg1 [
	cim_tel := arg1
]

{ #category : #accessing }
Tbl_cim_row >> cim_telabrege [
	^ cim_telabrege
]

{ #category : #accessing }
Tbl_cim_row >> cim_telabrege: arg1 [
	cim_telabrege := arg1
]

{ #category : #accessing }
Tbl_cim_row >> cim_tps_dev [
	^ cim_tps_dev
]

{ #category : #accessing }
Tbl_cim_row >> cim_tps_dev: arg1 [
	cim_tps_dev := arg1
]
