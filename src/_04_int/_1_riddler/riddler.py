"""
* Write a python program that asks the user a minimum of 3 riddles.

* You can look at riddles.com if you don't already know any riddles.

* Collect the response of each riddle from the user and compare their
  answers to the correct answer. 

* Use a variable to keep track of the correctly answered riddles

* After all the riddles have been asked, tell the user how many they got
  correct
"""
from tkinter import messagebox, simpledialog, Tk

window = Tk()
window.withdraw ()

first = simpledialog.askinteger(title="", prompt="how many sides does a circle have?")
second = simpledialog.askstring(title="", prompt="what has 82 keys but no locks?")
third = simpledialog.askstring(title="", prompt="A time when they are green, a time"
                                                "when they're brown, but both of these times,"
                                                "cause me to frown. But just in between, for a "
                                                "very short while, They're perfect and yellow and"
                                                " cause me to smileWhat am I talking about here?")
score = 0
if first == 2:
    score = score+1
else:
    score = score+0
if second == "piano":
    score = score+1
else:
    score = score+0
if third == "banana":
    score = score+1
else:
    score = score+0
print("your score is", score)