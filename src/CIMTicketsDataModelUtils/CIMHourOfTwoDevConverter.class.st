Class {
	#name : #CIMHourOfTwoDevConverter,
	#superclass : #CIMDateFormatConverter,
	#category : #'CIMTicketsDataModelUtils-DateConverter'
}

{ #category : #utility }
CIMHourOfTwoDevConverter class >> supportedFormat [
	^ '8h nico 3h pasc'
]

{ #category : #converting }
CIMHourOfTwoDevConverter >> convert: aTableField [
	"this is very bad"

	self flag: 'Todo'.
	^ ((8 + 3) * 3600) asDuration
]
