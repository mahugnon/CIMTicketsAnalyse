Class {
	#name : #CIMRoassalSelectedNodePresenter,
	#superclass : #CIMGroupPresenter,
	#category : #'CIMTicketsDataModelGui-Gui'
}

{ #category : #initialization }
CIMRoassalSelectedNodePresenter >> initializeWidgets [
	table := self newTreeTable.
	
]

{ #category : #accessing }
CIMRoassalSelectedNodePresenter >> model: anObject [
model := anObject.
]

{ #category : #initialization }
CIMRoassalSelectedNodePresenter >> setUpTable [
	table
		roots: {model data};
		children: [ :aNode | aNode ifNotEmpty: [ aNode content ] ]
]

{ #category : #updating }
CIMRoassalSelectedNodePresenter >> update [
	self setUpTable
]
