# QESpeedometer

See how fast you're going! Also keeps a record and prints\na message when someone breaks it.

## Installation

Install like any other QE mod!

Simple method is to drop it into `%userprofile%\Saved Games\Nightdive Studios\Quake\id1`

## Configuration

Nothing to configure. If you want to change the max windows, edit the code.

## Known Issues

Center-printing text faster than every 0.1 seconds seems to cause some odd
artifacts. For example, when standing still after moving around, the
"Current" value will flash numbers from the maxes briefly.

It would be nice to figure out how to do a moving average, but Quake C isn't
that great at data structures and I'm not that great at math.

## Credits/Acknowledgements

Written by CK

Thanks to:

* teamred for help with the vector math
* Stedanko for playtesting and feedback
