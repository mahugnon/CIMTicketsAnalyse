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
TestTicketsModel >> testJoinBibsToTickets [
	self
		assert:
			((tickets joinBibsToTicket: bibliotheques) rows
				select: [ :ft | ft bibliotheques isNotEmpty ]) size
		equals: 2
]

{ #category : #tests }
TestTicketsModel >> testJoinBibsToTickets1 [
	self
		assert:
			(tickets joinBibsToTicket: bibliotheques) rows first bibliotheques
				size
		equals: 3
]

{ #category : #tests }
TestTicketsModel >> testJoinDevToTickets [
	self
		assert:
			((tickets joinDevToTicket: devs) rows
				select: [ :ft | ft dev isNotNil ]) size
		equals: 2
]

{ #category : #tests }
TestTicketsModel >> testJoinTpsDevToTicket [
	self
		assert:
			((tickets joinTpsDevToTicket: tps) rows collect: #timeDev) flatten
				size
		equals: 4
]

{ #category : #tests }
TestTicketsModel >> testJoinTypeCorrectionToTickets [
	self
		assert:
			((tickets joinTypeCorrectionToTicket: typeCorrs) rows
				select: [ :ft | ft typeCorrection isNotNil ]) size
		equals: 3
]

{ #category : #tests }
TestTicketsModel >> testJoinVersionsToTickets [
	self
		deny:
			(tickets joinVersionsToTicket: versions) rows first versions
				isNotEmpty
]

{ #category : #tests }
TestTicketsModel >> testJoinVersionsToTickets1 [
	self
		assert:
			(tickets joinVersionsToTicket: versions) rows second versions
				isNotEmpty
]

{ #category : #tests }
TestTicketsModel >> testJoinVersionsToTickets2 [
	self
		assert:
			((tickets joinVersionsToTicket: versions) rows second versions
				includes: versions rows first)
]

{ #category : #tests }
TestTicketsModel >> testTicketsDevTpsDev [
	tps joinTypeSessionToTps: typeSessions.
	tickets joinTpsDevToTicket: tps.
	self halt.
	self
		assertCollection: tickets rows first devTpsDev
		hasSameElements: {tps rows last}
]

{ #category : #tests }
TestTicketsModel >> testTicketsDevTpsTest [
	tps joinTypeSessionToTps: typeSessions.
	tickets joinTpsDevToTicket: tps.
	self
		assertCollection: tickets rows first devTpsTest
		hasSameElements: {tps rows first}
]
