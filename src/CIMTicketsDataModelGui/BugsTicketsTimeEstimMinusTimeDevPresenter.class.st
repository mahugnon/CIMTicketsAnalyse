Class {
	#name : #BugsTicketsTimeEstimMinusTimeDevPresenter,
	#superclass : #TimeEstimMinusTimeDevPresenter,
	#category : #'CIMTicketsDataModelGui-Roassals'
}

{ #category : #specs }
BugsTicketsTimeEstimMinusTimeDevPresenter class >> run [
	<example>
	self new openWithSpec
]

{ #category : #initialize }
BugsTicketsTimeEstimMinusTimeDevPresenter >> selectQuery [
	^ QueryBugs
]
