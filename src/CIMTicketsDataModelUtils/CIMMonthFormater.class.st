Class {
	#name : #CIMMonthFormater,
	#superclass : #CIMDateFormater,
	#category : #'CIMTicketsDataModelUtils-DateConverter'
}

{ #category : #accessing }
CIMMonthFormater >> format: aDuration [
"3600 * 7.5(working day hours)*5*4=135000"
	^ (aDuration totalSeconds / 540000) asInteger asString
]

{ #category : #accessing }
CIMMonthFormater >> title [
	^ 'Time spent in month'
]
