Class {
	#name : #QueryAvgTimeToOpenCloseTicket,
	#superclass : #CIMAbstractQuery,
	#category : #'CIMTicketsAnalyse-Queries'
}

{ #category : #running }
QueryAvgTimeToOpenCloseTicket >> runOn: aCollection [
	| tickets |
	tickets := (aCollection
		select: [ :ticket | ticket dateClosing isNotNil ])
		reject: [ :t | t dev dev_fin = '0201-11-24' ].
	^ CIMAverageNode new
		value:
			(tickets
				ifEmpty: [ ^ 0 ]
				ifNotEmpty:
					((tickets
						inject: 0
						into:
							[ :sum :aTicket | sum + (QueryDurationBetweenOpenAndCloseTicket new runOn: aTicket) ])
						/ tickets size) asFloat);
		addTicket: tickets
]
