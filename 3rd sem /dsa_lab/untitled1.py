#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Tue Feb 11 11:34:06 2025

@author: darkemperor
"""

class Node:
    def __init__(self, coefficient, exponent):
        self.coefficient = coefficient
        self.exponent = exponent
        self.next = None

class Polynomial:
    def __init__(self):
        self.head = None

    def insert_term(self, coefficient, exponent):
        if coefficient == 0:
            return
        new_node = Node(coefficient, exponent)
        if self.head is None:
            self.head = new_node
        else:
            # Insert in descending order based on exponents
            temp = self.head
            prev = None
            while temp and temp.exponent > exponent:
                prev = temp
                temp = temp.next

            if temp and temp.exponent == exponent:
                # If exponent already exists, update coefficient
                temp.coefficient += coefficient
                if temp.coefficient == 0:  # Remove the term if coefficient becomes 0
                    if prev:
                        prev.next = temp.next
                    else:
                        self.head = temp.next
            else:
                # Insert the new term
                if prev is None:
                    new_node.next = self.head
                    self.head = new_node
                else:
                    new_node.next = temp
                    prev.next = new_node

    def display(self):
        if not self.head:
            print("0")
            return
        result = []
        temp = self.head
        while temp:
            term = f"{temp.coefficient}x^{temp.exponent}" if temp.exponent != 0 else f"{temp.coefficient}"
            result.append(term)
            temp = temp.next
        print(" + ".join(result))

    def add_polynomial(self, other):
        result = Polynomial()
        p1 = self.head
        p2 = other.head

        while p1 and p2:
            if p1.exponent > p2.exponent:
                result.insert_term(p1.coefficient, p1.exponent)
                p1 = p1.next
            elif p1.exponent < p2.exponent:
                result.insert_term(p2.coefficient, p2.exponent)
                p2 = p2.next
            else:
                result.insert_term(p1.coefficient + p2.coefficient, p1.exponent)
                p1 = p1.next
                p2 = p2.next

        # Add remaining terms
        while p1:
            result.insert_term(p1.coefficient, p1.exponent)
            p1 = p1.next
        while p2:
            result.insert_term(p2.coefficient, p2.exponent)
            p2 = p2.next

        return result


if __name__ == "__main__":
    poly1 = Polynomial()
    poly1.insert_term(3, 2)
    poly1.insert_term(5, 1)
    poly1.insert_term(6, 0)

    print("Polynomial 1: ")
    poly1.display()

    poly2 = Polynomial()
    poly2.insert_term(4, 2)
    poly2.insert_term(2, 1)
    poly2.insert_term(7, 0)

    print("Polynomial 2: ")
    poly2.display()

    # Adding two polynomials
    result = poly1.add_polynomial(poly2)
    print("Sum of Polynomial 1 and Polynomial 2: ")
    result.display()

if __name__=="__main__":
    print("hello")