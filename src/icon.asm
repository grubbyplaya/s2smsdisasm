Tails_Icon:
#if	Version = 2
	jp	_START
	.db	1								
	.db	16, 16								
	.db	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
	.db	$FF, $C3, $C3, $C3, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $C3, $C3, $FF
	.db	$FF, $C3, $E4, $E4, $C3, $C3, $FF, $FF, $FF, $FF, $FF, $C3, $C3, $C3, $C3, $FF
	.db	$FF, $C3, $E4, $FF, $FF, $E4, $C3, $C3, $C3, $C3, $C3, $C3, $E6, $E6, $E4, $C3
	.db	$FF, $FF, $C3, $E4, $FF, $FF, $E4, $E6, $E6, $E6, $E6, $E6, $E4, $C3, $C3, $FF
	.db	$FF, $FF, $C3, $E4, $FF, $FF, $E6, $E6, $FF, $FF, $FF, $E6, $E6, $E4, $C3, $FF
	.db	$FF, $FF, $FF, $C3, $E4, $E4, $E6, $E6, $E6, $E6, $E6, $E6, $E6, $E4, $C3, $FF
	.db	$FF, $FF, $FF, $C3, $E4, $E4, $FF, $B5, $FF, $E6, $B5, $FF, $E4, $E4, $C3, $FF
	.db	$FF, $FF, $FF, $C3, $E4, $E4, $FF, $00, $FF, $E4, $00, $FF, $E4, $C3, $FF, $FF
	.db	$FF, $FF, $FF, $C3, $C3, $E4, $FF, $B5, $FF, $E4, $B5, $FF, $E4, $C3, $FF, $FF
	.db	$FF, $FF, $FF, $C3, $C3, $B5, $FF, $FF, $FF, $00, $00, $FF, $B5, $B5, $FF, $FF
	.db	$FF, $FF, $B5, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $B5
	.db	$FF, $FF, $FF, $B5, $B5, $FF, $FF, $E2, $E2, $E2, $FF, $FF, $FF, $B5, $B5, $FF
	.db	$FF, $FF, $FF, $FF, $B5, $B5, $B5, $FF, $E2, $FF, $FF, $B5, $B5, $FF, $FF, $FF
	.db	$FF, $FF, $FF, $FF, $C3, $E4, $B5, $B5, $B5, $B5, $8B, $8B, $FF, $FF, $FF, $FF
	.db	$FF, $FF, $FF, $C3, $E4, $E6, $C3, $FF, $FF, $FF, $B5, $FF, $FF, $FF, $FF, $FF
	.db	"Sonic the Hedgehog 2 CE", 0
#else
;Hard (original levels) mode icon
	jp	_START
	.db	1
	.db	16, 16
	.db	$00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	.db	$00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	.db	$18, $18, $18, $00, $00, $00, $00, $00, $00, $00, $00, $00, $18, $18, $00, $00
	.db	$18, $1B, $1B, $18, $18, $00, $00, $00, $00, $00, $18, $18, $18, $18, $00, $00
	.db	$18, $1B, $5D, $5D, $1B, $18, $18, $18, $18, $18, $18, $5A, $5A, $1B, $18, $00
	.db	$00, $18, $1B, $5D, $5D, $1B, $5A, $5A, $5A, $5A, $5A, $1B, $18, $18, $00, $00
	.db	$00, $18, $1B, $5D, $5D, $5A, $5A, $5D, $5D, $5D, $5A, $5A, $1B, $18, $00, $00
	.db	$00, $00, $18, $1B, $1B, $5A, $5A, $5A, $5A, $5A, $5A, $5A, $1B, $18, $00, $00
	.db	$00, $00, $18, $1B, $1B, $5D, $5D, $00, $5A, $00, $5D, $1B, $1B, $18, $00, $00
	.db	$00, $00, $18, $1B, $1B, $5D, $5D, $00, $1B, $00, $5D, $1B, $18, $00, $00, $00
	.db	$00, $00, $18, $18, $1B, $5D, $5D, $00, $1B, $00, $5D, $1B, $18, $00, $00, $00
	.db	$00, $00, $18, $18, $5D, $5D, $5D, $5D, $00, $00, $5D, $5D, $5D, $00, $00, $00
	.db	$00, $5D, $5D, $5D, $5D, $5D, $5D, $5D, $5D, $5D, $5D, $5D, $5D, $5D, $00, $00
	.db	$00, $00, $5D, $5D, $5D, $5D, $5D, $5D, $5A, $5D, $5D, $5D, $5D, $5D, $00, $00
	.db	$00, $00, $00, $00, $18, $5D, $5D, $5D, $5D, $5D, $5D, $00, $00, $00, $00, $00
	.db	$00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	.db	"Sonic 2 CE (Hard Mode)", 0
#endif