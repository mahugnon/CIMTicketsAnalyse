Class {
	#name : #CIMDateFormatConverter,
	#superclass : #Object,
	#category : #'CIMTicketsDataModelUtils-DateConverter'
}

{ #category : #'as yet unclassified' }
CIMDateFormatConverter class >> convert: aTableField [
	aTableField ifNil: [ ^ nil ].
	^ (self selectConverterFor: aTableField) convert: aTableField
]

{ #category : #'private-api' }
CIMDateFormatConverter class >> ignorables [
	^ #('5f') asOrderedCollection
]

{ #category : #'as yet unclassified' }
CIMDateFormatConverter class >> selectConverterFor: aTableField [
	"Opened the debugguer is intended"

	aTableField isString
		ifFalse: [ ^ CIMDateIdentityConverter new ].
	^ self subclasses
		detect: [ :sub | aTableField asLowercase matchesRegex: sub supportedFormat ]
		ifFound: [ :founded | founded new ]
		ifNone: [ (self toIgnore: aTableField)
				ifTrue: [ CIMDateIdentityConverter new ]
				ifFalse: [ self halt now ] ]
]

{ #category : #utility }
CIMDateFormatConverter class >> supportedFormat [
	^ ''
]

{ #category : #'private-api' }
CIMDateFormatConverter class >> toIgnore: aString [
	^ self ignorables includes: aString
]

{ #category : #converting }
CIMDateFormatConverter >> convert: aTbableField [
	| timeSpent |
	timeSpent := (('et' split: aTbableField) first
		copyReplaceAll: 'h'
		with: '') trim asInteger.
	^ (timeSpent * 3600) asDuration
]
