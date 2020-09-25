Class {
	#name : #CIMMinuteFormater,
	#superclass : #CIMDateFormater,
	#category : #'CIMTicketsDataModelUtils-DateConverter'
}

{ #category : #accessing }
CIMMinuteFormater >> format: aDuration [
	^ (aDuration totalSeconds / 60) asInteger asString 
]

{ #category : #accessing }
CIMMinuteFormater >> title [
	^ 'Time spent in minute'
]
