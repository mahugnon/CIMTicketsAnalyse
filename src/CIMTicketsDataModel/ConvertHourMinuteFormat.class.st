Class {
	#name : #ConvertHourMinuteFormat,
	#superclass : #AbstractCIMDateFormatConverter,
	#category : #'CIMTicketsDataModel-converters'
}

{ #category : #utility }
ConvertHourMinuteFormat class >> supportedFormat [
	^ '(.*h)([0-9]+)'
]

{ #category : #converting }
ConvertHourMinuteFormat >> convert: aString [
	| result |
	result := 'H' split: aString.
	^ (result first asInteger * 3600 + (result second asInteger * 60))
		asDuration
]
