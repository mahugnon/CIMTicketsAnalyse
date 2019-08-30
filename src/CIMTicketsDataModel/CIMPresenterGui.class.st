Class {
	#name : #CIMPresenterGui,
	#superclass : #SpPresenter,
	#instVars : [
		'roassalPresenterList',
		'roassaPresennter',
		'nodePresent'
	],
	#category : #'CIMTicketsDataModel-Gui'
}

{ #category : #specs }
CIMPresenterGui class >> defaultSpec [
	^ SpPanedLayout newVertical
		add: #roassalPresenterList;
		add:
			(SpPanedLayout newHorizontal
				add: #roassaPresennter;
				add: #nodePresent;
				yourself);
		yourself
]

{ #category : #specs }
CIMPresenterGui class >> example [
	<example>
	self new openWithSpec
]

{ #category : #specs }
CIMPresenterGui class >> title [ 
^'Ticket correlation'
]

{ #category : #initialization }
CIMPresenterGui >> initializeWidgets [
	roassalPresenterList := self  newList.
	roassaPresennter :=self newCode.
	nodePresent := self newList .
]

{ #category : #accessing }
CIMPresenterGui >> nodePresent [
	^ nodePresent
]

{ #category : #accessing }
CIMPresenterGui >> roassaPresennter [
	^ roassaPresennter
]

{ #category : #accessing }
CIMPresenterGui >> roassalPresenterList [
	^ roassalPresenterList
]
