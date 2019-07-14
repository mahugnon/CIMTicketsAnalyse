Extension { #name : #AbstractFileReference }

{ #category : #'*CIMTicketsDataModel' }
AbstractFileReference >> visibleFiles [
	^ self files reject: [ :aFile | aFile basename first = $. ]
]
