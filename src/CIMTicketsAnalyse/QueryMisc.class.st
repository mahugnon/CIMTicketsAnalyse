Class {
	#name : #QueryMisc,
	#superclass : #CIMAbstractQuery,
	#category : #'CIMTicketsAnalyse-Queries'
}

{ #category : #running }
QueryMisc >> runOn: aCollection [
	^ aCollection select: [ :ticket | ticket isMisc ]
]
