Class {
	#name : #QueryAvgTicketsTimeRCTestGroupedByTime,
	#superclass : #CIMAbstractQuery,
	#category : #'CIMTicketsAnalyse-Queries'
}

{ #category : #running }
QueryAvgTicketsTimeRCTestGroupedByTime >> runOn: aCollection [
	"self halt."
	^ (aCollection
		collect:
			[ :groupNode | (QueryAvgTicketsTimeRCTest runOn: groupNode) time: groupNode time ])
		asOrderedCollection
]
