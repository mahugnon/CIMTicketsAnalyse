Class {
	#name : #CIMRoassalSelectedNodePresenter,
	#superclass : #CIMGroupPresenter,
	#category : #'CIMTicketsDataModelGui-Gui'
}

{ #category : #initialization }
CIMRoassalSelectedNodePresenter >> initializeWidgets [
	table := self newTreeTable.
	table
		roots: {};
		children: [ :aNode | aNode ]
]

{ #category : #accessing }
CIMRoassalSelectedNodePresenter >> model: anObject [
model := anObject.
]

{ #category : #initialization }
CIMRoassalSelectedNodePresenter >> setUpTable [
	table
		roots: {model data};
		children: [ :aNode | aNode content ]
]

{ #category : #updating }
CIMRoassalSelectedNodePresenter >> update [
	self setUpTable
]

{ #category : #api }
CIMRoassalSelectedNodePresenter >> whenRootsChangedDo: aBlockClosure [
	table whenRootsChangedDo: aBlockClosure
]
