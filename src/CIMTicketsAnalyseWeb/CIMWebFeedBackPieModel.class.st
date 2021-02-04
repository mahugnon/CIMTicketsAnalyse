Class {
	#name : #CIMWebFeedBackPieModel,
	#superclass : #CIMWebAbstractModel,
	#instVars : [
		'modelData',
		'totalFeedBack',
		'feedBacksData',
		'feedBacks'
	],
	#category : #'CIMTicketsAnalyseWeb-models'
}

{ #category : #accessing }
CIMWebFeedBackPieModel class >> resetCurrent [
	<script>
	super resetCurrent.
	^ self current
]

{ #category : #accessing }
CIMWebFeedBackPieModel >> feedBacksData [
	^ feedBacksData
]

{ #category : #initialization }
CIMWebFeedBackPieModel >> initialize [
	super initialize.
	self modelData.
	self totalFeedBacks.
	self initializeConsistentFeedBacksPercent
]

{ #category : #initialization }
CIMWebFeedBackPieModel >> initializeConsistentFeedBacksPercent [
	feedBacks := QueryTicketByConsistentOrNotFeedBacks runOn: modelData.
	feedBacksData := {('Inconsistent'
		-> self percentInconsistentFeedBacks).
	('Consistent' -> self percentConsistentFeedBacks).
	('Non categorized' -> self percentNonCategorizeFeedBack)}
]

{ #category : #initialization }
CIMWebFeedBackPieModel >> modelData [
	modelData := CIMTicketGroupNode new
		tickets: CIMDatabase database allTickets;
		yourself
]

{ #category : #initialization }
CIMWebFeedBackPieModel >> percentConsistentFeedBacks [
	^ ((feedBacks at: 'Consistent') size * 100 / totalFeedBack
		printShowingDecimalPlaces: 2) asNumber
]

{ #category : #initialization }
CIMWebFeedBackPieModel >> percentInconsistentFeedBacks [
	^ ((feedBacks at: 'Inconsistent') size * 100 / totalFeedBack
		printShowingDecimalPlaces: 2) asNumber
]

{ #category : #initialization }
CIMWebFeedBackPieModel >> percentNonCategorizeFeedBack [
	^ 100
		- (self percentConsistentFeedBacks + self percentInconsistentFeedBacks)
]

{ #category : #initialization }
CIMWebFeedBackPieModel >> totalFeedBacks [
	totalFeedBack := (QueryTicketHasFeedBacks runOn: modelData) size
]
