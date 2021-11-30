# #########################
# Assignment 4
# Q2
# Autmun Semester 2021
# Group 48
# Vinit Raj, 19CS10065
# Aryan Agarwal, 19CS30005
# #########################

# sort array using recursion

# ###################### Data segment ######################################
.data
	string_prompt1: .asciiz "Enter the "
	string_prompt2: .asciiz " elements of the array.\n"

	string_newline: .asciiz "\n"
	string_space: .asciiz " "

	string_print_arr_before: .asciiz "Array elements before sorting are : "
	string_print_arr_after: .asciiz "Array elements after sorting are : "

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

	scan_arr:
		move $t0,$zero # $t0 = 0
		move $t1,$a0
		sll $t1,$t1,2 # $t1 = 4*arr_size

		# shifting by base-address
		add $t0,$t0,$a1
		add $t1,$t1,$a1

	scan_arr_loop:
		beq $t0,$t1,scan_arr_exit

		li $v0, 5 # read_int
		syscall
		sw $v0,0($t0)
		add,$t0,$t0,4
		j scan_arr_loop

	scan_arr_exit:
		jr $ra

	print_arr:
		move $t0,$zero # $t0 = 0
		move $t1,$a0
		sll $t1,$t1,2 # $t1 = 4*arr_size

		# shifting by base-address
		add $t0,$t0,$a1
		add $t1,$t1,$a1

	print_arr_loop:
		beq $t0,$t1,print_arr_exit

		lw $a0,0($t0)
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

	swap:
		move $t0,$a0
		move $t1,$a1

		lw $t2,0($t0)
		lw $t3,0($t1)
		sw $t2,0($t1)
		sw $t3,0($t0)

		jr $ra

	recursive_sort:
		move $t0,$a0 # l <- left
		move $t1,$a1 # r <- right
		move $t2,$a2 # base-address
		move $t3,$t0 # p = pivot <- left
		move $t6,$t0 # left
		move $t7,$t1 # right
		move $t8,$ra # return-address

	recursive_sort_outer_while:
		bge $t0,$t1,recursive_sort_outer_while_exit # if l>=r break

	recursive_sort_inner_while_1:
		move $t4,$t0 
		sll $t4,$t4,2
		add $t4,$t4,$t2 # t4 = base-address+4*l
		move $t5,$t3
		sll $t5,$t5,2
		add $t5,$t5,$t2 # t5 = base-address+4*p
		lw $t4, 0($t4)
		lw $t5, 0($t5)
		bgt $t4,$t5, recursive_sort_inner_while_2 # if A[l]>A[p] break
		bge $t0,$t7, recursive_sort_inner_while_2 # if l>=right break
		addi $t0,$t0,1 # l++
		j recursive_sort_inner_while_1

	recursive_sort_inner_while_2:
		move $t4,$t1
		sll $t4,$t4,2
		add $t4,$t4,$t2
		move $t5,$t3
		sll $t5,$t5,2
		add $t5,$t5,$t2
		lw $t4, 0($t4)
		lw $t5, 0($t5)
		blt $t4,$t5, recursive_sort_outer_while_if # if A[r]<A[p] break
		ble $t1,$t6, recursive_sort_outer_while_if # if r<=left break
		addi $t1,$t1,-1 # r--
		j recursive_sort_inner_while_2

	recursive_sort_outer_while_if:
		blt $t0,$t1, recursive_sort_outer_while_next # if l<r break

		# pushing the important variables l,r,base-address,p,left,right,$ra in stack
		move $a0,$t0
		jal push_to_stack
		move $a0,$t1
		jal push_to_stack
		move $a0,$t2
		jal push_to_stack
		move $a0,$t3
		jal push_to_stack
		move $a0,$t6
		jal push_to_stack
		move $a0,$t7
		jal push_to_stack
		move $a0,$t8
		jal push_to_stack

		# swap A[p],A[r]
		
		move $t4,$t3
		sll $t4,$t4,2
		add $t4,$t4,$t2
		move $t5,$t1
		sll $t5,$t5,2
		add $t5,$t5,$t2
		
		move $a0,$t4
		move $a1,$t5
		jal swap

		# popping the important variables l,r,base-address,p,left,right,$ra in stack
		jal pop_from_stack
		move $t8,$v0
		jal pop_from_stack
		move $t7,$v0
		jal pop_from_stack
		move $t6,$v0
		jal pop_from_stack
		move $t3,$v0
		jal pop_from_stack
		move $t2,$v0
		jal pop_from_stack
		move $t1,$v0
		jal pop_from_stack
		move $t0,$v0


		# pushing the important variables l,r,base-address,p,left,right,$ra in stack
		move $a0,$t0
		jal push_to_stack
		move $a0,$t1
		jal push_to_stack
		move $a0,$t2
		jal push_to_stack
		move $a0,$t3
		jal push_to_stack
		move $a0,$t6
		jal push_to_stack
		move $a0,$t7
		jal push_to_stack
		move $a0,$t8
		jal push_to_stack

		# recursive_sort(A,left,r-1)
		move $a0,$t6
		addi $a1,$t1,-1
		move $a2,$t2
		jal recursive_sort

		# popping the important variables l,r,base-address,p,left,right,$ra in stack
		jal pop_from_stack
		move $t8,$v0
		jal pop_from_stack
		move $t7,$v0
		jal pop_from_stack
		move $t6,$v0
		jal pop_from_stack
		move $t3,$v0
		jal pop_from_stack
		move $t2,$v0
		jal pop_from_stack
		move $t1,$v0
		jal pop_from_stack
		move $t0,$v0


		# pushing the important variables l,r,base-address,p,left,right,$ra in stack
		move $a0,$t0
		jal push_to_stack
		move $a0,$t1
		jal push_to_stack
		move $a0,$t2
		jal push_to_stack
		move $a0,$t3
		jal push_to_stack
		move $a0,$t6
		jal push_to_stack
		move $a0,$t7
		jal push_to_stack
		move $a0,$t8
		jal push_to_stack

		# recursive_sort(A,r+1,right)
		addi $a0,$t1,1
		move $a1,$t7
		move $a2,$t2
		jal recursive_sort

		# popping the important variables l,r,base-address,p,left,right,$ra in stack
		jal pop_from_stack
		move $t8,$v0
		jal pop_from_stack
		move $t7,$v0
		jal pop_from_stack
		move $t6,$v0
		jal pop_from_stack
		move $t3,$v0
		jal pop_from_stack
		move $t2,$v0
		jal pop_from_stack
		move $t1,$v0
		jal pop_from_stack
		move $t0,$v0

		j recursive_sort_outer_while_exit

	recursive_sort_outer_while_next:
		# pushing the important variables l,r,base-address,p,left,right,$ra in stack
		move $a0,$t0
		jal push_to_stack
		move $a0,$t1
		jal push_to_stack
		move $a0,$t2
		jal push_to_stack
		move $a0,$t3
		jal push_to_stack
		move $a0,$t6
		jal push_to_stack
		move $a0,$t7
		jal push_to_stack
		move $a0,$t8
		jal push_to_stack

		# swap A[l],A[r]
		
		move $t4,$t0
		sll $t4,$t4,2
		add $t4,$t4,$t2
		move $t5,$t1
		sll $t5,$t5,2
		add $t5,$t5,$t2
		
		move $a0,$t4
		move $a1,$t5
		jal swap

		# popping the important variables l,r,base-address,p,left,right,$ra in stack
		jal pop_from_stack
		move $t8,$v0
		jal pop_from_stack
		move $t7,$v0
		jal pop_from_stack
		move $t6,$v0
		jal pop_from_stack
		move $t3,$v0
		jal pop_from_stack
		move $t2,$v0
		jal pop_from_stack
		move $t1,$v0
		jal pop_from_stack
		move $t0,$v0

		j recursive_sort_outer_while

	recursive_sort_outer_while_exit:
		move $ra,$t8
		jr $ra

    main:

		jal init_stack

		# ############################################
		# Store size of the array here
		# storing the size of array in $s0
		# dont write more than 1000
		li $s0, 10
		# ############################################


		move $t0, $s0
		sll $t0,$t0,2
		move $a0,$t0 # $a0 = 4*n
		li $v0, 9 # dynamic memory allocation
		syscall
		move $s1,$v0

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
		move $a1,$s1
		jal scan_arr

		# print array before sorting
		la $a0, string_print_arr_before
		li $v0, 4 # print_string
		syscall
		move $a0,$s0
		move $a1,$s1
		jal print_arr

		# sort
		move $a0,$zero
		addi $a1,$s0,-1
		move $a2,$s1
		jal recursive_sort


		# print array after sorting
		la $a0, string_print_arr_after
		li $v0, 4 # print_string
		syscall
		move $a0,$s0
		move $a1,$s1
		jal print_arr

		j exit

    exit:
		li $v0, 10 # code for exiting is 10
		syscall
           
# ###################### Text segment ######################################