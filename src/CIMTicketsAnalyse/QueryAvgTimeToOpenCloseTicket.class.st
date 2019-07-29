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
	tickets ifEmpty: [ ^ 0 ].
	^ ((QueryTimeToOpenCloseTicket runOn: tickets) / tickets size)
		asFloat
]
