#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Tue Feb 11 11:04:49 2025

@author: darkemperor
"""

class node:
    def __init__(self,data):
        self.next=None
        self.data=data

class sll:
    def __init__(self,size):
        self.capacity=0
        self.size=size
        self.head=None
        self.tail=None
    def isfull(self):
        return (self.capacity==self.size)
    def isEmpty(self):
        return (self.head==None)
    def insert(self,data):
            if(self.isfull()):
                return -1
            new = node(data)
            if(self.head==None):
                self.head=self.tail=new
            else:
                temp = self.head
                while(temp.next!=self.tail):
                    temp=temp.next
                temp.next=new
                self.tail=new
            
    def search(self,data):
        if(self.isEmpty()):
            print(" the list is empty ")
            return -1
        else:
            temp=self.head
            while(temp.next!=self.tail):
                if(data==temp.data):
                    return 1
                    break
                temp=temp.next
            
            return -1
        
    def delete(self,data):
        if(self.isEmpty()):
            print(" the list  is empty ")
            return -1
        else:
             temp = self.head
             temp1=self.head.next
             while(temp1.next):
                 if(temp1.data==data):
                     temp.next=temp1.next
                     return 1
                 temp=temp.next
                 temp1=temp1.next
                
        
        return -1
                
             
