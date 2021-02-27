"""
* Write a Python program that asks the user for two numbers.

* Then ask the user if the would like to add, subtract, multiply, or divide.

* Use if-else statements to provide the desired math operation on the numbers
  and display the result.
"""
from tkinter import messagebox, simpledialog, Tk
window = Tk()
window.withdraw ()

first = simpledialog.askinteger(title="", prompt="gimme a number")
second = simpledialog.askinteger(title="", prompt="gimme another number")
operation = simpledialog.askstring(title = "", prompt = "would you like to add, subtract, divide or multipy?")
if operation == "add":
    sum = first + second
    print (sum)
elif operation == "subtract":
    difference = first - second
    print (difference)
elif operation == "divide":
    q = first/second
    print (q)
else:
    m = first * second
    print(m)