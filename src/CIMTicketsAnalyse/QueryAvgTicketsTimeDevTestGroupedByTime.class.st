Class {
	#name : #QueryAvgTicketsTimeDevTestGroupedByTime,
	#superclass : #CIMAbstractQuery,
	#category : #'CIMTicketsAnalyse-Queries'
}

{ #category : #running }
QueryAvgTicketsTimeDevTestGroupedByTime >> runOn: aCollection [
	"self halt."

	^ (aCollection
		collect:
			[ :groupNode | (QueryAvgTicketsTimeDevTest runOn: groupNode) time: groupNode time ])
		asOrderedCollection
]
