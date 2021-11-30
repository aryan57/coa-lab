# #########################
# Assignment 2
# Q2
# Autmun Semester 2021
# Group 48
# Vinit Raj, 19CS10065
# Aryan Agarwal, 19CS30005
# #########################

# This program takes two integers as input from the user and calculates the GCD of them

# ###################### Data segment ######################################
.data
    # program output text constants
    prompt1:
        .asciiz "Enter the first positive integer: "
    prompt2:
        .asciiz "Enter the second positive integer: "
    result:
        .asciiz "GCD of the two integers is: "
    newline:
        .asciiz "\n"
# ###################### Data segment ######################################

# ###################### Text segment ######################################
.text
.globl  main

gcd:
    move    $t0, $a0                         # storing a
    move    $t1, $a1                         # storing b
    beq     $t0, $zero, exit2                # return b if a==0
for: 
    beq     $t1, $zero, exit1                # exit loop if b==0
    bgt     $t0, $t1, else                   # goto else if a>b
    sub     $t1, $t1, $t0                    # b=b-a
    j       endfor
else:
    sub     $t0, $t0, $t1                    # a=a-b
endfor:
    j       for

exit1:
    move    $v0, $t0                         # returns a
    jr      $ra

exit2:
    move    $v0, $t1                         # returns b
    jr      $ra

main:
    li      $v0, 4                           # issue prompt1
    la      $a0, prompt1
    syscall

    li      $v0, 5                           # get a from user
    syscall
    move    $s0, $v0     

    li      $v0, 4                           # issue prompt2
    la      $a0, prompt2
    syscall

    li      $v0, 5                           # get b from user
    syscall
    move    $s1, $v0  

    move    $a0, $s0                         # first parameter for gcd
    move    $a1, $s1                         # second parameter for gcd
    jal     gcd                              # call gcd function

    move    $s2, $v0                         # store returned ans

    li      $v0, 4                           # print result
    la      $a0, result
    syscall
    li      $v0, 1                           
    move    $a0, $s2
    syscall

    li      $v0, 4                           # print newline
    la      $a0, newline
    syscall

    li      $v0, 10                          # terminate the program
    syscall
# ###################### Text segment ######################################