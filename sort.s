	.file	"sort.c"
	.text
	.globl	tiny_sort
	.type	tiny_sort, @function
tiny_sort:
.LFB13:
	.cfi_startproc
	subq	$1, %rsi
	jmp	.L2
.L3:
	addq	$1, %rax
.L5:
	cmpq	%rsi, %rax
	jge	.L7
	leaq	8(%rdi,%rax,8), %r8
	movq	(%r8), %rcx
	leaq	(%rdi,%rax,8), %rdx
	movq	(%rdx), %r9
	cmpq	%r9, %rcx
	jge	.L3
	movq	%r9, (%r8)
	movq	%rcx, (%rdx)
	jmp	.L3
.L7:
	subq	$1, %rsi
.L2:
	testq	%rsi, %rsi
	jle	.L8
	movl	$0, %eax
	jmp	.L5
.L8:
	rep ret
	.cfi_endproc
.LFE13:
	.size	tiny_sort, .-tiny_sort
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%ld: %10ld %016lx\n"
	.text
	.globl	print_values
	.type	print_values, @function
print_values:
.LFB14:
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movq	%rdi, %r12
	movq	%rsi, %rbp
	movl	$0, %ebx
	jmp	.L10
.L11:
	movq	(%r12,%rbx,8), %rcx
	movq	%rcx, %r8
	movq	%rbx, %rdx
	leaq	.LC0(%rip), %rsi
	movl	$1, %edi
	movl	$0, %eax
	call	__printf_chk@PLT
	addq	$1, %rbx
.L10:
	cmpq	%rbp, %rbx
	jl	.L11
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE14:
	.size	print_values, .-print_values
	.globl	main
	.type	main, @function
main:
.LFB15:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	subq	$96, %rsp
	.cfi_def_cfa_offset 112
	movq	%fs:40, %rax
	movq	%rax, 88(%rsp)
	xorl	%eax, %eax
	movq	$4095, (%rsp)
	movq	$3872, 8(%rsp)
	movq	$-187, 16(%rsp)
	movq	$-1, 24(%rsp)
	movq	$1, 32(%rsp)
	movq	$3, 40(%rsp)
	movq	$4, 48(%rsp)
	movq	$10, 56(%rsp)
	movq	$9, 64(%rsp)
	movq	$17, 72(%rsp)
	movq	%rsp, %rbx
	movl	$10, %esi
	movq	%rbx, %rdi
	call	tiny_sort
	movl	$10, %esi
	movq	%rbx, %rdi
	call	print_values
	movq	88(%rsp), %rdx
	xorq	%fs:40, %rdx
	jne	.L16
	movl	$0, %eax
	addq	$96, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
.L16:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE15:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 7.3.0-27ubuntu1~18.04) 7.3.0"
	.section	.note.GNU-stack,"",@progbits
