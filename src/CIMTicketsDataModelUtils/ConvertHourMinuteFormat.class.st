Class {
	#name : #ConvertHourMinuteFormat,
	#superclass : #CIMDateFormatConverter,
	#category : #'CIMTicketsDataModelUtils-DateConverter'
}

{ #category : #utility }
ConvertHourMinuteFormat class >> supportedFormat [
	^ '(.*h)([0-9]+)'
]

{ #category : #converting }
ConvertHourMinuteFormat >> convert: arg1 [
	| tmp1 |
	tmp1 := 'H' split: arg1.
	^ (tmp1 first asInteger * 3600 + (tmp1 second asInteger * 60))
		asDuration
]
