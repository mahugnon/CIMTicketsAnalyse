Class {
	#name : #'Tbl_row',
	#superclass : #Object,
	#category : #'CIMTicketsDataModel-Model'
}

{ #category : #formatting }
Tbl_row >> formatFieldsToCIMDate [
	^ self subclassResponsibility
]

{ #category : #initialization }
Tbl_row >> initializeWith: aDictionary [
	aDictionary
		keysDo: [ :key | 
			self
				perform: (key asLowercase , ':') asSymbol
				with: (aDictionary at: key) ]
]
