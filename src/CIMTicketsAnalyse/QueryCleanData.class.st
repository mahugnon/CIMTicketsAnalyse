"
I am a tool to clean CIM data
"
Class {
	#name : #QueryCleanData,
	#superclass : #CIMAbstractQuery,
	#category : #'CIMTicketsAnalyse-Queries'
}

{ #category : #'as yet unclassified' }
QueryCleanData >> rejectNilCreationDate: aTicketGroupNode [
	^ aTicketGroupNode
		tickets: (aTicketGroupNode tickets reject: [ :ft | ft ft_datecrea isNil ]);
		yourself
]

{ #category : #'as yet unclassified' }
QueryCleanData >> rejectVersionWithNilDateArret: aCollection [
	^ aCollection reject: [ :version | version version_date_arret isNil ]
]

{ #category : #'as yet unclassified' }
QueryCleanData >> rejectWrongClosingDate: aTicketGroupNode [
	^ aTicketGroupNode
		tickets:
			(aTicketGroupNode tickets
				select: [ :ft | 
					ft monthClosing
						ifNotNil: [ :date | date year >= 2000 ]
						ifNil: [ true ] ]);
		yourself
]

{ #category : #running }
QueryCleanData >> runOn: aCollection [
	^ self
		rejectWrongClosingDate: (self rejectNilCreationDate: aCollection)
]
