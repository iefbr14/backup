none:
	: use make [machine] or make [group]

.PHONY: threefish drugs silver bliss rock sodium
all:	threefish drugs silver bliss rock sodium

threefish:	;- ./rsync-machine threefish
drugs:		;- ./rsync-machine drugs
silver:		;- ./rsync-machine silver
bliss:		;- ./rsync-machine bliss
rock:		;- ./rsync-machine rock
sodium:		;- ./rsync-machine sodium

fix-threefish:	; rdiff-backup --check-destination-dir threefish
