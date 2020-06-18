Extension { #name : #AbstractFileReference }

{ #category : #'*CIMTicketsDataModelUtils' }
AbstractFileReference >> visibleFiles [
	^ self files reject: [ :aFile | aFile basename first = $. ]
]
