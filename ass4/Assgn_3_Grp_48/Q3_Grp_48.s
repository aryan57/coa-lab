# #########################
# Assignment 4
# Q3
# Autmun Semester 2021
# Group 48
# Vinit Raj, 19CS10065
# Aryan Agarwal, 19CS30005
# #########################

# ternary search and sorting using recursion

# ###################### Data segment ######################################
.data
	string_prompt1: .asciiz "Enter the "
	string_prompt2: .asciiz " elements of the array.\n"

	string_open: .asciiz "\n< "
	string_close: .asciiz " > "
	string_not_found: .asciiz "NOT FOUND in the array.\n"
	string_found: .asciiz "is FOUND in the array at index < "

	string_prompt_key: .asciiz "Enter the key to be searched : "

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

	recursive_search:
		move $t0,$a0 # start
		move $t1,$a1 # end
		move $t2,$a2 # key
		move $t3,$a3 # base-address
		move $t4,$ra # return-address
	
	recursive_search_while:
		bgt $t0,$t1,recursive_search_exit

		sub $t5,$t1,$t0
		li $t6,3
		div $t5,$t6
		mflo $t5 # t5 = (end-start)/3

		add $t6,$t0,$t5 # t6 = mid1 = start + (end-start)/3
		sub $t7,$t1,$t5 # t7 = mid2 = end - (end-start)/3

		move $t8,$t6 # t8 = mid1
		move $t9,$t7 # t9 = mid2

		# multipying by 4 and adding base address
		sll $t8,$t8,2
		sll $t9,$t9,2
		add $t8,$t8,$t3
		add $t9,$t9,$t3

		lw $t8, 0($t8) # t8 = A[mid1]
		lw $t9, 0($t9) # t9 = A[mid2]

		beq $t2,$t8,recursive_search_exit_mid1 # if key==A[mid1]
		beq $t2,$t9,recursive_search_exit_mid2 # if key==A[mid2]
		blt $t2,$t8,recursive_search_next_left # if key < A[mid1]
		bgt $t2,$t9,recursive_search_next_right # if key > A[mid2]
		j recursive_search_next_middle

	recursive_search_exit_mid1:
		move $v0,$t6
		move $ra,$t4
		jr $ra
	recursive_search_exit_mid2:
		move $v0,$t7
		move $ra,$t4
		jr $ra

	recursive_search_next_left:

		# t8 = start
		# t9 = mid1-1

		move $t8,$t0
		addi $t9,$t6,-1

		j recursive_search_next_call

	recursive_search_next_right:
		# t8 = mid2+1
		# t9 = end

		addi $t8,$t7,1
		move $t9,$t1

		j recursive_search_next_call

	recursive_search_next_middle:

		# t8 = mid1+1
		# t9 = mid2-1

		addi $t8,$t6,1
		addi $t9,$t7,-1

		j recursive_search_next_call

	recursive_search_next_call:

		# pushing the important variables like $ra,start,end etc. in stack
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

		move $a0,$t8 # new-start
		move $a1,$t9 # new-end
		move $a2,$t2 # key
		move $a3,$t3 # base address

		jal recursive_search
		move $t8,$v0

		# popping the important variables like $ra,start,end etc. in stack
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

		move $v0,$t8
		move $ra,$t4
		jr $ra

	recursive_search_exit:
		li $v0,-1
		move $ra,$t4
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

		# s0 = size of array
		# s1 = base address of array
		# s2 = key
		# s3 = found index

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

		# get the key to be searched
		la $a0, string_prompt_key
		li $v0, 4 # print_str
		syscall
		li $v0, 5 # read_int
		syscall
		move $s2, $v0


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

		# ternary-sort
		move $a0,$zero
		addi $a1,$s0,-1
		move $a2,$s2
		move $a3,$s1
		jal recursive_search
		move $s3,$v0
		addi $s3,$s3,1 # s3 = one-base indexation of result

		# printing result
		la $a0, string_open
		li $v0, 4 # print_string
		syscall
		move $a0,$s2
		li $v0, 1 # print_int
		syscall
		la $a0, string_close
		li $v0, 4 # print_string
		syscall

		beq $s3,$zero,key_not_found

		la $a0, string_found
		li $v0, 4 # print_string
		syscall
		move $a0,$s3
		li $v0, 1 # print_int
		syscall
		la $a0, string_close
		li $v0, 4 # print_string
		syscall

		j exit

	key_not_found:
		la $a0, string_not_found
		li $v0, 4 # print_string
		syscall

    exit:
		li $v0, 10 # code for exiting is 10
		syscall
           
# ###################### Text segment ######################################