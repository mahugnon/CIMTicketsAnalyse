Class {
	#name : #'Tbl_message_row',
	#superclass : #'Tbl_row',
	#instVars : [
		'msg_id',
		'msg_libelle',
		'msg_titre',
		'msg_contenu',
		'msg_rub_id'
	],
	#category : #'CIMTicketsDataModel-Model'
}

{ #category : #accessing }
Tbl_message_row >> msg_contenu [
	^ msg_contenu
]

{ #category : #accessing }
Tbl_message_row >> msg_contenu: anObject [
	msg_contenu := anObject
]

{ #category : #accessing }
Tbl_message_row >> msg_id [
	^ msg_id
]

{ #category : #accessing }
Tbl_message_row >> msg_id: anObject [
	msg_id := anObject
]

{ #category : #accessing }
Tbl_message_row >> msg_libelle [
	^ msg_libelle
]

{ #category : #accessing }
Tbl_message_row >> msg_libelle: anObject [
	msg_libelle := anObject
]

{ #category : #accessing }
Tbl_message_row >> msg_rub_id [
	^ msg_rub_id
]

{ #category : #accessing }
Tbl_message_row >> msg_rub_id: anObject [
	msg_rub_id := anObject
]

{ #category : #accessing }
Tbl_message_row >> msg_titre [
	^ msg_titre
]

{ #category : #accessing }
Tbl_message_row >> msg_titre: anObject [
	msg_titre := anObject
]
