Class {
	#name : #QueryBugsEvolutions,
	#superclass : #CIMAbstractQuery,
	#category : #'CIMTicketsAnalyse-Queries'
}

{ #category : #running }
QueryBugsEvolutions >> runOn: aCollection [
	^ aCollection
		select: [ :ticket | ticket isEvolution or: [ ticket isBug ] ]
]
