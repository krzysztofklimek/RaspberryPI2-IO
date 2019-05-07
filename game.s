	.include "configuration.inc"


	/* 5, 6, 7, 8 dŸwiêk */


	ldr r3, =0x3F200034 /*BUTTON*/

	ldr r10, =0	/*WYNIK*/
	ldr r12, =550000


START:

/* 	ODEJMOWANIE CZASU I SPRAWDZANIE KONCA */
	ldr r11, =50000
	subs r12, r11
	cmp r12, #0
	beq END
	
	

/* 	DIODA PIERWSZA------------------------------ */

one:	ldr r0, =0x3F20001C  /*ON*/
	ldr r1, =0x200  /*RED 32*/
	str r1,[r0] /*ON */
	
	ldr r0, =0x3F003004
	ldr r1,[r0]
	mov r2, r12
	add r2,r1,r2
oneOnWait:	
	ldr r4, [r3]			/*PRZYCISK*/
	tst r4, #0b00100	 /*przycisk pierwszy*/
	beq END
	ldr r1,[r0]
	cmp r1,r2
	blt oneOnWait

	ldr r0, =0x3F200028
	ldr r1, =0x200  /*RED 32*/
	str r1,[r0] /* OFF */

	ldr r0, =0x3F003004
	ldr r1,[r0]
	mov r2, r12
	add r2,r1,r2
oneOffWait:
	ldr r4, [r3]			/*PRZYCISK*/
	tst r4, #0b00100	 /*przycisk pierwszy*/
	beq END
	ldr r1,[r0]
	cmp r1,r2
	blt oneOffWait


/* 	DIODA DRUGA------------------------------ */

two:	ldr r0, =0x3F20001C  /*ON*/
	ldr r1, =0x400  /*RED 16*/
	str r1,[r0] /* ON */
	
	ldr r0, =0x3F003004
	ldr r1,[r0]
	mov r2, r12
	add r2,r1,r2
twoOnWait:	
	ldr r4, [r3]			/*PRZYCISK*/
	tst r4, #0b00100	 /*przycisk pierwszy*/
	beq END
	ldr r1,[r0]
	cmp r1,r2
	blt twoOnWait

	ldr r0, =0x3F200028
	ldr r1, =0x400  /*RED 16*/
	str r1,[r0] /* OFF */

	ldr r0, =0x3F003004
	ldr r1,[r0]
	mov r2, r12
	add r2,r1,r2
twoOffWait:	
	ldr r4, [r3]			/*PRZYCISK*/
	tst r4, #0b00100	 /*przycisk pierwszy*/
	beq END
	ldr r1,[r0]
	cmp r1,r2
	blt twoOffWait


/* 	DIODA TRZECIA------------------------------ */

three:	ldr r0, =0x3F20001C  /*ON*/
	ldr r1, =0x800  /*YELLOW 8*/
	str r1,[r0] /*ON */
	
	ldr r0, =0x3F003004
	ldr r1,[r0]
	mov r2, r12
	add r2,r1,r2
threeOnWait:	
	ldr r4, [r3]			/*PRZYCISK*/
	tst r4, #0b00100	 /*przycisk pierwszy*/
	beq END
	ldr r1,[r0]
	cmp r1,r2
	blt threeOnWait

	ldr r0, =0x3F200028
	ldr r1, =0x800  /*YELLOW 8*/
	str r1,[r0] /* OFF */

	ldr r0, =0x3F003004
	ldr r1,[r0]
	mov r2, r12
	add r2,r1,r2
threeOffWait:	
	ldr r4, [r3]			/*PRZYCISK*/
	tst r4, #0b00100	 /*przycisk pierwszy*/
	beq END
	ldr r1,[r0]
	cmp r1,r2
	blt threeOffWait


/* 	DIODA CZWARTA------------------------------ */

four:	ldr r0, =0x3F20001C  /*ON*/
	ldr r1, =0x20000  /*YELLOW 4*/
	str r1,[r0] /*ON */
	
	ldr r0, =0x3F003004
	ldr r1,[r0]
	mov r2, r12
	add r2,r1,r2
fourOnWait:	
	ldr r4, [r3]			/*PRZYCISK*/
	tst r4, #0b00100	 /*przycisk pierwszy*/
	beq onePOINT		/* POINT------------------*/
	ldr r1,[r0]
	cmp r1,r2
	blt fourOnWait

	ldr r0, =0x3F200028
	ldr r1, =0x20000  /*YELLOW 4*/
	str r1,[r0] /*OFF */

	ldr r0, =0x3F003004
	ldr r1,[r0]
	mov r2, r12
	add r2,r1,r2
fourOffWait:	
	ldr r4, [r3]			/*PRZYCISK*/
	tst r4, #0b00100	 /*przycisk pierwszy*/
	beq END
	ldr r1,[r0]
	cmp r1,r2
	blt fourOffWait


/* 	DIODA PIATA------------------------------ */

