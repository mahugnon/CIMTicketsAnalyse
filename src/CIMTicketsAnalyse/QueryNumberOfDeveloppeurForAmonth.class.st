"
I computer the number of developpeur for a given month . I take as parameter  aMonth a list of tbl_devIzy_row. I anInteger
"
Class {
	#name : #QueryNumberOfDeveloppeurForAmonth,
	#superclass : #CIMAbstractQuery,
	#category : #'CIMTicketsAnalyse-Queries-Dev'
}

{ #category : #running }
QueryNumberOfDeveloppeurForAmonth >> runOn: aCollection for: aMonth [
	^ (aCollection reject: [ :e | e date_entree isNil ])
		count: [ :each | 
			aMonth
				between: each date_entree month
				and: (each date_sortie ifNil: [ Date today ]) month ]
]
