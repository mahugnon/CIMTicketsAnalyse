Class {
	#name : #CIMDayFormater,
	#superclass : #CIMDateFormater,
	#category : #'CIMTicketsDataModelUtils-DateConverter'
}

{ #category : #accessing }
CIMDayFormater >> format: aDuration [
"3600 * 7.5(working day hours)=27000"
	^ (aDuration totalSeconds / 27000) asInteger asString
]

{ #category : #accessing }
CIMDayFormater >> title [
	^ 'Time Spent in day'
]
