Class {
	#name : #AbstractCIMDateFormatConverter,
	#superclass : #Object,
	#category : #'CIMTicketsDataModel-converters'
}

{ #category : #'as yet unclassified' }
AbstractCIMDateFormatConverter class >> convert: arg1 [
	^ (self selectConverterFor: arg1) convert: arg1
]

{ #category : #'as yet unclassified' }
AbstractCIMDateFormatConverter class >> selectConverterFor: arg1 [
	^ (self subclasses
		detect: [ :arg2 | arg1 asLowercase matchesRegex: arg2 supportedFormat ])
		new
]

{ #category : #utility }
AbstractCIMDateFormatConverter class >> supportedFormat [
	^ self subclassResponsibility
]

{ #category : #converting }
AbstractCIMDateFormatConverter >> convert: arg1 [
	^ self subclassResponsibility
]
