Class {
	#name : #QueryMisc,
	#superclass : #CIMAbstractQuery,
	#category : #CIMTicketsAnalyse
}

{ #category : #running }
QueryMisc >> runOn: aCollection [
	^ aCollection select: [ :ticket | ticket isMisc ]
]
