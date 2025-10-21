import os
import hashlib
from glob import glob
import yaml

def do():
    yamlname = "us.yaml"
    if not os.path.exists(yamlname):
        print("yaml does not exist! skipping...")
        return
    data_loaded = yaml.safe_load(open(yamlname, 'r'))

    rom = ""
    for mrom in glob("*.nes"):
        hash = hashlib.md5(open(mrom,'rb').read()).hexdigest()
        for expect_hash in data_loaded["md5"]:
            if hash == expect_hash:
                rom = mrom
                break
    if rom == "":
        return

    rom_bytes = open(rom, "rb").read()
    rom_name = data_loaded["name"]
    print(f"splitting {rom} for {rom_name} assets")

    if not os.path.exists("headers/"):
        os.mkdir("headers/")

    nes20 = bytearray(rom_bytes)
    ines = bytearray(rom_bytes)
    nes20[0:0x10] = b'\x4E\x45\x53\x1A\x10\x20\x42\x08\x00\x00\x70\x00\x00\x00\x00\x01'
    ines[0:0x10] = b'\x4E\x45\x53\x1A\x10\x20\x42\x00\x00\x00\x00\x00\x00\x00\x00\x00'
    open("headers/mother_nes2.0.nes", "wb").write(nes20)
    open("headers/mother_ines.nes", "wb").write(ines)