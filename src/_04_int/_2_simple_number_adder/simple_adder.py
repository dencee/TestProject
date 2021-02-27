"""
* Write a Python program that asks the user for two numbers.

* Display the sum of the two numbers to the user
"""
from tkinter import messagebox, simpledialog, Tk

window = Tk()
window.withdraw ()

first = simpledialog.askinteger(title="", prompt="gimme a number")
second = simpledialog.askinteger(title="", prompt="gimme another number")
sum = first + second
print (sum)