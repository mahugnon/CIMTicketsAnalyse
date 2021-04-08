Class {
	#name : #QueryAvgTimeToOpenCloseTicket,
	#superclass : #CIMAbstractQuery,
	#category : #'CIMTicketsAnalyse-Queries'
}

{ #category : #running }
QueryAvgTimeToOpenCloseTicket >> runOn: aTicketGroup [
	aTicketGroup
		tickets:
			((aTicketGroup tickets
				select: [ :ticket | ticket dateClosing isNotNil ])
				reject: [ :t | t dev dev_fin = '0201-11-24' ]).
	^ CIMAverageNode new
		value:
			(aTicketGroup tickets
				ifEmpty: [ 0 ]
				ifNotEmpty: [ ((aTicketGroup tickets
						inject: 0
						into:
							[ :sum :aTicket | sum + (QueryDurationBetweenOpenAndCloseTicket new runOn: aTicket) ])
						/ aTicketGroup size) asFloat ]);
		ticketGroup: aTicketGroup
]
