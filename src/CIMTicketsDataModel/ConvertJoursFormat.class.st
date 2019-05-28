Class {
	#name : #ConvertJoursFormat,
	#superclass : #AbstractCIMDateFormatConverter,
	#category : #'CIMTicketsDataModel-converters'
}

{ #category : #utility }
ConvertJoursFormat class >> supportedFormat [
	^ '.*jour.*'
]

{ #category : #converting }
ConvertJoursFormat >> convert: aString [
	| result |
	result := aString copyReplaceAll: ',' with: '.'.
	^ result := (('jours' split: result) first asNumber * 27000)
		asDuration
]
