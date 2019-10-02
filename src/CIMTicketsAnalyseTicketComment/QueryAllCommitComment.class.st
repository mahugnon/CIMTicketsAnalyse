"
Extract comment from a folder containing PowerBuilder source files
"
Class {
	#name : #QueryAllCommitComment,
	#superclass : #CIMAbstractQuery,
	#category : #CIMTicketsAnalyseTicketComment
}

{ #category : #running }
QueryAllCommitComment >> runOn: aFolder [
	^ PWBCommitCommentExtractor
		extractCommitCommentFromLibrariesFolder: aFolder
]
