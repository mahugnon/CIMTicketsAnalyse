Class {
	#name : #QueryTicketsAndAssociatedFileFromMooseModel,
	#superclass : #CIMAbstractQuery,
	#category : #CIMTicketsAnalyseTicketComment
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
