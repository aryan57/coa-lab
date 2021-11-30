# #########################
# Assignment 2
# Q1
# Autmun Semester 2021
# Group 48
# Vinit Raj, 19CS10065
# Aryan Agarwal, 19CS30005
# #########################

# product of these two numbers using the Booth’s Multiplication Algorithm

# ###################### Data segment ######################################
.data
	string_newline: .asciiz "\n"
	string_prompt1: .asciiz "Enter first number: "
	string_prompt2: .asciiz "Enter second number: "
	string_invalid_input: .asciiz "Invalid input.\nEnter 16 bit signed integers only\n"
	string_product:   .asciiz "Product of the two no.s is : "
# ###################### Data segment ######################################

# ###################### Text segment ######################################
.text
.globl main

	
	multiply_booth: # multiply two 16-bit no.s
		move $t0,$zero # A
		move $t1,$zero # Q-1
		move $t2,$a0 # M
		move $t3,$a1 # Q
		li $t4,32 # count

	multiply_booth_loop:
		andi $t6,$t3,1 # $t6 = Q0
		sll $t6,$t6,1 # $t6 = 2*(Q0)
		add $t6,$t6,$t1 # $t6 = 2*(Q0) + (Q-1)
		li $t5, 1
		beq $t6,$t5,multiply_booth_add
		li $t5, 2
		beq $t6,$t5,multiply_booth_sub
		j multiply_booth_update

	multiply_booth_add:
		addu $t0,$t0,$t2 # A = A + M
		j multiply_booth_update

	multiply_booth_sub:
		sub $t5,$zero,$t2
		addu $t0,$t0,$t5 # A = A + (-M)

	multiply_booth_update:

		# Q-1 = Q0
		andi $t6,$t3,1
		move $t1,$t6 
		srl $t3,$t3,1

		# make last bit of A as first bit of Q
		andi $t6,$t0,1
		sll $t6,$t6,31
		or $t3,$t3,$t6 

		# arithmetic right shift of A by 1 bit
		li $t6,1
		sll $t6,$t6,31
		and $t6,$t6,$t0
		srl $t0,$t0,1 
		or $t0,$t0,$t6

		# do count--
		li $t6,1
		sub $t4,$t4,$t6

		# again traverse loop if count is not 0
		beq $t4,$zero,multiply_booth_exit
		j multiply_booth_loop

	multiply_booth_exit:

		# result will be concatenation of A and Q
		# but since we are multiplying 16 bit no.s only
		# product will not overflow 32 bit integer
		# so A will always be 0 ans Q will denote product
		move $v0,$t3
		jr $ra

    main:

	# prompt and take integers n1

		la $a0, string_prompt1 # load address of string_prompt1 in $a0
		li $v0, 4 # Prepare to print the prompt message
					# Code for print string is 4
		syscall  # print the prompt message using syscall

		li $v0, 5 # code for read_int is 5
		syscall # take integer n using syscall (and save it in $v0)
		move $s0, $v0 # store n1 in $s0

	# prompt and take integers n2

		la $a0, string_prompt2 # load address of string_prompt1 in $a0
		li $v0, 4 # Prepare to print the prompt message
					# Code for print string is 4
		syscall  # print the prompt message using syscall

		li $v0, 5 # code for read_int is 5
		syscall # take integer n using syscall (and save it in $v0)
		move $s1, $v0 # store n2 in $s1

	# do sanity check

		li $t0, 1 # $t0 = 1
		sll $t1, $t0, 15 # $t1 = 2^15
		sub $t2, $t1, $t0 # $t2 = 2^15 - 1
		sub $t3, $zero, $t1 # $t3 = -(2^15)

		# $t2 is upper-bound = 32767
		# $t3 is lower-bound = -32768

		# check n1
		bgt $s0,$t2, bad_input
		blt $s0,$t3, bad_input

		# check n2
		bgt $s1,$t2, bad_input
		blt $s1,$t3, bad_input

		move $a0,$s0
		move $a1,$s1
		jal multiply_booth
		move $s0, $v0 # store result in $s0

		la $a0, string_product # load address of string_product in $a0
		li $v0, 4 # Prepare to print the prompt message
					# Code for print string is 4
		syscall  # print the prompt message using syscall

		move $a0, $s0 # load product in $a0
		li $v0, 1 # Prepare to print the product
					# Code for print int is 1
		syscall  # print the product using syscall

		j exit

	bad_input:
		la $a0, string_invalid_input
		li $v0, 4
		syscall

    exit:
          li $v0, 10 # code for exiting is 10
          syscall 
           
# ###################### Text segment ######################################