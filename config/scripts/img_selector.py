import os
import random
import json

usr_path = os.path.expanduser("~")

ruta_img_dir = os.path.join(usr_path, ".config", "fastfetch","imagen")
ruta_json = os.path.join(usr_path, ".config", "fastfetch","config.jsonc")

dirlist = os.listdir(ruta_img_dir)

rand_img = random.choice(dirlist)
ruta_img = os.path.join(ruta_img_dir, rand_img)

with open(ruta_json, "r") as f:
    data = json.load(f)

data["logo"]["source"] = ruta_img

with open(ruta_json, "w", encoding="utf-8") as f:
    json.dump(data, f, indent=4, ensure_ascii=False)