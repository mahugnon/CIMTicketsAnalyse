Class {
	#name : #CIMAbstractQuery,
	#superclass : #Object,
	#category : #'CIMTicketsAnalyse-Queries'
}

{ #category : #running }
CIMAbstractQuery class >> runOn: aCollection [
	^ self new runOn: aCollection
]

{ #category : #running }
CIMAbstractQuery >> runOn: aCollection [
	^ self subclassResponsibility
]
