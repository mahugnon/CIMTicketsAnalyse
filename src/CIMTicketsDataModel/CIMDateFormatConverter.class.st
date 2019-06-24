Class {
	#name : #CIMDateFormatConverter,
	#superclass : #Object,
	#category : #'CIMTicketsDataModel-converters'
}

{ #category : #'as yet unclassified' }
CIMDateFormatConverter class >> convert: aTableField [
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
