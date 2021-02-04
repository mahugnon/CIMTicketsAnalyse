Class {
	#name : #ConvertHourFormat,
	#superclass : #CIMDateFormatConverter,
	#category : #'CIMTicketsDataModelUtils-DateConverter'
}

{ #category : #utility }
ConvertHourFormat class >> supportedFormat [
	^ '(.*heure.*)|(.*h)'
]

{ #category : #converting }
ConvertHourFormat >> convert: arg1 [
	| tmp1 |
	(arg1 matchesRegex: '.*h')
		ifTrue: [ ^ (arg1 first asInteger * 3600) asDuration ].
	tmp1 := ' ' split: arg1.
	^ (tmp1 first asInteger * 3600) asDuration
]
