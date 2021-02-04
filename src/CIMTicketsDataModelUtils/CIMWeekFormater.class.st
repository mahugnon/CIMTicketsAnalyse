Class {
	#name : #CIMWeekFormater,
	#superclass : #CIMDateFormater,
	#category : #'CIMTicketsDataModelUtils-DateConverter'
}

{ #category : #accessing }
CIMWeekFormater >> format: aDuration [
	^ (aDuration totalSeconds / (3600 * 24 * 7)) asInteger asString
]

{ #category : #accessing }
CIMWeekFormater >> title [ 
^'Time spent in weeks'
]
