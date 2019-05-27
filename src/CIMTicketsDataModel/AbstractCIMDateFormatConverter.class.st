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
		select: [ :c | aString matchesRegex: c supportedFormat ]) first new
]

{ #category : #utility }
AbstractCIMDateFormatConverter class >> supportedFormat [
	^ self subclassResponsibility
]

{ #category : #converting }
AbstractCIMDateFormatConverter >> convert: aString [
	^ self subclassResponsibility
]
