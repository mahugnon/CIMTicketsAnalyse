Class {
	#name : #ConvertDoubleSlashFormat,
	#superclass : #AbstractCIMDateFormatConverter,
	#category : #'CIMTicketsDataModel-converters'
}

{ #category : #utility }
ConvertDoubleSlashFormat class >> supportedFormat [
	^ '//.*'
]

{ #category : #converting }
ConvertDoubleSlashFormat >> convert: aString [
	| result |
	result := '//' split: aString.
	^ ((result at: 2) asInteger * 28800
		+ ((result at: 3) asInteger * 3600)
		+ ((result at: 4) asInteger * 60)) asDuration
]
