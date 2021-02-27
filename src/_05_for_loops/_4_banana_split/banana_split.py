"""
* 1. Look at the image bananasplit.png

* 2. Your mission is to create a python program that recreates that image
     using the create_text function
     
* 3. The catch is, you can only type the create_text function ONE TIME ONLY
     into your program. Using a loop and if-statements, you must figure out
     how to vary the text and the positioning so that you can read all four
     separate lines.
"""

from tkinter import *
import tkinter as tk

root = tk.Tk()

canvas = tk.Canvas(root, width=200, height=200, bg="#f63fff");
canvas.grid()
a = ""
y = -15
'''
Text Rendering Example:
                    x    y                                                       
canvas.create_text(100, 50, text="text goes here", font=("Arial", 16))
'''
# Put your code below\
for i in range(4):
    if i < (3):
        a = "ice cream"
        y = y + 50

    else:
        a = "banana"
        y = y+ 50


    canvas.create_text(100, y, text= a , font=("Arial", 16))


root.mainloop()
