Class {
	#name : #CIMDayFormater,
	#superclass : #CIMDateFormater,
	#category : #'CIMTicketsDataModelUtils-DateConverter'
}

{ #category : #accessing }
CIMDayFormater >> format: aDuration [
	^ aDuration days asString , ' J'
]

{ #category : #accessing }
CIMDayFormater >> title [
	^ 'Temps en jours'
]
