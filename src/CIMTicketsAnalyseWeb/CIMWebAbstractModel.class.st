Class {
	#name : #CIMWebAbstractModel,
	#superclass : #Object,
	#instVars : [
		'modules'
	],
	#category : #CIMTicketsAnalyseWeb
}

{ #category : #'as yet unclassified' }
CIMWebAbstractModel >> moduleGroupByBugsTime [
	^ (Tbl tbl_Module rows
		collect: [ :module | 
			module nom
				->
					(QueryTicketsTimeDev
						runOn: (QueryBugs runOn: (CIMTicketGroupNode new tickets: module tickets))) ])
		sorted: [ :a :b | a value > b value ]
]

{ #category : #'as yet unclassified' }
CIMWebAbstractModel >> moduleGroupByTime [
	modules := ((Tbl tbl_Module rows
		collect: [ :module | 
			module nom
				->
					(QueryTicketsTimeDev
						runOn:
							(QueryBugsEvolutions
								runOn: (CIMTicketGroupNode new tickets: module tickets))) ])
		sorted: [ :a :b | a value > b value ]) asOrderedCollection
]

{ #category : #accessing }
CIMWebAbstractModel >> modules [
	^ modules
]

{ #category : #accessing }
CIMWebAbstractModel >> modules: anObject [
	modules := anObject
]

{ #category : #'as yet unclassified' }
CIMWebAbstractModel >> percentModuleBugsTime [
	| total |
	modules ifNil: [ modules := self moduleGroupByTime ].
	total := (modules collect: #value) sum.
	^ modules
		collect:
			[ :ass | ass key -> ((ass value * 100 / total) asFloat truncateTo: 2) ]
]