five:	ldr r0, =0x3F20001C  /*ON*/
	ldr r1, =0x400000  /*GREEN 2*/
	str r1,[r0] /*ON */
	
	ldr r0, =0x3F003004
	ldr r1,[r0]
	mov r2, r12
	add r2,r1,r2
fiveOnWait:
	ldr r4, [r3]			/*PRZYCISK*/
	tst r4, #0b00100	 /*przycisk pierwszy*/
	beq twoPOINTS	/* 2 POINTS------------------*/
	ldr r1,[r0]
	cmp r1,r2
	blt fiveOnWait

	ldr r0, =0x3F200028
	ldr r1, =0x400000  /*GREEN 2*/
	str r1,[r0] /*OFF */

	ldr r0, =0x3F003004
	ldr r1,[r0]
	mov r2, r12
	add r2,r1,r2
fiveOffWait:
	ldr r4, [r3]			/*PRZYCISK*/
	tst r4, #0b00100	 /*przycisk pierwszy*/
	beq END
	ldr r1,[r0]
	cmp r1,r2
	blt fiveOffWait


/* 	DIODA SZOSTA------------------------------ */

six:	ldr r0, =0x3F20001C  /*ON*/
	ldr r1, =0x8000000  /*GREEN 1*/
	str r1,[r0] /*ON */
	
	ldr r0, =0x3F003004
	ldr r1,[r0]
	mov r2, r12
	add r2,r1,r2
sixOnWait:
	ldr r4, [r3]			/*PRZYCISK*/
	tst r4, #0b00100	 /*przycisk pierwszy*/
	beq onePOINT		/* POINT------------------*/
	ldr r1,[r0]
	cmp r1,r2
	blt sixOnWait

	ldr r0, =0x3F200028
	ldr r1, =0x8000000  /*GREEN 1*/
	str r1,[r0] /*OFF */

	ldr r0, =0x3F003004
	ldr r1,[r0]
	mov r2, r12
	add r2,r1,r2
sixOffWait:	
	ldr r4, [r3]			/*PRZYCISK*/
	tst r4, #0b00100	 /*przycisk pierwszy*/
	beq END
	ldr r1,[r0]
	cmp r1,r2
	blt sixOffWait

	
	B END
	
	
END: 
	ldr r0, =0x3F200028 /* GASZE WSZYSTKIE LAMPKI*/
	ldr r1, =0x8420E00
	str r1,[r0] /*OFF */
	
jeden:	
		
		ands r11, r10, #0b000001
		cmp r11, #1
		beq zapalONE
		
dwa:		and r11, r10, #0b000010
		cmp r11, #2
		beq zapalTWO
		
trzy:		and r11, r10, #0b000100
		cmp r11, #4
		beq zapalTHREE
		
cztery:	and r11, r10, #0b001000
		cmp r11, #8
		beq zapalFOUR
		
piec:		and r11, r10, #0b010000
		cmp r11, #16
		beq zapalFIVE
		
szesc:	and r11, r10, #0b100000
		cmp r11, #32
		beq zapalSIX


koniec:

/*OSTATNI DZWIEK 1*/

	ldr r0, =0x3F003004	/*OPOZNIENIE */
	ldr r1,[r0]
	ldr r2, =300000
	add r2,r1,r2
lastSong1:	

/*poczatek dzwieku--------------------------------------*/
	ldr r5, =0x3F20001C 
	ldr r6, =0x3F200028
	ldr r7, =0x010
soundONElast1:
	str r7,[r5] /* HIGH */

	ldr r8, =1500
lateHIGHlast1: 	subs r8, #1
	bne lateHIGHlast1

	
	str r7,[r6] /* LOW */
	ldr r8, =1500
lateLOWlast1: 	subs r8, #1
	bne lateLOWlast1

	
	str r7,[r5] /* LOW */

/*koniec dzwieku------------------------------------*/



	ldr r1,[r0]
	cmp r1,r2
	blt lastSong1


	ldr r0, =0x3F003004	/*OPOZNIENIE */
	ldr r1,[r0]
	ldr r2, =200000
	add r2,r1,r2
PRZERWA1:	

	ldr r1,[r0]
	cmp r1,r2
	blt PRZERWA1


/*OSTATNI DZWIEK 2*/

	ldr r0, =0x3F003004	/*OPOZNIENIE */
	ldr r1,[r0]
	ldr r2, =300000
	add r2,r1,r2
lastSong2:	

/*poczatek dzwieku--------------------------------------*/
	ldr r5, =0x3F20001C 
	ldr r6, =0x3F200028
	ldr r7, =0x010
soundONElast2:
	str r7,[r5] /* HIGH */

	ldr r8, =1500
lateHIGHlast2: 	subs r8, #1
	bne lateHIGHlast2

	
	str r7,[r6] /* LOW */
	ldr r8, =1500
lateLOWlast2: 	subs r8, #1
	bne lateLOWlast2

	
	str r7,[r5] /* LOW */

