Class {
	#name : #QueryTpsRCTest,
	#superclass : #CIMAbstractQuery,
	#category : #'CIMTicketsAnalyse-Queries'
}

{ #category : #running }
QueryTpsRCTest >> runOn: aTicketGroupNode [
	^ aTicketGroupNode tickets flatCollect: #rcTpsTest
]
