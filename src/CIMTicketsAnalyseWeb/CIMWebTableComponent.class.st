Class {
	#name : #CIMWebTableComponent,
	#superclass : #WAComponent,
	#category : #CIMTicketsAnalyseWeb
}

{ #category : #rendering }
CIMWebTableComponent >> renderContentOn: html [
	| datas |
	datas := OrderedDictionary
		with: 'Acrylic (Transparent)' -> #('25' '$2.90')
		with: 'Plywood (Birch)' -> #('50' '$1.25')
		with: 'Laminate (Gold on Blue)' -> #('10' '$2.35').
	html mdlTable
		shadow: 2;
		selectable;
		with: [ html
				tableHead: [ html
						tableRow: [ html mdlTableHeading
								nonNumerical;
								with: 'Material'.
							html mdlTableHeading: 'Quantity'.
							html mdlTableHeading: 'Price' ] ].
			html
				tableBody: [ datas
						keysAndValuesDo: [ :title :members | 
							html
								tableRow: [ html mdlTableCell
										nonNumerical;
										with: title.
									members do: [ :data | html mdlTableCell: data ] ] ] ] ]
]
