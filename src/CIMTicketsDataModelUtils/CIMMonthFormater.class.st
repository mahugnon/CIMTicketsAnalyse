Class {
	#name : #CIMMonthFormater,
	#superclass : #CIMDateFormater,
	#category : #'CIMTicketsDataModelUtils-DateConverter'
}

{ #category : #accessing }
CIMMonthFormater >> format: aDuration [
	^ (aDuration totalSeconds / (3600 * 24 * 28)) asInteger asString
]

{ #category : #accessing }
CIMMonthFormater >> title [
	^ 'Time spent in months'
]
