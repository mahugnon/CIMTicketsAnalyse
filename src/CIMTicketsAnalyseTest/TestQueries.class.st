Class {
	#name : #TestQueries,
	#superclass : #CIMAbstractModelTest,
	#instVars : [
		'devolopeurs'
	],
	#category : #CIMTicketsAnalyseTest
}

{ #category : #running }
TestQueries >> setDevelopers [
	devolopeurs := OrderedCollection new
		add:
			(Tbl_devIzy_row basicNew
				instVarAt: 1 put: 'Yoann';
				instVarAt: 2 put: 'ACKET';
				instVarAt: 3 put: '4 August 2011' asDate;
				instVarAt: 4 put: nil;
				yourself);
		add:
			(Tbl_devIzy_row basicNew
				instVarAt: 1 put: 'Marielle';
				instVarAt: 2 put: 'ADAMOWICZ';
				instVarAt: 3 put: '4 August 2011' asDate;
				instVarAt: 4 put: nil;
				yourself);
		add:
			(Tbl_devIzy_row basicNew
				instVarAt: 1 put: 'Frederick';
				instVarAt: 2 put: 'AMRI';
				instVarAt: 3 put: '19 October 2010' asDate;
				instVarAt: 4 put: '21 October 2010' asDate;
				yourself);
		add:
			(Tbl_devIzy_row basicNew
				instVarAt: 1 put: 'Ibrahima';
				instVarAt: 2 put: 'BAH';
				instVarAt: 3 put: '19 October 2010' asDate;
				instVarAt: 4 put: '9 February 2012' asDate;
				yourself);
		add:
			(Tbl_devIzy_row basicNew
				instVarAt: 1 put: 'Romain';
				instVarAt: 2 put: 'BOUILLARD';
				instVarAt: 3 put: '1 December 2003' asDate;
				instVarAt: 4 put: '30 November 2006' asDate;
				yourself);
		add:
			(Tbl_devIzy_row basicNew
				instVarAt: 1 put: 'Akli';
				instVarAt: 2 put: 'BRAHIMI';
				instVarAt: 3 put: '25 January 1985' asDate;
				instVarAt: 4 put: '31 August 2011' asDate;
				yourself);
		add:
			(Tbl_devIzy_row basicNew
				instVarAt: 1 put: 'Alain';
				instVarAt: 2 put: 'CLEMENT';
				instVarAt: 3 put: '1 June 2002' asDate;
				instVarAt: 4 put: '31 August 2008' asDate;
				yourself);
		add:
			(Tbl_devIzy_row basicNew
				instVarAt: 1 put: 'Lo�c';
				instVarAt: 2 put: 'CUVELIER';
				instVarAt: 3 put: nil;
				instVarAt: 4 put: nil;
				yourself);
		add:
			(Tbl_devIzy_row basicNew
				instVarAt: 1 put: 'Mickael';
				instVarAt: 2 put: 'DAVID';
				instVarAt: 3 put: '8 October 2012' asDate;
				instVarAt: 4 put: '30 October 2015' asDate;
				yourself);
		add:
			(Tbl_devIzy_row basicNew
				instVarAt: 1 put: 'Jean-Patrick';
				instVarAt: 2 put: 'DEBAENE';
				instVarAt: 3 put: '19 October 2010' asDate;
				instVarAt: 4 put: nil;
				yourself);
		yourself
]

{ #category : #running }
TestQueries >> setUp [
	super setUp.
	self setDevelopers.
	tps joinTypeSessionToTps: typeSessions.
	tickets joinTpsDevToTicket: tps
]

{ #category : #tests }
TestQueries >> testQueryNumberofDeveloperForAmonth [
self assert: (QueryNumberOfDeveloppeurForAmonth new runOn: devolopeurs  for: (Date asMonth: 7 inYear:2007)  ) equals: 2.
self assert: (QueryNumberOfDeveloppeurForAmonth new runOn: devolopeurs  for: (Date asMonth: 9 inYear:2011)  ) equals: 4
]

{ #category : #tests }
TestQueries >> testQueryTicketByConsistentOrNotFeedBacks [
	| ticketGroup |
	retours joinTypeRetoursToRetours: typeRetours.
	tickets joinRetourToTickets: retours.
	ticketGroup := CIMTicketGroupNode new tickets: tickets rows.
	self
		assert: (QueryTicketByConsistentOrNotFeedBacks runOn: ticketGroup) keys first
		equals: 'Consistent'
]

{ #category : #tests }
TestQueries >> testQueryTicketsByFeedBacks [
	| ticketGroup |
	retours joinTypeRetoursToRetours: typeRetours.
	tickets joinRetourToTickets: retours.
	ticketGroup := CIMTicketGroupNode new tickets: tickets rows.
	self
		assert:
			((QueryTicketsByFeedBacks runOn: ticketGroup) keys
				includes: 'Fiche incomplète')
]

{ #category : #tests }
TestQueries >> testQueyTimeRCTest [
	tps joinTypeSessionToTps: typeSessions.
	"tickets joinTpsDevToTicket: tps."
	tickets joinTestToTicket: tests.
	tests joinTpsToTest: tps.
	self
		assert:
			(QueryTpsRCTest runOn: (CIMTicketGroupNode new tickets: tickets rows))
				size
		equals: 3
]

{ #category : #tests }
TestQueries >> testScaledAverge [
	| col scaledAvg |
	col := OrderedCollection new.
	1 to: 11 do: [ :i | 
		col
			add:
				(CIMAverageNode new
					value: i;
					time: i;
					yourself) ].
	scaledAvg := ((QueryMovingAverage new runOn: col)
		collect: [ :node | node time -> node value ]) asOrderedDictionary.
	self assert: scaledAvg size equals: 7.
	self assert: (scaledAvg at: 3) value equals: 3.
	self assert: (scaledAvg at: 4) value equals: 4.
	self assert: (scaledAvg at: 5) value equals: 5.
	self assert: (scaledAvg at: 9) value equals: 9
]
