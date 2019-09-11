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
ConvertJoursFormat >> convert: arg1 [
	| tmp1 |
	tmp1 := arg1 copyReplaceAll: ',' with: '.'.
	^ tmp1 := (('jours' split: tmp1) first asNumber * 27000) asDuration
]
