Class {
	#name : #QueryNumberOfDeveloppeurPerYear,
	#superclass : #CIMAbstractQuery,
	#category : #'CIMTicketsAnalyse-Queries-Dev'
}

{ #category : #running }
QueryNumberOfDeveloppeurPerYear >> runOn: devs [
	| years |
	years := (Timespan starting: '1-1-2000' asDate ending: '1-1-2022')
		years.
	^ years
		collect: [ :year | year -> (self runOn: devs for: year) size ]
		as: OrderedDictionary
]

{ #category : #running }
QueryNumberOfDeveloppeurPerYear >> runOn: devs for: aYear [
	^ (devs reject: [ :dev | dev date_entree isNil ])
		select: [ :dev | 
			| end_date |
			end_date := dev date_sortie.
			aYear
				between: dev date_entree year asYear
				and: (end_date ifNil: [ Date today ] ifNotNil: [ end_date ]) year asYear ]
]
