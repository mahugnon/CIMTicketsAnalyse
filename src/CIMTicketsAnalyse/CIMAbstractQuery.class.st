Class {
	#name : #CIMAbstractQuery,
	#superclass : #Object,
	#category : #'CIMTicketsAnalyse-Queries'
}

{ #category : #running }
CIMAbstractQuery >> runOn: aCollection [
	^ self subclassResponsibility
]
