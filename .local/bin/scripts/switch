#!/bin/env python3

# user -> Brown Carter
# file -> switch.py
# date -> Thu-Jan-2023  07:47:42

from pathlib import Path
import secrets
import subprocess

HOME = Path().home()


def main():
    wall_path = Path(HOME.joinpath(".local/share/wallpapers/wall/"))
    wallpapers = secrets.choice([wall for wall in wall_path.iterdir()])
    subprocess.run(
        ["swaymsg", "output", "*", "bg", wallpapers, "fill"], capture_output=True
    )


if __name__ == "__main__":
    main()
