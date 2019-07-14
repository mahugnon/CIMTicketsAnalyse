Class {
	#name : #CIMHourFormater,
	#superclass : #CIMDateFormater,
	#category : #'CIMTicketsDataModel-Utils'
}

{ #category : #accessing }
CIMHourFormater >> format: aDuration [
	^ (aDuration totalSeconds / 3600) asInteger asString , 'H'
]

{ #category : #accessing }
CIMHourFormater >> title [ 
^'Temps en heure'
]
