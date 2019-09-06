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
	self setDevelopers
]

{ #category : #tests }
TestQueries >> testQueryNumberofDeveloperForAmonth [
self assert: (QueryNumberOfDeveloppeurForAmonth new runOn: devolopeurs  for: (Date asMonth: 7 inYear:2007)  ) equals: 2.
self assert: (QueryNumberOfDeveloppeurForAmonth new runOn: devolopeurs  for: (Date asMonth: 9 inYear:2011)  ) equals: 4
]

{ #category : #tests }
TestQueries >> testQueryTimeDevTest [
	
]
