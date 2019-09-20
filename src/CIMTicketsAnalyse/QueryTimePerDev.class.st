Class {
	#name : #QueryTimePerDev,
	#superclass : #CIMAbstractQuery,
	#category : #'CIMTicketsAnalyse-Queries'
}

{ #category : #running }
QueryTimePerDev >> runOn: aCollection [
	"I receive a time serie dictionary"

	^ (aCollection
		collect: [ :node | 
			CIMMovingAverageNode new
				averageNodes: node averageNodes;
				time: node time;
				value:
					node value
						/
							(QueryNumberOfDeveloppeurForAmonth new
								runOn: Tbl tbl_devizy rows
								for: node time) ]) asOrderedCollection
]
