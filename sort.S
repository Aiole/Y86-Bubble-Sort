	.file	"sort.c"
	.text
	.globl	tiny_sort
	.type	tiny_sort, @function
tiny_sort:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -40(%rbp)
	movq	%rsi, -48(%rbp)
	movq	-48(%rbp), %rax
	subq	$1, %rax
	movq	%rax, -16(%rbp)
	jmp	.L2
.L6:
	movq	$0, -24(%rbp)
	jmp	.L3
.L5:
	movq	-24(%rbp), %rax
	addq	$1, %rax
	leaq	0(,%rax,8), %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rdx
	movq	-24(%rbp), %rax
	leaq	0(,%rax,8), %rcx
	movq	-40(%rbp), %rax
	addq	%rcx, %rax
	movq	(%rax), %rax
	cmpq	%rax, %rdx
	jge	.L4
	movq	-24(%rbp), %rax
	addq	$1, %rax
	leaq	0(,%rax,8), %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, -8(%rbp)
	movq	-24(%rbp), %rax
	leaq	0(,%rax,8), %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	movq	-24(%rbp), %rdx
	addq	$1, %rdx
	leaq	0(,%rdx,8), %rcx
	movq	-40(%rbp), %rdx
	addq	%rcx, %rdx
	movq	(%rax), %rax
	movq	%rax, (%rdx)
	movq	-24(%rbp), %rax
	leaq	0(,%rax,8), %rdx
	movq	-40(%rbp), %rax
	addq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rax, (%rdx)
.L4:
	addq	$1, -24(%rbp)
.L3:
	movq	-24(%rbp), %rax
	cmpq	-16(%rbp), %rax
	jl	.L5
	subq	$1, -16(%rbp)
.L2:
	cmpq	$0, -16(%rbp)
	jg	.L6
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	tiny_sort, .-tiny_sort
	.section	.rodata
.LC0:
	.string	"%ld: %10ld %016lx\n"
	.text
	.globl	print_values
	.type	print_values, @function
print_values:
.LFB1:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	$0, -8(%rbp)
	jmp	.L8
.L9:
	movq	-8(%rbp), %rax
	leaq	0(,%rax,8), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rcx
	movq	-8(%rbp), %rax
	leaq	0(,%rax,8), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	addq	$1, -8(%rbp)
.L8:
	movq	-8(%rbp), %rax
	cmpq	-32(%rbp), %rax
	jl	.L9
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	print_values, .-print_values
	.globl	main
	.type	main, @function
main:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$96, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movq	$4095, -96(%rbp)
	movq	$3872, -88(%rbp)
	movq	$-187, -80(%rbp)
	movq	$-1, -72(%rbp)
	movq	$1, -64(%rbp)
	movq	$3, -56(%rbp)
	movq	$4, -48(%rbp)
	movq	$10, -40(%rbp)
	movq	$9, -32(%rbp)
	movq	$17, -24(%rbp)
	leaq	-96(%rbp), %rax
	movl	$10, %esi
	movq	%rax, %rdi
	call	tiny_sort
	leaq	-96(%rbp), %rax
	movl	$10, %esi
	movq	%rax, %rdi
	call	print_values
	movl	$0, %eax
	movq	-8(%rbp), %rdx
	xorq	%fs:40, %rdx
	je	.L12
	call	__stack_chk_fail@PLT
.L12:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 7.3.0-27ubuntu1~18.04) 7.3.0"
	.section	.note.GNU-stack,"",@progbits
