Extension { #name : #AbstractFileReference }

{ #category : #'*CIMTicketsDataModel' }
AbstractFileReference >> visibleFiles [
	^ self files reject: [ :arg1 | arg1 basename first = $. ]
]
