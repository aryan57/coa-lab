# #########################
# Assignment 2
# Q2
# Autmun Semester 2021
# Group 48
# Vinit Raj, 19CS10065
# Aryan Agarwal, 19CS30005
# #########################

# k-th largest no. after sorting the array

# ###################### Data segment ######################################
.data
	arr: .space 4000 # intentionally allocating more space,
					 # so that same code can be used for different sized arrays (max size 1000)
	string_prompt1: .asciiz "Enter the "
	string_prompt2: .asciiz " elements of the array.\n"
	string_prompt_k: .asciiz "Enter the value of k : "

	string_newline: .asciiz "\n"
	string_space: .asciiz " "

	string_print_arr_before: .asciiz "Array elements before sorting are : "
	string_print_arr_after: .asciiz "Array elements after sorting are : "

	string_ans: .asciiz "-th largest number is : "
	string_invalid_input: .asciiz "Value of k is out of the array range.\n"
# ###################### Data segment ######################################

# ###################### Text segment ######################################
.text
.globl main

	scan_arr:
		move $t0,$zero # $t0 = 0
		move $t1,$a0
		sll $t1,$t1,2 # $t1 = 4*arr_size

	scan_arr_loop:
		beq $t0,$t1,scan_arr_exit

		li $v0, 5 # read_int
		syscall
		sw $v0,arr($t0)
		add,$t0,$t0,4
		j scan_arr_loop

	scan_arr_exit:
		jr $ra

	print_arr:
		move $t0,$zero # $t0 = 0
		move $t1,$a0
		sll $t1,$t1,2 # $t1 = 4*arr_size

	print_arr_loop:
		beq $t0,$t1,print_arr_exit

		lw $a0,arr($t0)
		li $v0, 1 # print_int
		syscall
		la $a0, string_space
		li $v0, 4 # print_string
		syscall
		add,$t0,$t0,4
		j print_arr_loop

	print_arr_exit:
		la $a0, string_newline
		li $v0, 4 # print_string
		syscall
		jr $ra

	# sort array using insertion sort
	sort_array:
		li $t0,4
		move $t1,$a0
		sll $t1,$t1,2 # $t1 = 4*arr_size

	sort_array_outer_loop:
		beq $t0,$t1,sort_array_exit_outer_loop
		lw $t2,arr($t0) # $t2 = temp = arr[j]
		addi $t3,$t0,-4 # i = j - 1

	sort_array_inner_loop:
		blt $t3,$zero,sort_array_exit_inner_loop
		lw $t4,arr($t3) # $t4 = arr[i]
		ble $t4,$t2,sort_array_exit_inner_loop

		addi $t5,$t3, 4
		sw $t4,arr($t5) # arr[i+1] = $t4 = arr[i]
		addi $t3,$t3,-4
		j sort_array_inner_loop

	sort_array_exit_inner_loop:
		addi $t5,$t3, 4
		sw $t2,arr($t5) # arr[i+1] = $t2 = temp
		addi $t0,$t0,4
		j sort_array_outer_loop

	sort_array_exit_outer_loop:
		jr $ra

	find_k_largest:
		# k-th largest element is n-k+1 smallest element
		move $t0,$a1
		sub $t0,$t0,$a0
		addi $t0,$t0,1 # $t0 = n-k+1

		sll $t0,$t0,2 # $t0 = 4*(n-k+1)
		addi $t0,$t0,-4
		lw $v0,arr($t0) # $v0 = arr[n-k+1]
		jr $ra
		
    main:

		# ############################################
		# Store size of the array here
		# storing the size of array in $s0
		# dont write more than 1000
		li $s0,10
		# ############################################

		# print the promp message for scanning array
		la $a0, string_prompt1
		li $v0, 4 # print_str
		syscall
		move $a0,$s0
		li $v0, 1 # print_int
		syscall
		la $a0, string_prompt2
		li $v0, 4 # print_str
		syscall

		# scan arr
		move $a0,$s0
		jal scan_arr

		# print array before sorting
		la $a0, string_print_arr_before
		li $v0, 4 # print_string
		syscall
		move $a0,$s0
		jal print_arr

		# sort the array
		move $a0,$s0
		jal sort_array

		# print array after sorting
		la $a0, string_print_arr_after
		li $v0, 4 # print_string
		syscall
		move $a0,$s0
		jal print_arr


		# scan k
		la $a0, string_prompt_k
		li $v0, 4 # print_str
		syscall
		li $v0, 5 # read_int
		syscall
		move $s1,$v0

		# sanity check
		ble $s1,$zero,bad_input
		bgt $s1,$s0,bad_input

		move $a0,$s1
		move $a1,$s0
		jal find_k_largest
		move $s2,$v0 # $s2 = k-th largest element

		# print k-th largest
		move $a0,$s1
		li $v0, 1 # print_int
		syscall
		la $a0, string_ans
		li $v0, 4 # print_str
		syscall
		move $a0,$s2
		li $v0, 1 # print_int
		syscall

		j exit

	bad_input:
		la $a0, string_invalid_input
		li $v0, 4
		syscall

    exit:
          li $v0, 10 # code for exiting is 10
          syscall 
           
# ###################### Text segment ######################################