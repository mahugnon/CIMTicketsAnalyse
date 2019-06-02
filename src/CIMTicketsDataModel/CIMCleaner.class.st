Class {
	#name : #CIMCleaner,
	#superclass : #Object,
	#category : #'CIMTicketsDataModel-Utils'
}

{ #category : #api }
CIMCleaner >> group: aCollection with: bibliothequeFolder [
	| files |
	files := self izyProtectFilesFrom: bibliothequeFolder.
	^ files keys
		collect: [ :key | 
			key
				->
					(aCollection
						select: [ :o | 
							((files at: key)
								select:
									[ :each | each matchesRegex: '.*' , o trim , '.*' ]) notEmpty ]) ]
]

{ #category : #utils }
CIMCleaner >> izyProtectFilesFrom: aFolder [
	^ (aFolder asFileReference directories
		collect: [ :dir | 
			(dir basename asLowercase copyReplaceAll: '.pbl.src' with: '')
				-> (dir visibleFiles collect: [ :file | file basename ]) ])
		asDictionary
]
