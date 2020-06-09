Class {
	#name : #ConvertMinuteFormat,
	#superclass : #CIMDateFormatConverter,
	#category : #'CIMTicketsDataModelUtils-DateConverter'
}

{ #category : #utility }
ConvertMinuteFormat class >> supportedFormat [
	^ '(.*min.*)|(([0-9]+))'
]

{ #category : #converting }
ConvertMinuteFormat >> convert: aString [
	(aString matchesRegex: '([0-9]+)')
		ifTrue: [ ^ (aString asInteger * 60) asDuration ].
	^ ((' ' split: aString) first asInteger * 60) asDuration
]
