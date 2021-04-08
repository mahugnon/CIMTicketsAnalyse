Class {
	#name : #TimeSerieQueries,
	#superclass : #CIMAbstractQuery,
	#category : #'CIMTicketsAnalyse-Queries'
}

{ #category : #running }
TimeSerieQueries >> runOn: aDictionary [
	^ self subclassResponsibility
]
