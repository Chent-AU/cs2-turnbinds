### How it works:

This program works by using [Auto Hotkey](https://www.autohotkey.com).
This is required to run the turnbinds.

It simulates mouse movement at a default tick rate of 256Hz. This can be changed in the settings.ini file.
It combines all mouse sensitivity multipliers (DPI, in-game sensitivity, windows cursor speed) and uses them to calculate the mouse movement distance per tick based on a constant multiplier specialised for CS2 yaw.
This CS2 Multiplier needs to be recalibrated for varying game resolutions, it is pre-calibrated for a 1920x1080 game window.
To recalibrate, simply set your yaw speed to 36, time exactly how many seconds it takes to complete a complete spin (360 degrees) and divide this number by 10. Then multiply the existing `CS2Scale` in the `settings.ini` file by that result.
For example, if the `CS2Scale` value was set to 3.5 and it takes you 12 seconds to complete a spin, your new `CS2Scale` should be  `12 / 10 * 3.5 = 4.2`.

### How to use:
Upon first use, run the `setup.ahk` file, it will prompt you for inputs about your binds, sensitivty and toggle keys. Press run to start.
After setting your binds, you can just run the `turnbinds.ahk` file to enable to script. The script will start disabled, and can be toggled on and off by using your `Toggle Key`.

The slow speed key will make the turnbinds turn at the slower yaw rate while held, otherwise the normal yaw speed will be used.

By default, the turnbinds will only work when the `Counter-Strike 2` window is focused, you can disabled this or change the required window title in the `settings.ini` file.

### Warning
These turnbinds cannot get you banned from Counter-Strike. AHK is a known program to valve and they are aware of its use in both legitimate and illegitimate CS related programs.
However
- VACnet is a black box. no one knows exactly what it does, but we can make educated guesses. Valve have stated that trust factor does not effect VACnet ([source](https://www.youtube.com/watch?v=ObhK8lUfIlc&t=751s)).
- A few people, or even many players, saying "i did X for Y period of time and didn't notice my trust change" is not definitive when there are many factors at play.
- Unless a valve employee directly confirms something, it's not confirmed.

Cheats use simulated mouse input. this uses simulated mouse input. This and similar programs have been used with seemingly no effect on trust factor, **however** the only way to be **certain** it wont lower your trust is to not use it, at the same time, its not guaranteed it WILL lower your trust factor.
