Class {
	#name : #QueryAvgNumberOfBibliothequeModifiedGroupedByTime,
	#superclass : #TimeSerieQueries,
	#category : #'CIMTicketsAnalyse-Queries-Bibliotheque'
}

{ #category : #running }
QueryAvgNumberOfBibliothequeModifiedGroupedByTime >> runOn: aDictionary [
	^ (aDictionary keys
		collect: [ :key | 
			key
				-> (QueryAvgNumberOfBibliothequesModified runOn: (aDictionary at: key)) ])
		asOrderedDictionary
]
