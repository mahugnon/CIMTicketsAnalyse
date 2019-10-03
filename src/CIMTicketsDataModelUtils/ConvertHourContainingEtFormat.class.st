Class {
	#name : #ConvertHourContainingEtFormat,
	#superclass : #CIMDateFormatConverter,
	#category : #'CIMTicketsDataModelUtils-DateConverter'
}

{ #category : #utility }
ConvertHourContainingEtFormat class >> supportedFormat [
	^ '.*h.*et.*'
]
