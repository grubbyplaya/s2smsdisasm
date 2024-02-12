#define Bank28	pixelShadow+$4000
#define Bank30	pixelShadow+$8000
#define Bank31	pixelShadow+$C000

.ASSUME ADL=1
CheckForBank: 			;it's bankin' time
	di
 	call.is	StoreRegisters
	ld	hl, Engine_ResetInterruptFlag
	push.sis hl		;Copy the return address to the 16-bit stack
	;check for object logic banks
	ld	hl, Bank28
	cp	28
	jp	z, LoadBankFromRAM + romStart
	ld	hl, Bank30
	cp	30
	jp	z, LoadBankFromRAM + romStart
	ld	hl, Bank31
	cp	31
	jp	z, LoadBankFromRAM + romStart

	sub	$04		;banks 0-3 are the actual engine/SMPS
	ld	l, a
	ld	h, $08
	mlt	hl
	ld	de, Bank04+romStart
	add	hl, de

	call	Mov9ToOP1
 	call	ChkFindSym
	jp.lil	c, ExitGame + romStart
	call	PutBankinSlot2 + romStart
	ex	af, af'
CheckForBank_ToggleInterrupt:
	call.is RestoreRegisters
	ld	a, ($E020)
	or	a
	ret	nz
	ei
	ret

StoreRegisters:		;stores registers in RAM
	ld	(SaveSP), sp
	ld	sp, $E012
	push	af
	push	bc
	push	de
	push	hl
	exx
	push	bc
	push	de
	push	hl
	push	ix
	push	iy
	ld	sp, (SaveSP)
	ret.lil

RestoreRegisters:
	ld	(SaveSP), sp
	ld	sp, $E000
	pop	iy
	pop	ix
	pop	hl
	pop	de
	pop	bc
	exx
	pop	hl
	pop	de
	pop	bc
	pop	af
	ex	af, af'
	pop	af
	ld	sp, (SaveSP)
	ret

PutBankinSlot2:
	ex	de, hl			;point HL to appvar
	ld	de, BankSlot2+romStart	;point DE to bank slot	
	ld	bc, 16
	add	hl, bc			;offset HL into actual data
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	inc	hl
	ldir				;copy appvar to bank slot
	ret

LoadBankFromRAM:
	ld	de, $D28000
	ld	bc, $4000
	ldir
	jp	CheckForBank_ToggleInterrupt + romStart

ExitGame:
.ORG ExitGame+romStart
	ld	a, $D0
	ld	mb, a
	ld	sp, $D1A845
	ld	hl, $F00004
	ld	(hl), $11
	inc	hl
	ld	(hl), $30
	ld	hl, lcdNormalMode
	ld	(mpLcdCtrl), hl
	call	ClrLCDFull
	ei
	ret
ExitGameEnd:
.ORG ExitGameEnd-romStart

LoadSave:
	ld	hl, SaveFile
	call	Mov9ToOP1	;check for a save file
	call	Arc_Unarc
	
	ex	de, hl
	ld	de, Score
	ldi
	ldi
	ldi
	ld	de, CurrentLevel
	ldi
	ldi
	ldi
	dec	hl
	ldi
	ldi
	ld	de, ContinueCounter
	ldi
	ld	de, EmeraldFlags
	ldi
	ld	a, (de)
	ld	($D292), a
	ld	hl, SaveFile
	call	Mov9ToOP1
	jp	Arc_Unarc

SaveGame:
	ld	hl, SaveFile
	call	Mov9ToOP1
	call	Arc_Unarc
	ld	hl, Score
	ldi
	ldi
	ldi
	ld	hl, CurrentLevel
	ldi
	ldi
	inc	hl
	ldi
	ldi
	ld	hl, ContinueCounter
	ldi
	ld	hl, EmeraldFlags
	ldi
	ld	a, $01
	ld	(de), a
	jp	Arc_Unarc

;Appvar Headers


Bank04:
	.db	AppvarObj, "Bank04", 0

Bank05:
	.db	AppVarObj, "Bank05", 0

Bank06:
	.db	AppVarObj, "Bank06", 0

Bank07:
	.db	AppVarObj, "Bank07", 0

Bank08:
	.db	AppVarObj, "Bank08", 0

Bank09:
	.db	AppVarObj, "Bank09", 0

Bank10:
	.db	AppVarObj, "Bank10", 0

Bank11:
	.db	AppVarObj, "Bank11", 0

Bank12:
	.db	AppVarObj, "Bank12", 0

Bank13:
	.db	AppVarObj, "Bank13", 0

Bank14:
	.db	AppVarObj, "Bank14", 0

Bank15:
	.db	AppVarObj, "Bank15", 0

Bank16:
	.db	AppVarObj, "Bank16", 0

Bank17:
	.db	AppVarObj, "Bank17", 0

Bank18:
	.db	AppVarObj, "Bank18", 0

Bank19:
	.db	AppVarObj, "Bank19", 0

Bank20:
	.db	AppVarObj, "Bank20", 0

Bank21:
	.db	AppVarObj, "Bank21", 0

Bank22:
	.db	AppVarObj, "Bank22", 0

Bank23:
	.db	AppVarObj, "Bank23", 0

Bank24:
	.db	AppVarObj, "Bank24", 0

Bank25:
	.db	AppVarObj, "Bank25", 0

Bank26:
	.db	AppVarObj, "Bank26", 0

Bank27:
	.db	AppVarObj, "Bank27", 0

NullBank:
	.db	AppVarObj, "Bank29", 0

Bank29:
	.db	AppvarObj, "Bank29", 0

SaveFile:
	.db	AppvarObj, "S2Save", 0
.ASSUME ADL=0