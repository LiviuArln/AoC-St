as yet unclassified
nodeSum
	| nodesValues |
	header key = 0
		ifTrue: [ ^ metaData sum ].
		nodesValues :=(metaData
		collect: [ :m | 
			m > nodes size
				ifTrue: [ 0 ]
				ifFalse: [ (nodes at: m) nodeSum ] ]).
	^ nodesValues sum