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
ConvertMinuteFormat >> convert: aString [
	| result |
	(aString matchesRegex: '([0-9]+)')
		ifTrue: [ ^ (aString asInteger * 60) asDuration ].
	result := ' ' split: aString.
	^ (result first asInteger * 60) asDuration
]
