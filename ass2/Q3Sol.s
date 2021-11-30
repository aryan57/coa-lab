# #########################
# Assignment 2
# Q3
# Autmun Semester 2021
# Group 48
# Vinit Raj, 19CS10065
# Aryan Agarwal, 19CS30005
# #########################

# This program finds whether n is prime or composite, where n is entered by the user.

# ###################### Data segment ######################################
.data
    # program output text constants
    prompt:
        .asciiz "Enter a positive integer greater than equals to 10: "
    result1:
        .asciiz "Entered number is a PRIME number. "
    result2:
        .asciiz "Entered number is a COMPOSITE number. "
    badresult:
        .asciiz "The input is invalid"
    newline:
        .asciiz "\n"
# ###################### Data segment ######################################

# ###################### Text segment ######################################
.text
.globl  main
# main program
#
# program variables
#   n:   $s0
#   i:   $s1
#
main:
    li      $v0, 4                           # issue prompt
    la      $a0, prompt
    syscall

    li      $v0, 5                           # get n from user
    syscall
    move    $s0, $v0

    addi    $t0, $zero, 10  # sanity check, compare n with 10
    blt     $s0, $t0, badinput

    addi    $s1, $zero, 2                    # i = 2

for:
    ble     $s0, $s1, endf                   # exit loop if n <= i
    div     $s0, $s1                         # divide n by i
    mfhi    $t0                              # move remainder to $t0
    beq     $t0, $zero, composite            # exit if remainder is zero
    add     $s1, $s1, 1                      # i++
    b       for                              # continue loop
endf:
    li      $v0, 4                           # print "The number if prime"
    la      $a0, result1
    syscall

    li      $v0, 4
    la      $a0, newline
    syscall

    j       exitp

composite:

    li      $v0, 4                           # print "The number if composite"
    la      $a0, result2
    syscall

    li      $v0, 4
    la      $a0, newline
    syscall
    
    j       exitp

badinput:
    li      $v0, 4                           # invalid input
    la      $a0, badresult
    syscall
    li      $v0, 4                           # print newline
    la      $a0, newline
    syscall

exitp:
    li      $v0, 10                          # terminate the program
    syscall
# ###################### Text segment ######################################