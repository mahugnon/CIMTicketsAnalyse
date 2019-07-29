Class {
	#name : #QueryAvgTicketsTimeTest,
	#superclass : #CIMAbstractQuery,
	#category : #'CIMTicketsAnalyse-Queries'
}

{ #category : #running }
QueryAvgTicketsTimeTest >> runOn: aCollection [
	aCollection ifEmpty: [ ^ 0 ].
	^ (QueryTicketsTimeTest runOn: aCollection / aCollection size)
		asFloat
]
