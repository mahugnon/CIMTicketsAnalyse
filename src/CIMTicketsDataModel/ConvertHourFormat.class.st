Class {
	#name : #ConvertHourFormat,
	#superclass : #AbstractCIMDateFormatConverter,
	#category : #'CIMTicketsDataModel-converters'
}

{ #category : #utility }
ConvertHourFormat class >> supportedFormat [
	^ '.*heure.*'
]

{ #category : #converting }
ConvertHourFormat >> convert: aString [
	| result |
	result := ' ' split: aString.
	^ (result first asInteger * 3600) asDuration
]
