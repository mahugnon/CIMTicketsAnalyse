Class {
	#name : #QueryTicketHasFeedBacks,
	#superclass : #CIMAbstractQuery,
	#category : #'CIMTicketsAnalyse-Queries'
}

{ #category : #running }
QueryTicketHasFeedBacks >> runOn: aCIMTicketGroupNode [
	^ CIMTicketGroupNode new
		tickets:
			((QueryCleanData runOn: aCIMTicketGroupNode) tickets
				select:
					[ :ticket | ticket ft_datecrea >= CIMDatabase database tbl_retour dateFirstRetour ]);
		yourself
]
