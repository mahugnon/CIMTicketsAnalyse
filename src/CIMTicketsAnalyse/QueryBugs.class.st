Class {
	#name : #QueryBugs,
	#superclass : #CIMAbstractQuery,
	#category : #'CIMTicketsAnalyse-Queries'
}

{ #category : #running }
QueryBugs >> runOn: aCollection [
	^ aCollection select: [ :ticket | ticket isBug  ]
]
