Class {
	#name : #QueryAvgTimeOnPerBibliotheque,
	#superclass : #CIMAbstractQuery,
	#category : #'CIMTicketsAnalyse-Queries'
}

{ #category : #running }
QueryAvgTimeOnPerBibliotheque >> runOn: aCollection [
	^ aCollection
		collect: [ :bib | 
			bib name
				-> (QueryAvgTimeOnTickets new runOn: bib tickets) ]
]
