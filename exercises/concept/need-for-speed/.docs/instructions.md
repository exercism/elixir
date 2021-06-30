# Instructions

That remote controlled car that you bought recently has turned into a whole new hobby. You have been organizing remote control car races.

You were almost finished writing a program that would allow to run race simulations when your cat jumped at your keyboard and deleted a few lines of code. Now your program doesn't compile anymore...

## 1. Fix compilation error `Race.__struct__/0 is undefined`

Add an alias so that the module `NeedForSpeed.Race` can be referenced by the shorter name `Race`.

## 2. Fix compilation error `Car.__struct__/0 is undefined`

Add an alias so that the module `NeedForSpeed.RemoteControlCar` can be referenced by the shorter name `Car`.

## 3. Fix compilation error `undefined function puts/1`

The function `puts/1` comes from the module `IO`. Import it to be able to use it without referencing the module.

## 4. Fix compilation error `undefined function default_color/0`

The functions `default_color/0`, `red/0`, `cyan/0`, and `green/0` all come from the module `IO.ANSI`. You're planning to add support for other car colors, so you want to import the whole module. Unfortunately, the function `color/1` from the module `IO.ANSI` conflicts with one of your local functions. Import the whole `IO.ANSI` module except that one function.
