Class {
	#name : #ConvertJoursFormat,
	#superclass : #CIMDateFormatConverter,
	#category : #'CIMTicketsDataModelUtils-DateConverter'
}

{ #category : #utility }
ConvertJoursFormat class >> supportedFormat [
	^ '(.*jour.*)|.*g.*'
]

{ #category : #converting }
ConvertJoursFormat >> convert: aString [
	(aString matchesRegex: '.*g.*')
		ifTrue: [ aString copyReplaceAll: 'g' with: 'jours' ].
	^ (('jours' split: (aString copyReplaceAll: ',' with: '.')) first
		asNumber * 27000) asDuration
]
