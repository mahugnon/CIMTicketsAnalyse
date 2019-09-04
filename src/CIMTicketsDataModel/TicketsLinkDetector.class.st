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
	^ model
		do: [ :ticket | ticket connectedTickets: (self findLinks: ticket) ]
]

{ #category : #api }
TicketsLinkDetector >> findLinks: aTbl_ft_row [
	| result |
	aTbl_ft_row ft_lienft_list
		ifNotNil: [ result := model
				select: [ :tkt | 
					((',' split: aTbl_ft_row ft_lienft_list) collect: #asInteger)
						includes: tkt ft_id asInteger ] ].
	^ result
]

{ #category : #accessing }
TicketsLinkDetector >> model: aCollection [
	model := aCollection
]
