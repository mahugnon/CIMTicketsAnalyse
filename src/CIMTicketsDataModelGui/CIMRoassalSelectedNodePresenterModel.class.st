Class {
	#name : #CIMRoassalSelectedNodePresenterModel,
	#superclass : #CIMGroupPresenterModel,
	#instVars : [
		'roassalSelectedNodePresenter'
	],
	#category : #'CIMTicketsDataModelGui-Models'
}

{ #category : #'as yet unclassified' }
CIMRoassalSelectedNodePresenterModel >> notify [
roassalSelectedNodePresenter update
]

{ #category : #'as yet unclassified' }
CIMRoassalSelectedNodePresenterModel >> rightUpdateWith: aCIMTicketsNode [
	data := aCIMTicketsNode.
	self notify
]

{ #category : #accessing }
CIMRoassalSelectedNodePresenterModel >> roassalSelectedNodePresenter [
	^ roassalSelectedNodePresenter
]

{ #category : #accessing }
CIMRoassalSelectedNodePresenterModel >> roassalSelectedNodePresenter: anObject [
	roassalSelectedNodePresenter := anObject
]
