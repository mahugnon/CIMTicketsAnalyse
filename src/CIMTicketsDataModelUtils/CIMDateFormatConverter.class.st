Class {
	#name : #CIMDateFormatConverter,
	#superclass : #Object,
	#category : #'CIMTicketsDataModelUtils-DateConverter'
}

{ #category : #'as yet unclassified' }
CIMDateFormatConverter class >> convert: aTableField [
	aTableField ifNil: [ ^ self ].
	^ (self selectConverterFor: aTableField) convert: aTableField
]

{ #category : #'as yet unclassified' }
CIMDateFormatConverter class >> selectConverterFor: aTableField [
	^ (self subclasses
		detect: [ :sub | aTableField asLowercase matchesRegex: sub supportedFormat ])
		new
]

{ #category : #utility }
CIMDateFormatConverter class >> supportedFormat [
	^ self subclassResponsibility
]

{ #category : #converting }
CIMDateFormatConverter >> convert: arg1 [
	^ self subclassResponsibility
]
