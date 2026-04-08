# Learning_Erlang

# Erlang Sudoku Solver

This project is a Sudoku solver implemented in Erlang, demonstrating functional programming concepts such as recursion, pattern matching, guards, immutable lists, and higher-order functions. The solver can solve any valid 9×9 Sudoku board using a backtracking algorithm without mutable state.

# Instructions for Build and Use

Steps to build and/or run the software:

Save the solver code in a file named sudoku.erl.
Open the Erlang shell (erl) and navigate to the folder containing sudoku.erl using cd("C:/path/to/folder").
Compile the file with c(sudoku)..

# Instructions for using the software:

Define a Sudoku board as a list of lists, with empty cells represented by 0.
Example:

Board = [
  [5,3,0,0,7,0,0,0,0],
  [6,0,0,1,9,5,0,0,0],
  [0,9,8,0,0,0,0,6,0],
  [8,0,0,0,6,0,0,0,3],
  [4,0,0,8,0,3,0,0,1],
  [7,0,0,0,2,0,0,0,6],
  [0,6,0,0,0,0,2,8,0],
  [0,0,0,4,1,9,0,0,5],
  [0,0,0,0,8,0,0,7,9]
].
Call the solver with sudoku:solve(Board).
The function returns {ok, SolvedBoard} if a solution is found, or {error, no_solution} if the puzzle is unsolvable.
Development Environment

To recreate the development environment, you need the following software:

Erlang/OTP 25 or newer
A text editor or IDE (VS Code, Notepad++, etc.)
Operating system: Windows, macOS, or Linux
Useful Websites to Learn More

# I found these websites useful in developing this software:

Erlang — Wikipedia
Learn You Some Erlang
Erlang Standard Library Reference Manual
Future Work

# The following items I plan to fix, improve, and/or add to this project in the future:

 Optimize the backtracking algorithm for faster performance on difficult puzzles
 Add input validation and user-friendly error messages
 Develop a graphical or text-based interface for easier board input and visualization
