Class {
	#name : #QueryAvgTimeOnTicketsWithModifiedBibliotheque,
	#superclass : #CIMAbstractQuery,
	#category : #'CIMTicketsAnalyse-Queries-Bibliotheque'
}

{ #category : #running }
QueryAvgTimeOnTicketsWithModifiedBibliotheque >> runOn: aCollection [
	| avgBib |
	avgBib := QueryAvgNumberOfBibliothequesModified runOn: aCollection.
	^ avgBib = 0
		ifTrue: [ QueryAvgTimeOnTickets runOn: aCollection ]
		ifFalse: [ ((QueryAvgTimeOnTickets runOn: aCollection) / avgBib) asFloat ]
]
