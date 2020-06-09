Class {
	#name : #CommentInFile,
	#superclass : #Object,
	#instVars : [
		'fileName',
		'ticketNumber',
		'author',
		'date',
		'directory'
	],
	#category : #'CIMTicketsDataModel-Model'
}

{ #category : #accessing }
CommentInFile >> author [
	^ author
]

{ #category : #accessing }
CommentInFile >> author: anObject [
	author := anObject
]

{ #category : #accessing }
CommentInFile >> date [
	^ date
]

{ #category : #accessing }
CommentInFile >> date: anObject [
	date := anObject
]

{ #category : #accessing }
CommentInFile >> directory [
	^ directory
]

{ #category : #accessing }
CommentInFile >> directory: anObject [
	directory := anObject
]

{ #category : #accessing }
CommentInFile >> fileName [
	^ fileName
]

{ #category : #accessing }
CommentInFile >> fileName: anObject [
	fileName := anObject
]

{ #category : #accessing }
CommentInFile >> ticketNumber [
	^ ticketNumber
]

{ #category : #accessing }
CommentInFile >> ticketNumber: anObject [
	ticketNumber := anObject
]
