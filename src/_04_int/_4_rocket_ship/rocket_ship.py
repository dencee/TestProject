from tkinter import *
from tkinter import messagebox, simpledialog, Tk
import turtle
window = Tk()
window.withdraw ()

window_width = 800
window_height = 800
root = Tk()

canvas = Canvas(root, width=window_width, height=window_height, borderwidth=0, highlightthickness=0, bg="#000050")
canvas.grid()


# this code runs whenever the mouse is clicked on the window
if __name__ == '__main__':

    # Draws a dark blue background
    #canvas.create_rectangle(0, 0, window_width, window_height, fill="#000050")
    #screen = turtle.Screen()
    #screen.bgcolor('blue')

    # x and y will be equal to the mouse pointer's x and y location
    x = 100# event.x
    y = 100# event.y
    z = y + 75
    # This defines the x and y coordinated of all three points
    # of a triangle
    t = turtle.Turtle()
    t.color("red")
    t.pencolor("red")
    t.speed(0)
    t.begin_fill()
    t.goto(x,y)
    t.circle(150,122222)
    t.end_fill()
    t.goto(x,z)
    t.color("orange")
    t.begin_fill()
    t.circle(100,122222)
    t.end_fill()
    t.goto(x,z)
    t.color("yellow")
    t.begin_fill()
    t.circle(50,1222222)
    t.end_fill()
    t.goto(x,y)
    t.color("grey")
    t.begin_fill()
    t.circle(50,3)
    t.end_fill()

     # draws triangle
    
    # 1. Add details to your rocket to make it look better. You can look at
    #    rocket.png for inspiration.
    
    # 2. Modify the locations of the shapes above so the rocket will be drawn
    #    where the mouse is clicked
    

#canvas.bind("<Button-1>", mouse_pressed)

    turtle.done()

#root.mainloop()
