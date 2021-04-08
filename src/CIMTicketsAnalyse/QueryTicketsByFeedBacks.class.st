Class {
	#name : #QueryTicketsByFeedBacks,
	#superclass : #CIMAbstractQuery,
	#category : #'CIMTicketsAnalyse-Queries'
}

{ #category : #running }
QueryTicketsByFeedBacks >> runOn: aCIMTicketGroupNode [
	| typeRetours tickets|
	tickets := aCIMTicketGroupNode tickets.
	typeRetours := tickets flatCollect: #typeRetours.
	^ (typeRetours
		collect: [ :typeRetour | 
			typeRetour libelle
				->
					(tickets select: [ :ticket | ticket typeRetours includes: typeRetour ]) ])
		asOrderedDictionary
]
