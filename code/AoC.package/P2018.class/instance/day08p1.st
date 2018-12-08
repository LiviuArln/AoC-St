as yet unclassified
day08p1
	| data nodeStack completedNodes |
	data := (self day08_puzzles second splitOn: $ ) collect: #asNumber.
	nodeStack := Stack new.
	nodeStack push: D08Node new.
	completedNodes := OrderedCollection new.
	data
		do: [ :d | 
			nodeStack top consumeData: d.
			[ nodeStack isNotEmpty and: [ nodeStack top expectingChild | nodeStack top complete ] ]
				whileTrue: [ nodeStack top expectingChild
						ifTrue: [ nodeStack top nodeCreated.
							nodeStack push: D08Node new ]
						ifFalse: [ completedNodes add: nodeStack pop ] ] ].
	^ (completedNodes collect: #metaSum) sum