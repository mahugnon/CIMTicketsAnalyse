Class {
	#name : #QueryTicketsFromIzyMooseModel,
	#superclass : #CIMAbstractQuery,
	#category : #'CIMTicketsAnalyse-MooseQueries'
}

{ #category : #running }
QueryTicketsFromIzyMooseModel >> runOn: aFolder [
	^ (aFolder asFileReference directories
		collect: [ :folder | 
			folder basename
				->
					(QueryTicketsAndAssociatedFileFromMooseModel
						runOn:
							((PWBCommitCommentExtractor
								extractCommitCommentFromFolder: folder
								inModel: (PWBFamixImporter importFromFolder: folder))
								allWithType: FamixPWBTicket)) ]) asOrderedDictionary
]
