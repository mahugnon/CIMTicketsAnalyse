Class {
	#name : #ConvertJoursFormat,
	#superclass : #CIMDateFormatConverter,
	#category : #'CIMTicketsDataModelUtils-DateConverter'
}

{ #category : #utility }
ConvertJoursFormat class >> supportedFormat [
	^ '.*jour.*'
]

{ #category : #converting }
ConvertJoursFormat >> convert: aString [
	^ (('jours' split: (aString copyReplaceAll: ',' with: '.')) first
		asNumber * 27000) asDuration
]
