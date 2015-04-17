# Introduction

This project was given to me by my Differential Equations teacher Marco Weidenhoeft. In doing so it will meet requirements that are known to him and I and they will not be posted. Although basic functionality will be listed you could assume that functionality implies requirements. There are going to be matlab routines that will be run in matlab and if given enough time it will be converted into Python *hopefully* using SciPy, Tcl, and/or PyGame.

# Progress
- Done
    - Euler's Method
    - Improve Euler's Method
    - Runge - Kotta Classical 4th Order
    - Taylor Series Differentiation
    - Combining All 4
- To Do
    - Providing Verbose Graphing Options (kind of)
        * Time permitting
    - Gui
        * Most likely during the summer as a side project

## Explantion:
These four routines are using for numerical differentiation of first order, ordinary, differenetial equations. If you don't know what those are, you could always try googiling them or perhaps checking on amazon for a textbook. Otherwise:

First and foremost there are 4 methods:
1. Classic Eulers
    * x1 = x0 + h
    * y1 = h * y'(x,y) + y0
2. Improved Eulers
    * x1 = x0 + h
    * To be done later
3. Taylor Series (4th order)
    * x1 = x0 + h
    * To be done later
4. Runge-Kotta Classical 4th Order
    * x1 = x0 + h
    * To be done later

The fifth routine just graphs all four on the same plot space. 

## Some Notes
These functions all take the same parameters: initial x, initial y, final x, step size. In that order. After entering these values you will then be prompted for you to input your first order differential. it is important to note that you **MUST** enter the equation with matlab syntax intact. No implicity anything and lots of helpful parathesis.

Otherwise, I might add some more documentation later. Doubtful.

1. Item 1
2. Item 2
3. Item 3