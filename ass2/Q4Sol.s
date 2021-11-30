# #########################
# Assignment 2
# Q4
# Autmun Semester 2021
# Group 48
# Vinit Raj, 19CS10065
# Aryan Agarwal, 19CS30005
# #########################

# This program finds wether n is a perfect no. or not
# A perfect number is equal to the sum of its proper divisors (including 1 and excluding itself)

# ###################### Data segment ######################################
.data
	string_prompt: .asciiz "Enter a positive integer: "
	string_invalid_number: .asciiz "Entered no. is invalid.\nPlease enter positive integers only.\n"
	string_perfect:   .asciiz "Entered number is a perfect number.\n"
	string_not_perfect:   .asciiz "Entered number is NOT a perfect number.\n"
# ###################### Data segment ######################################

# ###################### Text segment ######################################
.text
.globl main

	sum_of_divisors:
		move $t0, $a0 # store n
		li $t1, 2 # initialize i=2 for the for-loop
		move $t2, $zero # assign the sum with 0

	for:
		mul $t3, $t1, $t1 # store i*i in $t3
		bgt $t3, $t0, endfor # break loop if i*i > n
		div $t0, $t1 # do n/i
		mfhi $t4 # $t4 = n%i
		mflo $t5 # $t5 = floor(n/i)
		beq $t4, $zero, add_sum1 # jump to add_sum if remainder zero
		j next_iter
	add_sum1:
		add $t2, $t2, $t1 # add i to sum
		bne $t3, $t0, add_sum2
		j next_iter
	add_sum2:
		add $t2, $t2, $t5 # add floor(n/i) to sum if i*i!=n
		j next_iter
	next_iter:
		add $t1,$t1,1 # do i++
		j for # go to next iteration
	endfor:
		addi $t2, $t2, 1 # 1 is divisor of every number
		move $v0, $t2
		jr $ra

    main:

	# prompt and take integer n

		la $a0, string_prompt # load address of prompt message in $a0
		li $v0, 4 # Prepare to print the prompt message
		syscall  # print the prompt message using syscall

		li $v0, 5 # code for read_int is 5
		syscall # take integer n using syscall (and save it in $v0)
		move $s0, $v0 # store n in $s0

	# do sanity check

		move $t0, $s0
		ble $t0, $zero, bad_input # is n<=0 jump to bad_input and exit program

	# call sum_of_divisors function

		move $a0,$s0 # first argument of function
		jal sum_of_divisors
		move $s1, $v0 # store result in $s1
		beq $s1,$s0, perfect
		j not_perfect

	perfect:
		la $a0, string_perfect
		li $v0, 4
		syscall
		j exit
	not_perfect:
		la $a0, string_not_perfect
		li $v0, 4
		syscall
		j exit

	bad_input:
		la $a0, string_invalid_number
		li $v0, 4
		syscall
    exit:
          li $v0, 10 # code for exiting is 10
          syscall 
           
# ###################### Text segment ######################################