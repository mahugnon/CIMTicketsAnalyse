Class {
	#name : #QueryReleaseDateFromFolder,
	#superclass : #CIMAbstractQuery,
	#category : #'CIMTicketsAnalyse-Queries'
}

{ #category : #running }
QueryReleaseDateFromFolder >> runOn: aFolder [
	^ ((aFolder asFileReference visibleFiles collect: #basename)
		collect: [ :e | 
			| date |
			date := ('_' split: e) first.
			e
				->
					(Date
						newDay: (date copyFrom: 7 to: 8) asInteger
						month: (date copyFrom: 5 to: 6) asInteger
						year: (date copyFrom: 1 to: 4) asInteger) ]) asOrderedDictionary
]
