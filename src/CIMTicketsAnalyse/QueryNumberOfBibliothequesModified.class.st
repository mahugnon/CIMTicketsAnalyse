Class {
	#name : #QueryNumberOfBibliothequesModified,
	#superclass : #CIMAbstractQuery,
	#category : #'CIMTicketsAnalyse-Queries-Bibliotheque'
}

{ #category : #running }
QueryNumberOfBibliothequesModified >> runOn: aCollection [
	^ aCollection
		inject: 0
		into: [ :sum :ticket | sum + ticket numberOfBibliotheques ]
]
