Class {
	#name : #QueryNumberOfReturns,
	#superclass : #CIMAbstractQuery,
	#category : #'CIMTicketsAnalyse-Queries-Dev'
}

{ #category : #running }
QueryNumberOfReturns >> runOn: aTicketGroupNode [
	^ aTicketGroupNode tickets
		inject: 0
		into: [ :sum :each | sum + each ft_nbretour asInteger ]
]
