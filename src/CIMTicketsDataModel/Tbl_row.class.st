Class {
	#name : #'Tbl_row',
	#superclass : #Object,
	#category : #'CIMTicketsDataModel-Model'
}

{ #category : #initialization }
Tbl_row >> convertDoubleSlashFormat: arg1 [
	| tmp1 |
	tmp1 := '//' split: arg1.
	^ ((tmp1 at: 2) asInteger * 28800 + ((tmp1 at: 3) asInteger * 3600)
		+ ((tmp1 at: 4) asInteger * 60)) asDuration
]

{ #category : #initialization }
Tbl_row >> convertHourFormat: arg1 [
	| tmp1 |
	tmp1 := ' ' split: arg1.
	^ (tmp1 first asInteger * 3600) asDuration
]

{ #category : #initialization }
Tbl_row >> convertHourMinuteFormat: arg1 [
	| tmp1 |
	tmp1 := 'H' split: arg1.
	^ (tmp1 first asInteger * 3600 + (tmp1 second asInteger * 60))
		asDuration
]

{ #category : #initialization }
Tbl_row >> convertMinuteFormat: arg1 [
	| tmp1 |
	tmp1 := ' ' split: arg1.
	^ (tmp1 first asInteger * 60) asDuration
]

{ #category : #initialization }
Tbl_row >> initializeWith: arg1 [
	arg1
		keysDo: [ :arg2 | self perform: (arg2 , ':') asSymbol with: (arg1 at: arg2) ]
]
