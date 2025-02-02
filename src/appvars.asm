#define Bank28	pixelShadow+$4000
#define Bank30	pixelShadow+$8000
#define Bank31	pixelShadow+$C000

.ASSUME ADL=1
CheckForBank: 			;it's bankin' time
 	call.sis StoreRegisters
	jp.lil	+_ + romStart

_:	ld	hl, Engine_ResetInterruptFlag
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
	ld	a, ($DF20)
	or	a
	ret	nz
	ei
	ret

StoreRegisters:		;stores registers in RAM
	ld	(SegaSP), sp
	ld	sp, $DF12
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
	ld	sp, (SegaSP)
	ret

RestoreRegisters:
	ld	(SegaSP), sp
	ld	sp, $DF00
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
	ld	sp, (SegaSP)
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

#define BankAddressTable $D0E000

StoreBankPointers:	;for loading sprite data from ROM banks
	xor	a
_:	push	af
	ld	l, a
	ld	e, a
	ld	h, 8
	ld	d, 3
	mlt	hl
	mlt	de

	ld	bc, Bank04 + romStart
	add	hl, bc	;HL = ROM bank header
	ex	de, hl
	ld	bc, BankAddressTable
	add	hl, bc	
	ex	de, hl	;DE = bank address holder

	push	de
	call	Mov9ToOP1
 	call	ChkFindSym
	ex	de, hl
	pop	de
	jp	c, ExitGame

	ld	(StoreBankAddress + 1 + romStart), de
	ld	de, $FF8012	;offset HL into actual data
	add	hl, de
StoreBankAddress:
	ld	(0), hl
	pop	af
	inc	a
	cp	28
	jr	nz, -_
	ret.sis

GetDataPTR:	;locate ROM bank data in archive memory
	sub	$04
	push	de
	push	bc
	ld	e, a
	ld	d, 3
	mlt	de
	ex	de, hl
	ld	bc, BankAddressTable
	add	hl, bc
	ld	hl, (hl)
	ex	de, hl
	add	hl, de
	pop	bc
	pop	de
	ret.sis

ExitGame:
	ld	a, $D0
	ld	mb, a
	ld	sp, ($D2DE02)
	ld	hl, $F00004
	ld	(hl), $11
	inc	hl
	ld	(hl), $30
	ld	hl, lcdNormalMode
	ld	(mpLcdCtrl), hl
	ld	hl, mpLcdPalette
	ld	de, mpLcdPalette+1
	ld	bc, $0040
	ld	(hl), $00
	ldir

	ld	hl, ClearMemoryMap
	ld	de, VRAM
	ld	bc, ExitGameEnd-ClearMemoryMap
	ldir
	jp	VRAM

ClearMemoryMap:
	;clear emulated memory map location
	ld	hl, romStart
	ld	de, romStart+1
	ld	bc, $FFFF
	ld	(hl), $00
	ldir
	call	ClrLCDFull
	ei
	ret

ExitGameEnd:
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

Bank28Header:
	.db	AppVarObj, "Bank28", 0

Bank29:
	.db	AppvarObj, "Bank29", 0

Bank30Header:
	.db	AppvarObj, "Bank30", 0

Bank31Header:
	.db	AppvarObj, "Bank31", 0

SHCHeader:
	.db	AppvarObj, "Bank32", 0
.ASSUME ADL=0