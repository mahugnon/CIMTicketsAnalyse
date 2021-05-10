Class {
	#name : #QueryTicketWithRetourPerYearClosing,
	#superclass : #QueryPerYear,
	#category : #'CIMTicketsAnalyse-Queries'
}

{ #category : #running }
QueryTicketWithRetourPerYearClosing >> runOn: aCIMTicketGroup [
	^ QueryTicketPerYearClosing new
		runOn: (QueryClosed runOn: (QueryCleanData runOn: aCIMTicketGroup))
]

{ #category : #'as yet unclassified' }
QueryTicketWithRetourPerYearClosing >> runOn: aCIMTicketGroup exportTo: aPathString [
	| groups |
	groups := self runOn: aCIMTicketGroup.
	aPathString asFileReference
		writeStreamDo: [ :stream | 
			stream
				<< 'Annee';
				space;
				<< 'NombreDeTicketsFermes';
				space;
				<< 'NombreDeTicketsAvecRetours';
				space;
				<< 'NombreDeRetours';
				crlf.
			groups
				do: [ :group | 
					group numberOfTicketsWithRetours > 0
						ifTrue: [ stream
								<< group time asString;
								space;
								<< group tickets size asString;
								space.
							stream
								<< group numberOfTicketsWithRetours asString;
								space;
								<< group totalNumberOfRetours asString;
								crlf ] ] ]
]

{ #category : #running }
QueryTicketWithRetourPerYearClosing >> year: aTicket [

]
