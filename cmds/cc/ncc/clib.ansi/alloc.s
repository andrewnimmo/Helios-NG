 # generated by Norcroft Titan Unix MIPS R3000 C 350/350/349 [Jul  9 1991, 20:38:57]
	.set noreorder
	.set noat
	.text
.ent __codeseg ,3
__codeseg:
.end __codeseg
.ent _init_alloc ,3
	.globl	_init_alloc
_init_alloc:
	sw	$0,__dataseg
	j	$31
	or	$0,$0,$0
.end _init_alloc
.ent _alloc_die ,3
_alloc_die:
	sw	$16,0x8($29)
	sw	$31,0xc($29)
	or	$5,$4,$0
	la	$16,__dataseg+0x4
	or	$4,$16,$0
	jal	strcpy
	addiu	$29,$29,0xfffffff8
	or	$4,$16,$0
	lw	$31,0x14($29)
	lw	$16,0x10($29)
	j	_sysdie
	addiu	$29,$29,0x8
.end _alloc_die
.ent malloc ,3
	.globl	malloc
malloc:
	sw	$16,0xfffffff4($29)
	sw	$17,0xfffffff8($29)
	sw	$18,0xfffffffc($29)
	sw	$19,0x0($29)
	sw	$20,0x4($29)
	sw	$21,0x8($29)
	sw	$31,0xc($29)
	or	$16,$4,$0
	la	$21,__dataseg
	lw	$17,0x0($21)
	or	$0,$0,$0
	or	$19,$17,$0
	addiu	$4,$16,0x7
	addi	$1,$0,0xfffffff8
	and	$4,$4,$1
	sra	$18,$4,2
	beq	$16,$0,L28F4
	addiu	$29,$29,0xffffffe0
	bltz	$18,L7F4
	or	$0,$0,$0
	lui	$1,0x40
	ori	$1,$1,0x1
	slt	$1,$18,$1
	bne	$1,$0,L32F4
	or	$0,$0,$0
L7F4: 
	la	$4,__dataseg+0x40
	jal	_sysdie
	or	$0,$0,$0
L32F4: 
	beq	$0,$0,L11F4
	addiu	$6,$18,0x4
L10F4: 
	lw	$5,0x0($17)
	lui	$2,0x1000
	bne	$5,$2,L12F4
	or	$0,$0,$0
	lw	$4,0x8($17)
	or	$0,$0,$0
	beq	$4,$0,L12F4
	or	$0,$0,$0
	lw	$7,0x0($4)
	or	$0,$0,$0
	bne	$7,$2,L12F4
	or	$0,$0,$0
	lw	$7,0x4($17)
	or	$0,$0,$0
	sll	$8,$7,2
	addiu	$3,$17,0x10
	addu	$3,$8,$3
	bne	$4,$3,L12F4
	or	$0,$0,$0
	lw	$4,0x4($4)
	or	$0,$0,$0
	addiu	$4,$4,0x4
	addu	$4,$7,$4
	beq	$0,$0,L11F4
	sw	$4,0x4($17)
L12F4: 
	bne	$5,$2,L18F4
	or	$0,$0,$0
	lw	$4,0x4($17)
	or	$0,$0,$0
	bne	$4,$18,L18F4
	or	$0,$0,$0
	beq	$0,$0,L31F4
	sw	$20,0x4($17)
L18F4: 
	bne	$5,$2,L22F4
	or	$0,$0,$0
	lw	$4,0x4($17)
	or	$0,$0,$0
	sltu	$1,$6,$4
	beq	$0,$1,L22F4
	or	$0,$0,$0
	addiu	$7,$17,0x10
	sll	$4,$18,2
	addu	$4,$7,$4
	lw	$4,0x0($4)
	or	$0,$0,$0
	or	$5,$4,$0
	sw	$2,0x0($5)
	lw	$5,0x4($17)
	or	$0,$0,$0
	subu	$5,$5,$6
	sw	$5,0x4($4)
	lw	$5,0x8($17)
	or	$0,$0,$0
	sw	$5,0x8($4)
	sw	$20,0x0($17)
	sw	$18,0x4($17)
	sw	$4,0x8($17)
	or	$2,$7,$0
L35F4: 
	lw	$31,0x2c($29)
	lw	$21,0x28($29)
	lw	$20,0x24($29)
	lw	$19,0x20($29)
	lw	$18,0x1c($29)
	lw	$17,0x18($29)
	lw	$16,0x14($29)
	j	$31
	addiu	$29,$29,0x20
L22F4: 
	or	$19,$17,$0
	lw	$17,0x8($17)
L11F4: 
	or	$0,$0,$0
	bne	$17,$0,L10F4
	lui	$20,0x2000
	jal	_sbrk
	addiu	$4,$16,0x10
	or	$17,$2,$0
	addi	$1,$0,0xffffffff
	bne	$2,$1,L27F4
	or	$0,$0,$0
L28F4: 
	ori	$2,$0,0x0
	lw	$31,0x2c($29)
	lw	$21,0x28($29)
	lw	$20,0x24($29)
	lw	$19,0x20($29)
	lw	$18,0x1c($29)
	lw	$17,0x18($29)
	lw	$16,0x14($29)
	j	$31
	addiu	$29,$29,0x20
L27F4: 
	sw	$20,0x0($17)
	sw	$18,0x4($17)
	bne	$19,$0,L29F4
	sw	$0,0x8($17)
	beq	$0,$0,L31F4
	sw	$17,0x0($21)
