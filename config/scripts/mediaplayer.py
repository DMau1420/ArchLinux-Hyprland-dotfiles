import subprocess
from time import sleep

def recorrer_titulo(titulo):
    match titulo:
        case [P, *R]:
            return R + [P]
        case _:
            return titulo

def obtener_cancion():     
    try:
        raw = subprocess.check_output(["playerctl", "metadata", "title"]).decode("utf-8").strip()
        titulo_actual = raw.replace("&", "&amp;").replace("<", "&lt;").replace(">", "&gt;")

        if len(titulo_actual) <= 40:
            print(titulo_actual, flush=True)

            while  True:
                sleep(2)
                nuevo_titulo = subprocess.check_output(["playerctl", "metadata", "title"]).decode("utf-8").strip()
                if nuevo_titulo != raw:
                    return

        else:
            lista_titulo = list(titulo_actual + " • ")

            while True:
                print("".join(lista_titulo[:40]), flush=True)
                lista_titulo = recorrer_titulo(lista_titulo)

                sleep(0.3)
                if lista_titulo[0] == " ":
                    nuevo_titulo = subprocess.check_output(["playerctl", "metadata", "title"]).decode("utf-8").strip()
                    if nuevo_titulo != raw:
                        return

    except subprocess.CalledProcessError:
        print("", flush=True)
        sleep(5)
    except Exception as e:
        sleep(5)

while True:
    obtener_cancion()