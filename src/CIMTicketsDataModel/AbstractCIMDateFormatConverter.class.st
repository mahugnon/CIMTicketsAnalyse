Class {
	#name : #AbstractCIMDateFormatConverter,
	#superclass : #Object,
	#category : #'CIMTicketsDataModel-converters'
}

{ #category : #'as yet unclassified' }
AbstractCIMDateFormatConverter class >> convert: aString [
	^ (self selectConverterFor: aString) convert: aString
]

{ #category : #'as yet unclassified' }
AbstractCIMDateFormatConverter class >> selectConverterFor: aString [
	^ (self subclasses
		detect: [ :c | aString asLowercase matchesRegex: c supportedFormat ])
		new
]

{ #category : #utility }
AbstractCIMDateFormatConverter class >> supportedFormat [
	^ self subclassResponsibility
]

{ #category : #converting }
AbstractCIMDateFormatConverter >> convert: aString [
	^ self subclassResponsibility
]
