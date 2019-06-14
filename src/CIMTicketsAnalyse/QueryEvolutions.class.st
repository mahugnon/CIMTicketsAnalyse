Class {
	#name : #QueryEvolutions,
	#superclass : #CIMAbstractQuery,
	#category : #'CIMTicketsAnalyse-Queries'
}

{ #category : #running }
QueryEvolutions >> runOn: aCollection [
	^ aCollection select: [ :ticket | ticket isEvolution ]
]
