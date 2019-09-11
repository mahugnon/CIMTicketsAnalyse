Class {
	#name : #EvolutionTicketsTimeEstimMinusTimeDevPresenter,
	#superclass : #TimeEstimMinusTimeDevPresenter,
	#category : #'CIMTicketsDataModelGui-Roassals'
}

{ #category : #specs }
EvolutionTicketsTimeEstimMinusTimeDevPresenter class >> run [
	<example>
	self new openWithSpec
]

{ #category : #initialize }
EvolutionTicketsTimeEstimMinusTimeDevPresenter >> selectQuery [
	^ QueryEvolutions
]
