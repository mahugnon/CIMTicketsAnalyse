Class {
	#name : #ConvertHourContainingEtFormat,
	#superclass : #CIMDateFormatConverter,
	#category : #'CIMTicketsDataModelUtils-DateConverter'
}

{ #category : #utility }
ConvertHourContainingEtFormat class >> supportedFormat [
	^ '.*h.*et.*'
]

{ #category : #converting }
ConvertHourContainingEtFormat >> convert: aTableField [
	| timeSpent |
	timeSpent := (('et' split: aTableField) first
		copyReplaceAll: 'h'
		with: '') trim asInteger.
	^ (timeSpent * 3600) asDuration
]
