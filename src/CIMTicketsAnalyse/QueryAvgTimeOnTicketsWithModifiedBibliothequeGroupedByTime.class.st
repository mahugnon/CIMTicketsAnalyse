Class {
	#name : #QueryAvgTimeOnTicketsWithModifiedBibliothequeGroupedByTime,
	#superclass : #TimeSerieQueries,
	#category : #'CIMTicketsAnalyse-Queries-Bibliotheque'
}

{ #category : #running }
QueryAvgTimeOnTicketsWithModifiedBibliothequeGroupedByTime >> runOn: aDictionary [
	^ (aDictionary keys
		collect: [ :key | 
			key
				->
					(QueryAvgTimeOnTicketsWithModifiedBibliotheque
						runOn: (aDictionary at: key)) ]) asOrderedDictionary
]
