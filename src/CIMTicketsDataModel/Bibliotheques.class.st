Class {
	#name : #Bibliotheques,
	#superclass : #Object,
	#instVars : [
		'bibliotheques'
	],
	#category : #'CIMTicketsDataModel-Model'
}

{ #category : #accessing }
Bibliotheques >> bibliotheques [
	^ bibliotheques
]

{ #category : #accessing }
Bibliotheques >> bibliotheques: anObject [
	bibliotheques := anObject
]

{ #category : #initialization }
Bibliotheques >> initialize [
	super initialize.
	bibliotheques := OrderedCollection new
]

{ #category : #accessing }
Bibliotheques >> updateWith: aDictionary [
	bibliotheques := aDictionary keys
		collect: [ :key | 
			Bibliotheque new
				name: key;
				tickets:
					(((aDictionary at: key) value collect: [ :e | e tickets ])
						reject: [ :ticket | ticket isNil ]) ]
]
