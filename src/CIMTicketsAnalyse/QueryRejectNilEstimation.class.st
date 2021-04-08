Class {
	#name : #QueryRejectNilEstimation,
	#superclass : #QueryCleanData,
	#category : #'CIMTicketsAnalyse-Queries'
}

{ #category : #'as yet unclassified' }
QueryRejectNilEstimation >> rejectWrongEstimDate: aTicketGroupNode [
	^ aTicketGroupNode
		tickets:
			(aTicketGroupNode tickets
				select: [ :ft | ft tpsEstim ~= '' and: [ ft tpsEstim isNotNil ] ]);
		yourself
]

{ #category : #'as yet unclassified' }
QueryRejectNilEstimation >> rejectWrongTotalDate: aTicketGroupNode [
	^ aTicketGroupNode
		tickets:
			(aTicketGroupNode tickets
				select: [ :ft | ft totalTps ~= '' and: [ ft totalTps isNotNil ] ]);
		yourself
]

{ #category : #running }
QueryRejectNilEstimation >> runOn: aCollection [
	^ self
		rejectWrongTotalDate: (self rejectWrongEstimDate: (super runOn: aCollection))
]
