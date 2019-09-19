Class {
	#name : #CIMTicketNodeForm,
	#superclass : #CIMFormFactory,
	#instVars : [
		'creationDate',
		'creationDateValue',
		'closingDate',
		'closingDateValue',
		'totalTimeSpent',
		'totalTimeSpentValue',
		'timeDevDev',
		'timeDevDevValue',
		'timeDevTest',
		'timeDevTestValue',
		'timeTest',
		'timeTestValue',
		'library',
		'libraryValue'
	],
	#category : #'CIMTicketsDataModelGui-Gui'
}

{ #category : #specs }
CIMTicketNodeForm class >> defaultSpec [
	^ SpBoxLayout newVertical
		add: #cimTitle;
		add:
			(SpBoxLayout newHorizontal
				add: #creationDate
					withConstraints: [ :constraints | constraints height: self labelledPresenterHeight ];
				add: #creationDateValue
					withConstraints: [ :constraints | constraints height: self labelledPresenterHeight ];
				yourself);
		add:
			(SpBoxLayout newVertical
				add: #closingDate
					withConstraints: [ :constraints | constraints height: self labelledPresenterHeight ];
				add: #closingDateValue
					withConstraints: [ :constraints | constraints height: self labelledPresenterHeight ];
				yourself);
		add:
			(SpBoxLayout newVertical
				add: #totalTimeSpent
					withConstraints: [ :constraints | constraints height: self labelledPresenterHeight ];
				add: #totalTimeSpentValue
					withConstraints: [ :constraints | constraints height: self labelledPresenterHeight ];
				yourself);
		add:
			(SpBoxLayout newVertical
				add: #timeDevDev
					withConstraints: [ :constraints | constraints height: self labelledPresenterHeight ];
				add: #timeDevDevValue
					withConstraints: [ :constraints | constraints height: self labelledPresenterHeight ];
				yourself);
		add:
			(SpBoxLayout newVertical
				add: #timeDevTest
					withConstraints: [ :constraints | constraints height: self labelledPresenterHeight ];
				add: #timeDevTestValue
					withConstraints: [ :constraints | constraints height: self labelledPresenterHeight ];
				yourself);
		add:
			(SpBoxLayout newVertical
				add: #timeTest
					withConstraints: [ :constraints | constraints height: self labelledPresenterHeight ];
				add: #timeTestValue
					withConstraints: [ :constraints | constraints height: self labelledPresenterHeight ];
				yourself);
		add:
			(SpBoxLayout newVertical
				add: #library
					withConstraints: [ :constraints | constraints height: self labelledPresenterHeight ];
				add: #libraryValue
					withConstraints: [ :constraints | constraints height: self labelledPresenterHeight ];
				yourself);
		yourself
]

{ #category : #examples }
CIMTicketNodeForm class >> run [
	<example>
	self new openWithSpec
]

{ #category : #initialization }
CIMTicketNodeForm >> initializeWidgets [
	super initializeWidgets.
	creationDate := self newLabel
		label: 'Creation date:';
		emphasis;
		yourself.
	creationDateValue := self newLabel.
	closingDate := self newLabel
		label: 'Closing date:';
		emphasis;
		yourself.
	closingDateValue := self newLabel.
	totalTimeSpent := self newLabel
		label: 'Total time spent:';
		emphasis;
		yourself.
	totalTimeSpentValue := self newLabel.
	timeDevDev := self newLabel
		label: 'Time dev dev:';
		emphasis;
		yourself.
	timeDevDevValue := self newLabel.
	timeDevTest := self newLabel
		label: 'Time dev test:';
		emphasis;
		yourself.
	timeDevTestValue := self newLabel.
	timeTest := self newLabel
		label: 'Time test after Dev:';
		emphasis;
		yourself.
	timeTestValue := self newLabel.
	library := self newLabel
		label: 'PB Library:';
		emphasis;
		yourself.
	libraryValue := self newLabel
]

{ #category : #accessing }
CIMTicketNodeForm >> updateValues [
	creationDateValue
		label:
			('Ticket numero ' , model ft_numordre , ' crée le '
				, model ft_datecrea).
		 closingDateValue label: model monthClosing asString .
		 totalTimeSpentValue label: model totalTps asString.
				timeDevDevValue label: model devTpsDev asString.
				 timeDevTestValue label: model devTpsTest asString .
				timeTestValue  label: model 
				
]
