Class {
	#name : #QueryTicketsAndAssociatedFileFromMooseModel,
	#superclass : #CIMAbstractQuery,
	#category : #'CIMTicketsAnalyse-MooseQueries'
}

{ #category : #running }
QueryTicketsAndAssociatedFileFromMooseModel >> runOn: aFamixPWBTicketCollection [
	^ (aFamixPWBTicketCollection
		collect: [ :fmTicket | 
			fmTicket number
				->
					(fmTicket ticketAssociations
						collectAsSet: [ :assoc | assoc majorObject name ]) ])
		asDictionary
]
