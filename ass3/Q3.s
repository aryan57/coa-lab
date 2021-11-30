# #########################
# Assignment 2
# Q3
# Autmun Semester 2021
# Group 48
# Vinit Raj, 19CS10065
# Aryan Agarwal, 19CS30005
# #########################

# 2-d matrix transpose in stack-frame

# ###################### Data segment ######################################
.data
	string_prompt: .asciiz "Enter four positive integers m, n, a and r.\n"
	string_invalid_input: .asciiz "Invalid Input.\nPlease enter positive integers only.\n"
	string_print_matrix_a: .asciiz "\nPrinting matrix A of m rows and n columns\n"
	string_print_matrix_b: .asciiz "\nPrinting transpose matrix B of n rows and m columns\n"
	string_newline: .asciiz "\n"
	string_space: .asciiz " "
# ###################### Data segment ######################################

# ###################### Text segment ######################################
.text
.globl main

	init_stack:
		addi $sp,$sp,-4
		sw $fp, 0($sp) # Memory[sp] = fp
		move $fp, $sp # $fp = $sp
		jr $ra

	push_to_stack:
		sw $a0,0($sp)
		addi $sp,$sp,4
		jr $ra
		
	malloc_in_stack:
		# $a0 = no. of integers to be allocated
		sll $a0,$a0,4
		sub $sp,$sp,$a0
		move $v0,$sp
		jr $ra

	print_matrix:
		# $a0 = no. of rows
		# $a1 = no. of cols
		move $t0,$a0
		move $t1,$a1
		move $t2,$zero # i=0

	print_matrix_outer_for:
		beq $t2,$t0,print_matrix_exit_outer_for
		move $t3,$zero # j=0
	print_matrix_inner_for:
		beq $t3,$t1,print_matrix_exit_inner_for

		mul $t4,$t1,$t2 # $t4 = i*cols
		add $t4,$t4,$t3 # $t4 = i*cols + j
		sll $t4,$t4,2 # $t4 = 4*(i*cols + j)
		add $t4,$t4,$sp # $t4 = $sp + 4*(i*cols + j)

		lw $t5, 0($t4) # $t5 = a[i][j] =Memory[$sp + 4*(i*cols + j)]
		move $a0,$t5
		li $v0, 1 # print_int
		syscall

		la $a0, string_space
		li $v0, 4 # print_string
		syscall

		addi $t3,$t3,1
		j print_matrix_inner_for

	print_matrix_exit_inner_for:
		la $a0, string_newline
		li $v0, 4 # print_string
		syscall
		addi $t2,$t2,1
		j print_matrix_outer_for

	print_matrix_exit_outer_for:
		jr $ra

	transpose_matrix:
		# $a0 = rows in A = m
		# $a1 = cols in A = n
		# $a2 = base address of A
		# $a3 = base address of B
		
		move $t0,$zero # $t0 = ind = 0
		mul $t1,$a0,$a1 # $t1 = n*m

	transpose_matrix_loop:
		beq $t0,$t1,transpose_matrix_exit
		div $t0,$a0
		mfhi $t2 # $t2 = ind%rows = col for arr B = row for arr A = j
		mflo $t3 # $t3 = floor(ind/rows) = row for arr B = col for arr A = i

		mul $t4,$t2,$a1 # $t4 = j*n
		add $t4,$t4,$t3 # $t4 = j*n + i
		sll $t4,$t4,2 # $t4 = 4*(j*n + i)
		add $t4,$t4,$a2 # $t4 = base address of A + 4*(j*n + i)
		lw $t5, 0($t4) # $t5 = a[j][i]
		sw $t5, 0($a3) # b[i][j] = a[j][i]

		addi $a3,$a3,4
		addi $t0,$t0,1

		j transpose_matrix_loop

	transpose_matrix_exit:
		jr $ra

	fill_array_a_loop:
		# $a0 = address just after ending of array a
		# $a1 = value to be filled in matrix
		# $a2 = r = common ratio
		# $s6 = address for storing extra variables in stack

		beq $sp,$a0,fill_array_a_loop_exit

		# saving arguments in stack as they are not preserved accross  procedure calls
		sw $a0,0($s6)
		sw $a1,4($s6)
		sw $a2,8($s6)
		sw $ra,12($s6)

		move $a0,$a1
		jal push_to_stack
		
		# loading arguments from stack
		lw $a0,0($s6)
		lw $a1,4($s6)
		lw $a2,8($s6)
		lw $ra,12($s6)

		mul $a1,$a1,$a2 # a=a*r
		j fill_array_a_loop

	fill_array_a_loop_exit:
		jr $ra

    main:
		# prompt
		la $a0, string_prompt
		li $v0, 4 # print_str
		syscall

		# only have to allocate matrix elements in stack
		# so putting n,m,a,r in registers

		# reading m,n,a,r
		# n -> $s0
		# m -> $s1
		# a -> $s2
		# r -> $s3
		li $v0, 5 # read m
		syscall
		move $s1,$v0
		li $v0, 5 # read n
		syscall
		move $s0,$v0
		li $v0, 5 # read a
		syscall
		move $s2,$v0
		li $v0, 5 # read 3
		syscall
		move $s3,$v0

		# do sanity check
		ble $s0,$zero,bad_input
		ble $s1,$zero,bad_input
		ble $s2,$zero,bad_input
		ble $s3,$zero,bad_input

		jal init_stack

		li $a0,10
		jal malloc_in_stack # allocating some extra space at stack top for extra variables
		move $s6,$v0 # $s6 = base address for storing some important variables in runtime

		mul $a0,$s0,$s1
		jal malloc_in_stack # memory allocation of array a
		move $s4,$v0 # $s4 = base address of array a

		mul $a0,$s0,$s1
		jal malloc_in_stack # memory allocation of array b
		move $s5,$v0 # $s5 = base address of array b

		# filling array a
		move $sp,$s4 # stack-pointer = base address of array a
		mul $t0,$s0,$s1
		sll $t0,$t0,2 # $t0 = 4*n*m
		add $a0,$sp,$t0 # $a0 = address just after ending of array a
		move $a1,$s2 # $a1 = a
		move $a2,$s3 # $a2 = r
		jal fill_array_a_loop

		# print array a
		la $a0, string_print_matrix_a
		li $v0, 4 # print_string
		syscall
		move $sp,$s4 # stack-pointer = base address of array a
		move $a0,$s1
		move $a1,$s0
		jal print_matrix

		move $a0,$s1
		move $a1,$s0
		move $a2,$s4
		move $a3,$s5
		jal transpose_matrix
		
		# print array b
		la $a0, string_print_matrix_b
		li $v0, 4 # print_string
		syscall
		move $sp,$s5 # stack-pointer = base address of array b
		move $a0,$s0
		move $a1,$s1
		jal print_matrix

		j exit

	bad_input:
		la $a0, string_invalid_input
		li $v0, 4
		syscall

    exit:
          li $v0, 10 # code for exiting is 10
          syscall 
           
# ###################### Text segment ######################################