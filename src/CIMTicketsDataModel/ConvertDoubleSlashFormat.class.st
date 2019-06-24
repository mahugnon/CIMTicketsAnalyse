Class {
	#name : #ConvertDoubleSlashFormat,
	#superclass : #CIMDateFormatConverter,
	#category : #'CIMTicketsDataModel-converters'
}

{ #category : #utility }
ConvertDoubleSlashFormat class >> supportedFormat [
	^ '//.*'
]

{ #category : #converting }
ConvertDoubleSlashFormat >> convert: arg1 [
	| tmp1 |
	tmp1 := '//' split: arg1.
	^ ((tmp1 at: 2) asInteger * 27000 + ((tmp1 at: 3) asInteger * 3600)
		+ ((tmp1 at: 4) asInteger * 60)) asDuration
]