L29F4: 
	sw	$17,0x8($19)
L31F4: 
	addiu	$2,$17,0x10
	lw	$31,0x2c($29)
	lw	$21,0x28($29)
	lw	$20,0x24($29)
	lw	$19,0x20($29)
	lw	$18,0x1c($29)
	lw	$17,0x18($29)
	lw	$16,0x14($29)
	j	$31
	addiu	$29,$29,0x20
.end malloc
.ent free ,3
	.globl	free
free:
	lui	$5,0x1000
	j	$31
	sw	$5,0x0($4)
.end free
.ent calloc ,3
	.globl	calloc
calloc:
	sw	$16,0x4($29)
	sw	$17,0x8($29)
	sw	$31,0xc($29)
	or	$6,$5,$0
	srl	$5,$4,16
	srl	$2,$6,16
	.word	0x00a20018 # mult $5,$2
	mflo	$7
	or	$0,$0,$0
	or	$0,$0,$0
	andi	$6,$6,0xffff
	.word	0x00a60018 # mult $5,$6
	mflo	$5
	or	$0,$0,$0
	or	$0,$0,$0
	andi	$4,$4,0xffff
	.word	0x00820018 # mult $4,$2
	mflo	$2
	or	$0,$0,$0
	or	$0,$0,$0
	.word	0x00860018 # mult $4,$6
	mflo	$4
	or	$0,$0,$0
	or	$0,$0,$0
	srl	$6,$5,16
	srl	$3,$2,16
	addu	$6,$6,$3
	addu	$6,$6,$7
	andi	$5,$5,0xffff
	andi	$7,$2,0xffff
	addu	$7,$5,$7
	srl	$5,$4,16
	addu	$5,$7,$5
	andi	$4,$4,0xffff
	sll	$7,$5,16
	or	$16,$4,$7
	srl	$4,$5,16
	addu	$4,$4,$6
	beq	$4,$0,L4F6
	addiu	$29,$29,0xfffffff0
	addi	$16,$0,0xffffffff
L4F6: 
	lui	$1,0x40
	sltu	$1,$16,$1
	bne	$1,$0,L6F6
	or	$0,$0,$0
	la	$4,__dataseg+0x5c
	jal	_sysdie
	or	$0,$0,$0
L6F6: 
	jal	malloc
	or	$4,$16,$0
	beq	$2,$0,L8F6
	or	$17,$2,$0
	or	$6,$16,$0
	or	$4,$17,$0
	jal	memset
	ori	$5,$0,0x0
L8F6: 
	or	$2,$17,$0
L12F6: 
	lw	$31,0x1c($29)
	lw	$17,0x18($29)
	lw	$16,0x14($29)
	j	$31
	addiu	$29,$29,0x10
.end calloc
.ent _sys_alloc ,3
	.globl	_sys_alloc
_sys_alloc:
	sw	$31,0xc($29)
	jal	malloc
	addiu	$29,$29,0xfffffff8
	bne	$2,$0,L8F7
	or	$0,$0,$0
	la	$4,__dataseg+0x78
	jal	_alloc_die
	or	$0,$0,$0
	ori	$2,$0,0x0
L8F7: 
	lw	$31,0x14($29)
	or	$0,$0,$0
	j	$31
	addiu	$29,$29,0x8
.end _sys_alloc
.ent realloc ,3
	.globl	realloc
realloc:
	sw	$16,0x0($29)
	sw	$17,0x4($29)
	sw	$18,0x8($29)
	sw	$31,0xc($29)
	or	$17,$4,$0
	or	$16,$5,$0
	or	$4,$16,$0
	jal	malloc
	addiu	$29,$29,0xfffffff0
	bne	$17,$0,L4F8
	or	$18,$2,$0
L5F8: 
	or	$2,$18,$0
L8F8: 
	lw	$31,0x1c($29)
	lw	$18,0x18($29)
	lw	$17,0x14($29)
	lw	$16,0x10($29)
	j	$31
	addiu	$29,$29,0x10
L4F8: 
	or	$6,$16,$0
	or	$5,$17,$0
	jal	memcpy
	or	$4,$18,$0
	beq	$0,$0,L5F8
	or	$0,$0,$0
.end realloc
        .data
__dataseg:
	.globl	heaps
heaps:
        .word   0x00000000
sys_message:
        .word   0x00000000
        .word   0x00000000
        .word   0x00000000
        .word   0x00000000
        .word   0x00000000
        .word   0x00000000
        .word   0x00000000
        .word   0x00000000
        .word   0x00000000
        .word   0x00000000
        .word   0x00000000
        .word   0x00000000
        .word   0x00000000
        .word   0x00000000
        .word   0x00000000
        .word   0x546f6f20
        .word   0x6c617267
        .word   0x6520616e
        .word   0x20616c6c
        .word   0x6f636174
        .word   0x696f6e0a
        .word   0x00000000
        .word   0x63616c6c
        .word   0x6f632063
        .word   0x616c6c65
        .word   0x6420666f
        .word   0x7220746f
        .word   0x6f206d75
        .word   0x63680000
        .word   0x4e6f2073
        .word   0x746f7265
        .word   0x206c6566
        .word   0x7420666f
        .word   0x7220492f
        .word   0x4f206275
        .word   0x66666572
        .word   0x206f7220
        .word   0x74686520
        .word   0x6c696b65
        .word   0x00000000
        .word   0x00000000
