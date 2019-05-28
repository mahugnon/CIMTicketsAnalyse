Class {
	#name : #ConvertHourFormat,
	#superclass : #AbstractCIMDateFormatConverter,
	#category : #'CIMTicketsDataModel-converters'
}

{ #category : #utility }
ConvertHourFormat class >> supportedFormat [
	^ '(.*heure.*)|(.*h)'
]

{ #category : #converting }
ConvertHourFormat >> convert: aString [
	| result |
	(aString matchesRegex: '.*h')
		ifTrue: [ ^ (aString  first asInteger * 3600) asDuration ].
	result := ' ' split: aString.
	^ (result first asInteger * 3600) asDuration
]
