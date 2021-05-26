Class {
	#name : #CIMExporter,
	#superclass : #Object,
	#category : #'CIMTicketsDataModelUtils-exporter'
}

{ #category : #utility }
CIMExporter >> exportTbl_retourTo: aPath [
	| error moreDemand returns |
	returns := CIMDatabase database tbl_retour.
	error := self groupByYear: returns problemRelatedToDevelopment.
	moreDemand := self groupByYear: returns moreClientDemand.
	aPath asFileReference
		writeStreamDo: [ :str | 
			str
				<< 'year';
				space;
				<< 'numberOfError';
				space;
				<< 'numberOfMoreClientDemand';
				cr.
			error
				keysDo: [ :year | 
					str
						<< year asString;
						space;
						<< (error at: year) size asString;
						space;
						<< (moreDemand at: year ifAbsent: [ {} ]) size asString;
						cr ] ]
]

{ #category : #utility }
CIMExporter >> exportTicketsClosedTo: aPath [
	| data nbDevs |
	data := QueryTicketPerYearClosing new
		runOn:
			(QueryClosed
				runOn:
					(QueryCleanData
						runOn: (CIMTicketGroupNode new tickets: CIMDatabase database tbl_ft rows))).
	nbDevs := QueryNumberOfDeveloppeurPerYear
		runOn: CIMDatabase database tbl_devizy rows.
	aPath asFileReference
		writeStreamDo: [ :str | 
			str
				<< 'Year';
				space;
				<< 'NumberOfClosedTickets';
				space;
				<< 'numberOfDevelopers';
				space;
				<< 'numberOfReturns';
				cr.
			data
				do: [ :cimNode | 
					str
						<< cimNode time asString;
						space;
						<< cimNode tickets size asString;
						space;
						<< (nbDevs at: cimNode time asYear) asString;
						space;
						<< (QueryNumberOfReturns runOn: cimNode) asString;
						cr ] ]
]

{ #category : #'as yet unclassified' }
CIMExporter >> exportTicketsNumberOfRetourTo: aPath [
	| data nbDevs |
	data := QueryTicketPerYearClosing new
		runOn:
			(QueryClosed
				runOn:
					(QueryCleanData
						runOn: (CIMTicketGroupNode new tickets: CIMDatabase database tbl_ft rows))).
	nbDevs := QueryNumberOfDeveloppeurPerYear
		runOn: CIMDatabase database tbl_devizy rows.
	aPath asFileReference
		writeStreamDo: [ :str | 
			str
				<< 'Year';
				space;
				<< 'NumberOfClosedTickets';
				space;
				<< 'numberOfDevelopers';
				space;
				<< 'numberOfTicketsWithRetours';
				space;
				<< 'numberOfReturns';
				cr.
			data
				do: [ :cimNode | 
					str
						<< cimNode time asString;
						space;
						<< cimNode tickets size asString;
						space;
						<< (nbDevs at: cimNode time asYear) asString;
						space;
						<< (QueryNumberOfTicketsWithReturns runOn: cimNode) asString;
						space;
						<< (QueryNumberOfReturns runOn: cimNode) asString;
						cr ] ]
]

{ #category : #utility }
CIMExporter >> groupByYear: retours [
	^ retours groupedBy: [ :retour | retour date_retour asDate year ]
]
