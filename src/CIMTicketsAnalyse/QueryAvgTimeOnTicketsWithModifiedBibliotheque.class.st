Class {
	#name : #QueryAvgTimeOnTicketsWithModifiedBibliotheque,
	#superclass : #CIMAbstractQuery,
	#category : #'CIMTicketsAnalyse-Queries-Bibliotheque'
}

{ #category : #running }
QueryAvgTimeOnTicketsWithModifiedBibliotheque >> runOn: aCollection [
	^ ((QueryAvgTimeOnTickets runOn: aCollection)
		/ (QueryAvgNumberOfBibliothequesModified runOn: aCollection))
		asFloat
]
