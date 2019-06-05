Class {
	#name : #CIMAbstractQuery,
	#superclass : #Object,
	#category : #CIMTicketsAnalyse
}

{ #category : #running }
CIMAbstractQuery >> runOn: aCollection [
	^ self subclassResponsibility
]
