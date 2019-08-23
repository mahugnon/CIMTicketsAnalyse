Class {
	#name : #QueryTicketsForInterestionFileNames,
	#superclass : #CIMAbstractQuery,
	#category : #'CIMTicketsAnalyse-Queries'
}

{ #category : #running }
QueryTicketsForInterestionFileNames >> runOn: aCollection nameLime: aLimit [
	^ ((QueryInterestingFileNames new
		limit: aLimit;
		runOn: (QueryAllTicketsFiles runOn: aCollection))
		collect: [ :fileName | 
			fileName
				->
					(aCollection
						select: [ :ticket | 
							ticket associatedPhysique isNotNil
								and: [ ticket associatedPhysique includes: fileName ] ]) ])
		asOrderedDictionary
]
