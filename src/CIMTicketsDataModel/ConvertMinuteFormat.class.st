Class {
	#name : #ConvertMinuteFormat,
	#superclass : #AbstractCIMDateFormatConverter,
	#category : #'CIMTicketsDataModel-converters'
}

{ #category : #utility }
ConvertMinuteFormat class >> supportedFormat [
	^ '.*min.*'
]

{ #category : #converting }
ConvertMinuteFormat >> convert: aString [
	| result |
	result := ' ' split: aString.
	^ (result first asInteger * 60) asDuration
]
