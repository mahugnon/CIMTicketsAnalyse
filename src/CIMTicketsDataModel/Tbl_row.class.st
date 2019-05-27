Class {
	#name : #'Tbl_row',
	#superclass : #Object,
	#category : #'CIMTicketsDataModel-Model'
}

{ #category : #initialization }
Tbl_row >> convertDoubleSlashFormat: aString [
	| result |
	result := '//' split: aString.
	^ ((result at: 2) asInteger * 28800
		+ ((result at: 3) asInteger * 3600)
		+ ((result at: 4) asInteger * 60)) asDuration
]

{ #category : #initialization }
Tbl_row >> convertHourFormat: aString [
	| result |
	result := ' ' split: aString.
	^ (result first asInteger * 3600) asDuration
]

{ #category : #initialization }
Tbl_row >> convertHourMinuteFormat: aString [
	| result |
	result := 'H' split: aString.
	^ (result first asInteger * 3600 + (result second asInteger * 60))
		asDuration
]

{ #category : #initialization }
Tbl_row >> convertMinuteFormat: aString [
	| result |
	result := ' ' split: aString.
	^ (result first asInteger  * 60) asDuration
]

{ #category : #initialization }
Tbl_row >> initializeWith: aDictionary [
	aDictionary
		keysDo: [ :key | self perform: (key , ':') asSymbol with: (aDictionary at: key) ]
]
