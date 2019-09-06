Class {
	#name : #TestTicketsModel,
	#superclass : #CIMAbstractModelTest,
	#category : #CIMTicketsAnalyseTest
}

{ #category : #tests }
TestTicketsModel >> testConnectAllLinkedTickets [
	| ticketsWithLink |
	ticketsWithLink := (TicketsLinkDetector new model: tickets)
		connectAllLinkedTickets
		select: [ :each | each connectedTickets isNotNil ].
	self assert: ticketsWithLink size equals: 1.
	self assert: ticketsWithLink anyOne equals: tickets rows first
]

{ #category : #tests }
TestTicketsModel >> testGetLinkedTicket [
	self
		assertCollection:
			((TicketsLinkDetector new model: tickets)
				findLinks: tickets rows first)
		hasSameElements:
			{tickets rows second.
			tickets rows third}
]

{ #category : #tests }
TestTicketsModel >> testJoinTpsDevToTicket [
	self
		assert:
			(((tickets joinTpsDevToTicket: tps) rows collect: #devTps)
				reject: #isEmpty) size
		equals: 2
]
