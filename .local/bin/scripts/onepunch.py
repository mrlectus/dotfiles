#!/bin/env python3

# user -> Brown Carter
# file -> onepunch.py
# date -> Thu-Feb-2023  18:54:33

from bs4 import BeautifulSoup
import json
import requests
from subprocess import run


def main():
    one_url = "https://chapmanganato.com/manga-wd951838/"
    one_req = requests.get(one_url)
    if one_req.status_code == 200:
        onepunch_content = BeautifulSoup(one_req.content, "html.parser")
        chapter_list = (
            onepunch_content.find_all("a", attrs={"class": "chapter-name"})[0]
            .get_text()
            .split()
        )

        chapter = {
            "last_chapter": int(chapter_list[1]),
        }

        with open("onepunch.json", "r") as one_file:
            one_data = json.load(one_file)
            if one_data["last_chapter"] < int(chapter_list[1]):
                run(
                    [
                        "notify-send",
                        f"A new chapter of one punch man \n "
                        f"chapter {int(chapter_list[1])} is out",
                    ]
                )
            else:
                run(["notify-send", "No new chapter of one punch man 😿 \n "])

        with open("onepunch.json", "w") as one_file:
            json.dump(chapter, one_file)


if __name__ == "__main__":
    main()
