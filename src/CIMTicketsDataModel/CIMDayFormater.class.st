Class {
	#name : #CIMDayFormater,
	#superclass : #CIMDateFormater,
	#category : #'CIMTicketsDataModel-Utils'
}

{ #category : #accessing }
CIMDayFormater >> format: aDuration [
	^ aDuration days asString , ' J'
]

{ #category : #accessing }
CIMDayFormater >> title [
	^ 'Temps en jours'
]
