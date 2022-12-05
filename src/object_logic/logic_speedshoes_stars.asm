;****************************************************
;*	Logic for stars that surround Sonic with the	*
;*	speed shoes power-up.							*
;****************************************************
Logic_SpeedShoesStars:				;$AD38
.dl Logic_SpeedShoesStars_State0
.dl Logic_SpeedShoesStars_State1
.dl Logic_SpeedShoesStars_State2

Logic_SpeedShoesStars_State0:		;$AD3E
.db $01, $00
	.dl LABEL_B31_AD88
.db $FF, $00

Logic_SpeedShoesStars_State1:		;$AD44
.db $02, $01
	.dl LABEL_B31_ADB3
.db $02, $02
	.dl LABEL_B31_ADB3
.db $02, $03
	.dl LABEL_B31_ADB3
.db $02, $04
	.dl LABEL_B31_ADB3
.db $02, $05
	.dl LABEL_B31_ADB3
.db $02, $06
	.dl LABEL_B31_ADB3
.db $02, $07
	.dl LABEL_B31_ADB3
.db $02, $08
	.dl LABEL_B31_ADB3
.db $FF, $00

Logic_SpeedShoesStars_State2:		;$AD66
.db $02, $05
	.dl LABEL_B31_ADB3
.db $02, $06
	.dl LABEL_B31_ADB3
.db $02, $07
	.dl LABEL_B31_ADB3
.db $02, $08
	.dl LABEL_B31_ADB3
.db $02, $01
	.dl LABEL_B31_ADB3
.db $02, $02
	.dl LABEL_B31_ADB3
.db $02, $03
	.dl LABEL_B31_ADB3
.db $02, $04
	.dl LABEL_B31_ADB3
.db $FF, $00


LABEL_B31_AD88:
	ld      a, (ix+$3F)
	inc     a
	ld      (ix+$02), a
	set     0, (ix+$04)
	call    VF_Engine_MoveObjectToPlayer
	ld      a, (ix+$3F)
	or      a
	ret     nz
	ld      hl, $D373
	ld      b, $08
	ld      de, ($D511)			;player's horiz. position in level.
	ld      (hl), e
	inc     hl
	ld      (hl), d
	inc     hl
	ld      de, ($D514)			;player's vert. position in level
	ld      (hl), e
	inc     hl
	ld      (hl), d
	inc     hl
	djnz    LABEL_B31_AD88
	ret     

LABEL_B31_ADB3:
	ld      a, ($D532)		;check for speed shoes power-up
	cp      $01
	jp	  nz, +_
	ld      a, (ix+$3F)
	or      a
	jp      nz, ++_
	ld      hl, $D38E
	ld      de, $D392
	ld      bc, $001C
	lddr    
	ld      hl, ($D511)			;player's horiz. position in level.
	ld      ($D373), hl
	ld      hl, ($D514)			;player's vert. position in level.
	ld      ($D375), hl
	ld      a, (ix+$3F)
	add     a, a
	ld      l, a
	ld      h, $00
	ld      de, DATA_B31_AE00
	add     hl, de
	ld      e, (hl)
	inc     hl
	ld      d, (hl)
	ex      de, hl
	ld      a, (hl)			;set sprite's hpos
	ld      (ix+$11), a
	inc     hl
	ld      a, (hl)
	ld      (ix+$12), a
	inc     hl				;set sprite's vertical pos
	ld      a, (hl)
	ld      (ix+$14), a
	inc     hl
	ld      a, (hl)
	ld      (ix+$15), a
	ret     

	ld      (ix+$00), $FF
	ret     

DATA_B31_AE00:
.dl $D37F
.dl $D38F
