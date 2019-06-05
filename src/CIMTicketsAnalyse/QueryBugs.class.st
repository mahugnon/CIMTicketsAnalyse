Class {
	#name : #QueryBugs,
	#superclass : #CIMAbstractQuery,
	#category : #CIMTicketsAnalyse
}

{ #category : #running }
QueryBugs >> runOn: aCollection [
	^ aCollection select: [ :ticket | ticket isBug  ]
]
