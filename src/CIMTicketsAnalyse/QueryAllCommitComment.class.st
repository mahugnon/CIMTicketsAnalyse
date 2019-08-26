"
Extract comment from a folder containing PowerBuilder source files
"
Class {
	#name : #QueryAllCommitComment,
	#superclass : #CIMAbstractQuery,
	#category : #'CIMTicketsAnalyse-MooseQueries'
}

{ #category : #running }
QueryAllCommitComment >> runOn: aFolder [
	^ PWBCommitCommentExtractor
		extractCommitCommentFromLibrariesFolder: aFolder
]
