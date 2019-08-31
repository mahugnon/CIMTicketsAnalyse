Class {
	#name : #QueryClosed,
	#superclass : #CIMAbstractQuery,
	#category : #'CIMTicketsAnalyse-Queries'
}

{ #category : #running }
QueryClosed >> runOn: aTicketGroupNode [
	^ aTicketGroupNode
		tickets:
			(aTicketGroupNode tickets
				reject: [ :ticket | ticket monthClosing isNil ])
]
