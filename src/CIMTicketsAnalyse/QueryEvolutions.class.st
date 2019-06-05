Class {
	#name : #QueryEvolutions,
	#superclass : #CIMAbstractQuery,
	#category : #CIMTicketsAnalyse
}

{ #category : #running }
QueryEvolutions >> runOn: aCollection [
	^ aCollection select: [ :ticket | ticket isEvolution ]
]
