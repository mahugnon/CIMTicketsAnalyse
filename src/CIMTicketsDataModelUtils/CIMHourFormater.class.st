Class {
	#name : #CIMHourFormater,
	#superclass : #CIMDateFormater,
	#category : #'CIMTicketsDataModelUtils-DateConverter'
}

{ #category : #accessing }
CIMHourFormater >> format: aDuration [
	^ (aDuration totalSeconds / 3600) asInteger asString 
]

{ #category : #accessing }
CIMHourFormater >> title [ 
^'Time spent in hour'
]
