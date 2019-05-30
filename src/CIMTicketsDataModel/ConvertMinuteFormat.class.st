Class {
	#name : #ConvertMinuteFormat,
	#superclass : #AbstractCIMDateFormatConverter,
	#category : #'CIMTicketsDataModel-converters'
}

{ #category : #utility }
ConvertMinuteFormat class >> supportedFormat [
	^ '(.*min.*)|(([0-9]+))'
]

{ #category : #converting }
ConvertMinuteFormat >> convert: arg1 [
	| tmp1 |
	(arg1 matchesRegex: '([0-9]+)')
		ifTrue: [ ^ (arg1 asInteger * 60) asDuration ].
	tmp1 := ' ' split: arg1.
	^ (tmp1 first asInteger * 60) asDuration
]