/*koniec dzwieku------------------------------------*/



	ldr r1,[r0]
	cmp r1,r2
	blt lastSong2
	
	ldr r0, =0x3F003004	/*OPOZNIENIE */
	ldr r1,[r0]
	ldr r2, =200000
	add r2,r1,r2
PRZERWA2:	

	ldr r1,[r0]
	cmp r1,r2
	blt PRZERWA2

/*OSTATNI DZWIEK 3*/


	ldr r0, =0x3F003004	/*OPOZNIENIE */
	ldr r1,[r0]
	ldr r2, =300000
	add r2,r1,r2
lastSong3:	

/*poczatek dzwieku--------------------------------------*/
	ldr r5, =0x3F20001C 
	ldr r6, =0x3F200028
	ldr r7, =0x010
soundONElast3:
	str r7,[r5] /* HIGH */

	ldr r8, =1500
lateHIGHlast3: 	subs r8, #1
	bne lateHIGHlast3

	
	str r7,[r6] /* LOW */
	ldr r8, =1500
lateLOWlast3: 	subs r8, #1
	bne lateLOWlast3

	
	str r7,[r5] /* LOW */

/*koniec dzwieku------------------------------------*/



	ldr r1,[r0]
	cmp r1,r2
	blt lastSong3

	ldr r0, =0x3F003004	/*OPOZNIENIE */
	ldr r1,[r0]
	ldr r2, =200000
	add r2,r1,r2
PRZERWA3:	

	ldr r1,[r0]
	cmp r1,r2
	blt PRZERWA3



	B FINISH


FINISH: B FINISH



zapalONE:

	ldr r0, =0x3F20001C  /*ON*/
	ldr r1, =0x8000000  /*GREEN 1*/
	str r1,[r0] /*ON */

	B dwa
	

zapalTWO:

	ldr r0, =0x3F20001C  /*ON*/
	ldr r1, =0x400000  /*GREEN 2*/
	str r1,[r0] /*ON */

	B trzy
	
zapalTHREE:

	ldr r0, =0x3F20001C  /*ON*/
	ldr r1, =0x20000  /*YELLOW 4*/
	str r1,[r0] /*ON */

	B cztery
	
zapalFOUR:

	ldr r0, =0x3F20001C  /*ON*/
	ldr r1, =0x800  /*YELLOW 8*/
	str r1,[r0] /*ON */

	B piec
	
zapalFIVE:

	ldr r0, =0x3F20001C  /*ON*/
	ldr r1, =0x400  /*RED 16*/
	str r1,[r0] /*ON */

	B szesc
	
zapalSIX:

	ldr r0, =0x3F20001C  /*ON*/
	ldr r1, =0x200  /*RED 32*/
	str r1,[r0] /*ON */

	B koniec
	

	
	
	

onePOINT:
	ldr r0, =0x3F200028 /*WYLACZENIE DIOD*/
	ldr r1, =0x8420E00
	str r1,[r0] /*OFF */
	
	
	/*ldr r9, =1*/	/*PUNKT*/
	/*adds r10, r9*/
	adds r10, #1
	
	
	ldr r0, =0x3F003004 /*OPOZNIENIE */
	ldr r1,[r0]
	ldr r2, =500000
	add r2,r1,r2
pointwait:	

/*poczatek dzwieku--------------------------------------*/
	ldr r5, =0x3F20001C 
	ldr r6, =0x3F200028
	ldr r7, =0x010
soundONEone:
	str r7,[r5] /* HIGH */

	ldr r8, =1538
lateHIGHone: 	subs r8, #1
	bne lateHIGHone

	
	str r7,[r6] /* LOW */
	ldr r8, =1538
lateLOWone: 	subs r8, #1
	bne lateLOWone

	
	str r7,[r5] /* LOW */

/*koniec dzwieku------------------------------------*/

	ldr r1,[r0]
	cmp r1,r2
	blt pointwait
	B START
	
twoPOINTS:
	ldr r0, =0x3F200028	/*WYLACZENIE DIOD*/
	ldr r1, =0x8420E00
	str r1,[r0] /*OFF */
	
	ldr r11, =2	/*DWA PUNKTY */
	add r10, r11
	
	
	
	ldr r0, =0x3F003004	/*OPOZNIENIE */
	ldr r1,[r0]
	ldr r2, =500000
	add r2,r1,r2
pointswait:	

/*poczatek dzwieku--------------------------------------*/
	ldr r5, =0x3F20001C 
	ldr r6, =0x3F200028
	ldr r7, =0x010
soundONEtwo:
	str r7,[r5] /* HIGH */

	ldr r8, =874
lateHIGHtwo: 	subs r8, #1
	bne lateHIGHtwo

	
	str r7,[r6] /* LOW */
	ldr r8, =874
lateLOWtwo: 	subs r8, #1
	bne lateLOWtwo

	
	str r7,[r5] /* LOW */

/*koniec dzwieku------------------------------------*/



	ldr r1,[r0]
	cmp r1,r2
	blt pointswait
	B START