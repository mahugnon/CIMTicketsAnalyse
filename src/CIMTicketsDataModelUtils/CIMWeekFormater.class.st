Class {
	#name : #CIMWeekFormater,
	#superclass : #CIMDateFormater,
	#category : #'CIMTicketsDataModelUtils-DateConverter'
}

{ #category : #accessing }
CIMWeekFormater >> format: aDuration [
"3600 * 7.5(working day hours)*5=135000"
	^ (aDuration totalSeconds / 135000) asInteger asString
]

{ #category : #accessing }
CIMWeekFormater >> title [ 
^'Time spent in week'
]
