Class {
	#name : #QueryNumberOfTicketsWithReturns,
	#superclass : #CIMAbstractQuery,
	#category : #'CIMTicketsAnalyse-Queries-Dev'
}

{ #category : #running }
QueryNumberOfTicketsWithReturns >> runOn: aTicketGroupNode [
	^ aTicketGroupNode tickets count: [ :each | each ft_nbretour ~= '0' ]
]
