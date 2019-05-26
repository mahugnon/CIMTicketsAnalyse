Class {
	#name : #'Tbl_row',
	#superclass : #Object,
	#category : #CIMTicketsDataModel
}

{ #category : #initialization }
Tbl_row >> initializeWith: aDictionary [
	aDictionary
		keysDo: [ :key | self perform: (key , ':') asSymbol with: (aDictionary at: key) ]
]
