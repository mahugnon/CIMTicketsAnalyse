Class {
	#name : #CIMMinuteFormater,
	#superclass : #CIMDateFormater,
	#category : #'CIMTicketsDataModel-Utils'
}

{ #category : #accessing }
CIMMinuteFormater >> format: aDuration [
	^ (aDuration totalSeconds / 60) asInteger asString , 'Min'
]

{ #category : #accessing }
CIMMinuteFormater >> title [
	^ 'Temps en minute'
]
