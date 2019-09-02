Class {
	#name : #CIMPresenterGui,
	#superclass : #SpPresenter,
	#instVars : [
		'roassalPresenterList',
		'roassaPresenter',
		'nodePresent',
		'model'
	],
	#category : #CIMTicketsDataModelGui
}

{ #category : #specs }
CIMPresenterGui class >> defaultSpec [
	^ SpBoxLayout newHorizontal
		add: #roassalPresenterList;
		add: #roassaPresenter
			withConstraints: [ :constaint | constaint width: 600 ];
		add: #nodePresent;
		yourself
]

{ #category : #specs }
CIMPresenterGui class >> run [
	<example>
	self new openWithSpec
]

{ #category : #initialization }
CIMPresenterGui >> initializeWidgets [
	model := CIMPresenterGuiModel new.
	roassalPresenterList := self instantiate: model dataWidget.
	roassaPresenter := self instantiate: ExampleRoassal2Spec2.
	nodePresent := self newList
]

{ #category : #accessing }
CIMPresenterGui >> roassaPresenter [
	^ roassaPresenter
]
