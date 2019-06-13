Class {
	#name : #QueryAvgTimeOnPerBibliotheque,
	#superclass : #CIMAbstractQuery,
	#category : #CIMTicketsAnalyse
}

{ #category : #running }
QueryAvgTimeOnPerBibliotheque >> runOn: aCollection [
	^ aCollection
		collect: [ :bib | 
			bib name
				-> (QueryAvgTimeOnTickets new runOn: bib tickets) ]
]
