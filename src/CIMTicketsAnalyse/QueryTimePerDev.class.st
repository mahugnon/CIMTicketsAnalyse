Class {
	#name : #QueryTimePerDev,
	#superclass : #CIMAbstractQuery,
	#category : #'CIMTicketsAnalyse-Queries'
}

{ #category : #running }
QueryTimePerDev >> runOn: aDictionary [
	"I receive a time serie dictionary"

	^ (aDictionary keys
		collect: [ :key | 
			key
				->
					((aDictionary at: key)
						/
							(QueryNumberOfDeveloppeurForAmonth new
								runOn: (Tbl tables at: 12) rows
								for: key)) ]) asOrderedDictionary
]
