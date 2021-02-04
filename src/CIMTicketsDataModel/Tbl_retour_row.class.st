Class {
	#name : #'Tbl_retour_row',
	#superclass : #'Tbl_row',
	#instVars : [
		'retour_id',
		'ft_id',
		'date_retour',
		'cc_type_retour_id',
		'dev_type_retour_id',
		'date_valide',
		'ccTypeRetour',
		'devTypeRetours',
		'tickets'
	],
	#category : #'CIMTicketsDataModel-Model'
}

{ #category : #api }
Tbl_retour_row >> ccTypeRetour [
	ccTypeRetour ifNil: [ ccTypeRetour := Set new ].
	^ ccTypeRetour
]

{ #category : #accessing }
Tbl_retour_row >> ccTypeRetourToRetour [
	self shouldBeImplemented.
]

{ #category : #accessing }
Tbl_retour_row >> cc_type_retour_id [
	^ cc_type_retour_id
]

{ #category : #accessing }
Tbl_retour_row >> cc_type_retour_id: anObject [
	cc_type_retour_id := anObject
]

{ #category : #accessing }
Tbl_retour_row >> date_retour [
	^ date_retour
]

{ #category : #accessing }
Tbl_retour_row >> date_retour: anObject [
	date_retour := anObject
]

{ #category : #accessing }
Tbl_retour_row >> date_valide [
	^ date_valide
]

{ #category : #accessing }
Tbl_retour_row >> date_valide: anObject [
	date_valide := anObject
]

{ #category : #accessing }
Tbl_retour_row >> devTypeRetour [
	devTypeRetours ifNil: [ devTypeRetours := Set new ].
	^ devTypeRetours
]

{ #category : #accessing }
Tbl_retour_row >> dev_type_retour_id [
	^ dev_type_retour_id
]

{ #category : #accessing }
Tbl_retour_row >> dev_type_retour_id: anObject [
	dev_type_retour_id := anObject
]

{ #category : #formatting }
Tbl_retour_row >> formatFieldsToCIMDate [
	self date_retour: self date_retour asDate.
	self date_valide = ''
		ifTrue: [ self date_valide: nil ]
		ifFalse: [ self date_valide: self date_valide ]
]

{ #category : #accessing }
Tbl_retour_row >> ft_id [
	^ ft_id
]

{ #category : #accessing }
Tbl_retour_row >> ft_id: anObject [
	ft_id := anObject
]

{ #category : #testing }
Tbl_retour_row >> isConsistentFeedBack [
	^ self devTypeRetour isConsistentFeedBack
]

{ #category : #testing }
Tbl_retour_row >> isInconsistentFeedBack [
	^ self devTypeRetour isInconsistentFeedBack
]

{ #category : #api }
Tbl_retour_row >> joinCcTypeRetourToRetour: aCollection [
	self ccTypeRetour
		addAll:
			(aCollection
				select:
					[ :typeRetour | typeRetour type_retour_id asString = self cc_type_retour_id asString ])
]

{ #category : #api }
Tbl_retour_row >> joinDevTypeRetourToRetour: aCollection [
	self devTypeRetour
		addAll:
			(aCollection
				select:
					[ :typeRetour | typeRetour type_retour_id asString = dev_type_retour_id asString ])
]

{ #category : #api }
Tbl_retour_row >> joinTicketsToRetour: aCollection [
	self tickets
		addAll:
			(aCollection
				select: [ :ticket | 
					self ft_id asString
						=
							(ticket ft_id copyReplaceAll: (Character value: 160) asString with: '') ])
]

{ #category : #api }
Tbl_retour_row >> joinTypeRetoursToRetour: aCollection [
	self joinCcTypeRetourToRetour: aCollection.
	self joinDevTypeRetourToRetour: aCollection
]

{ #category : #accessing }
Tbl_retour_row >> retour_id [
	^ retour_id
]

{ #category : #accessing }
Tbl_retour_row >> retour_id: anObject [
	retour_id := anObject
]

{ #category : #accessing }
Tbl_retour_row >> tickets [
	tickets ifNil: [ tickets := Set new ].
	^ tickets
]
