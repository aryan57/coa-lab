# #########################
# Assignment 4
# Q1
# Autmun Semester 2021
# Group 48
# Vinit Raj, 19CS10065
# Aryan Agarwal, 19CS30005
# #########################

# determinant of matrix using recursion

# ###################### Data segment ######################################
.data
	string_prompt: .asciiz "Enter three positive integers n, a,r and m.\n"
	string_invalid_input: .asciiz "Invalid Input.\nPlease enter positive integers only.\n"
	string_print_matrix: .asciiz "\nPrinting square matrix A of size n\n"
	string_print_matrix_dummy: .asciiz "\nPrinting dummy square matrix of size 3\n"
	string_result: .asciiz "\nDeterminant of square matrix A of size n : "
	string_result_dummy: .asciiz "\nDeterminant of dummy square matrix of size 3 : "

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
		addi $sp,$sp,-4
		sw $a0,0($sp)
		jr $ra

	pop_from_stack:
		lw $v0,0($sp)
		addi $sp,$sp,4
		jr $ra
		

	fill_matrix:
		# $a0 = size of square matrix = n
		# $a1 = first term = a
		# $a2 = common ratio = r
		# $a3 = base address of array
		# $a4 = m
		move $t0,$a0
		move $t1,$a1
		move $t2,$a2
		move $t5,$s5

		div $t1,$t5
		mfhi $t1 # a = a%m
		
		move $t3,$zero # $t3 = ind = 0
		mul $t4,$a0,$a0 # $t4 = n*n
		sll $t4,$t4,2 # $t4 = 4*n*n

		add $t3, $t3, $a3 # shift by base address to both
		add $t4, $t4, $a3

	fill_matrix_loop:
		beq $t3,$t4,fill_matrix_exit # if base-address+ind==base-address+4*n*n exit

		sw $t1, 0($t3)
		mul $t1,$t1,$t2
		div $t1,$t5
		mfhi $t1 # a = a%m
		addi $t3,$t3,4
		j fill_matrix_loop

	fill_matrix_exit:
		jr $ra

	recursive_det:
		# $a0 = n
		# $a1 = base-address of matrix

		# t0=n
		# t1=base-address
		# t2=ans
		# t3=ra
		# t4=i

		# t5=end-address of sub-matrix
		# t6=base-address of sub-matrix
		# t7=current-address of sub-matrix
		# t8=id2
		
		move $t0,$a0
		move $t1,$a1
		move $t2,$zero
		move $t3,$ra

		li $t4,1
		beq $t4,$t0,recursive_det_base # base case, n=1

		move $t4,$zero

	# I am expanding co-factors along row 0

	recursive_det_loop:
		beq $t4,$t0,recursive_det_exit

		addi $t5,$t0,-1
		mul $t5,$t5,$t5
		sll,$t5,$t5,2
		move $a0,$t5 # $a0 = 4*(n-1)*(n-1)
		li $v0, 9 # dynamic memory allocation for the minor of 0-th row and i-th column
		syscall
		move $t6,$v0

		move $t7,$zero 
		# $t7 = ind = 0
		# $t5 = 4*(n-1)*(n-1)
		# $t6 = base-address for the minor of 0-th row and i-th column

		# shifting both by base address
		add $t7,$t7,$t6
		add $t5,$t5,$t6

		# using another temp to avoid elements of i-th column while constructing the minor
		move $t8,$t0
		sll $t8,$t8,2
		add $t8,$t8,$t1

	# constructing the minor
	recursive_det_fill_sub_matrix:
		beq $t5,$t7,recursive_det_call_next
			
		sub $t9,$t8,$t1
		srl $t9,$t9,2
		div $t9,$t0
		mfhi $t9
		bne $t9,$t4,recursive_det_fill_sub_matrix2
		addi $t8,$t8,4

	recursive_det_fill_sub_matrix2:
		lw $t9 , 0($t8)
		sw $t9 , 0($t7) 

		addi $t8,$t8,4
		addi $t7,$t7,4

		j recursive_det_fill_sub_matrix

	recursive_det_call_next:

		# pushing n,base-address,current-ans,return-address,and current-index in stack
		move $a0,$t0
		jal push_to_stack
		move $a0,$t1
		jal push_to_stack
		move $a0,$t2
		jal push_to_stack
		move $a0,$t3
		jal push_to_stack
		move $a0,$t4
		jal push_to_stack

		# calling recursive_det of its minor
		move $a0,$t0
		addi $a0,$a0,-1 # size is n-1
		move $a1,$t6
		jal recursive_det
		move $t9,$v0

		# popping n,base-address,current-ans,return-address,and current-index in stack
		jal pop_from_stack
		move $t4,$v0
		jal pop_from_stack
		move $t3,$v0
		jal pop_from_stack
		move $t2,$v0
		jal pop_from_stack
		move $t1,$v0
		jal pop_from_stack
		move $t0,$v0

		# doing a liitle bit non-trivial thing here
		# making t5 = -2
		# and add -1 to it is i was odd else
		# making t5 to 1
		andi $t5,$t4,1
		beq $t5,$zero,recursive_det_call_next2
		li $t5,-2

	recursive_det_call_next2:

		addi $t5,$t5,1

		# making t6 = A[0][i]
		move $t6,$t4
		sll $t6,$t6,2
		add $t6,$t6,$t1
		lw $t6, 0($t6)

		mul $t5,$t5,$t6 # t5 = ((-1)^i)*A[0][i]
		mul $t5,$t5,$t9 # t5 = ((-1)^i)*A[0][i]*M[0][i]
		add $t2,$t2,$t5 # ans+= t5
		addi $t4,$t4,1 # i++
		j recursive_det_loop

	recursive_det_base:
		lw $t2,0($t1) # base case ans is A[0][0]

	recursive_det_exit:
		move $v0,$t2
		move $ra,$t3
		jr $ra

	print_matrix:
		# $a0 = n
		# $a1 = base address of array
		move $t0,$a0
		move $t5,$a1
		move $t1,$zero # i=0

	print_matrix_outer_for:
		beq $t1,$t0,print_matrix_exit_outer_for
		move $t2,$zero # j=0
	print_matrix_inner_for:
		beq $t2,$t0,print_matrix_exit_inner_for

		mul $t3,$t0,$t1 # $t3 = i*n
		add $t3,$t3,$t2 # $t3 = i*n + j
		sll $t3,$t3,2 # $t3 = 4*(i*n + j)
		add $t3,$t3,$t5 # $t3 = base address of arr +  4*(i*n + j)

		lw $t4, 0($t3) # $t4 = arr[i][j] 
		move $a0,$t4
		li $v0, 1 # print_int
		syscall

		la $a0, string_space
		li $v0, 4 # print_string
		syscall

		addi $t2,$t2,1 # j++
		j print_matrix_inner_for

	print_matrix_exit_inner_for:
		la $a0, string_newline
		li $v0, 4 # print_string
		syscall
		addi $t1,$t1,1 # i++
		j print_matrix_outer_for

	print_matrix_exit_outer_for:
		jr $ra

    main:

		jal init_stack

		# prompt
		la $a0, string_prompt
		li $v0, 4 # print_str
		syscall

		# reading n,a,r
		# n -> $s0
		# a -> $s1
		# r -> $s2
		# m -> $s5
		# base address of arr -> $s3

		# ############# Sample Case for Checking ########
		# n=4, a=1, r=4, m = 19 will give det. to be 6859

		li $v0, 5 # read n
		syscall
		move $s0,$v0
		li $v0, 5 # read a
		syscall
		move $s1,$v0
		li $v0, 5 # read r
		syscall
		move $s2,$v0
		li $v0, 5 # read m
		syscall
		move $s5,$v0

		# do sanity check
		ble $s0,$zero,bad_input
		ble $s1,$zero,bad_input
		ble $s2,$zero,bad_input
		ble $s5,$zero,bad_input # m cant be non-positive

		mul $t0,$s0,$s0
		sll,$t0,$t0,2
		move $a0,$t0 # $a0 = 4*n*n
		li $v0, 9 # dynamic memory allocation
		syscall
		move $s3,$v0

		# filling array a
		move $a0,$s0 # $a0 = n
		move $a1,$s1 # $a1 = a
		move $a2,$s2 # $a2 = r
		move $a3,$s3 # $a3 = baseaddress
		# there is no register as $a4
		# and i need total 5 arguments for the fill_matrix function
		# so I am using m saved in $s5 as the fifth argument
		jal fill_matrix

		# print matrix
		la $a0, string_print_matrix
		li $v0, 4 # print_string
		syscall
		move $a0,$s0
		move $a1,$s3
		jal print_matrix

		# find determinant
		move $a0,$s0
		move $a1,$s3
		jal recursive_det
		move $s4,$v0

		# print determinant
		la $a0, string_result
		li $v0, 4 # print_string
		syscall
		move $a0,$s4
		li $v0, 1 # print_int
		syscall

		j exit

	bad_input:
		la $a0, string_invalid_input
		li $v0, 4
		syscall
		j exit

    exit:
          li $v0, 10 # code for exiting is 10
          syscall 
           
# ###################### Text segment ######################################