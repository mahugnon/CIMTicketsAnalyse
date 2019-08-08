Extension { #name : #PWBCommitCommentExtractor }

{ #category : #'*CIMTicketsAnalyse' }
PWBCommitCommentExtractor class >> extractCommitCommentFromFolder: aFolder [
	| aFolderReference |
	aFolderReference := aFolder asFileReference.
	^ (aFolderReference directories
		collect: [ :dir | self extractCommitCommentfromFolder: dir ])
		asOrderedDictionary
]

{ #category : #'*CIMTicketsAnalyse' }
PWBCommitCommentExtractor class >> extractCommitCommentfromFolder: aFolder [
	^ aFolder basename
		->
			((aFolder files
				reject: [ :aFile | #(pbg srj DS_Store) includes: aFile extension ])
				collect: [ :aFile | 
					aFile size = 0
						ifFalse: [ (PWBCommitCommentExtractorParser new parse: aFile contents)
								commitComments
								collect: [ :each | 
									CommentInFile new
										ticketNumber: each ticketNumber ticketNumber;
										fileName: aFile basename;
										directory: aFolder basename ] ] ])
]
