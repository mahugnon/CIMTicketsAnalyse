Class {
	#name : #IceBergProjectLocator,
	#superclass : #Object,
	#category : #CIMTicketsDataModelUtils
}

{ #category : #'as yet unclassified' }
IceBergProjectLocator >> locationOfProjectRepo: aProject [
	"finds the location of the project (e.g., to find R files that are not part of Pharo)"

	| icebergRepository |
	icebergRepository := IceRepository registry
		detect: [ :repository | 
			repository workingCopy packages
				anySatisfy: [ :package | package name = aProject ] ]
		ifNone:
			[ self error: 'No repository in Iceberg containing the needed files.' ].
	icebergRepository location exists
		ifFalse: [ self
				error:
					'The repository of the project does not have a pointer to a local clone to find the files' ].
	^ icebergRepository location
]
