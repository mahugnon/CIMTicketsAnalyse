Class {
	#name : #QueryAvgTicketsTimeDev,
	#superclass : #CIMAbstractQuery,
	#category : #'CIMTicketsAnalyse-Queries-Dev'
}

{ #category : #running }
QueryAvgTicketsTimeDev >> runOn: aCollection [
	aCollection ifEmpty: [ ^ 0 ].
	^ ((QueryTicketsTimeDev runOn: aCollection) / aCollection size)
		asFloat
]
