Class {
	#name : #TicketsLinkDetector,
	#superclass : #Object,
	#instVars : [
		'model'
	],
	#category : #'CIMTicketsDataModel-Utils'
}

{ #category : #API }
TicketsLinkDetector >> connectAllLinkedTickets [
	^ model rows
		do:
			[ :ticket | ticket connectedTickets: (self findLinks: ticket) ]
]

{ #category : #api }
TicketsLinkDetector >> findLinks: aTbl_ft_row [
	| result |
	aTbl_ft_row ft_lienft_list
		ifNotNil: [ result := model rows
				select: [ :tkt | 
					((',' split: aTbl_ft_row ft_lienft_list) collect: #asInteger)
						includes:
							(tkt ft_id copyReplaceAll: (Character value: 160) asString with: '')
								asInteger ] ].
	^ result
]

{ #category : #accessing }
TicketsLinkDetector >> model: aCollection [
	model := aCollection
]
