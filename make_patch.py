import subprocess
import tools.header_compat

OUTROM = "mother_rebuilt.nes"
OUTPATCH = "hacky_halloween"

def patch(using_rom):
    subprocess.run(f"sudo apt-get install g++ build-essential", shell = True)
    subprocess.run(f"cd Flips && make TARGET=cli", shell = True)
    subprocess.run(f"cd Flips && ./flips -c --bps ../{using_rom} ../{OUTROM} ../{OUTPATCH}.bps", shell = True)

if __name__ == "__main__":
    import argparse
    parser = argparse.ArgumentParser(description="Configure the project")
    parser.add_argument(
        "-i",
        "--ines",
        help="Make a compatible rom into specific headers",
        action="store_true",
    )

    args = parser.parse_args()

    tools.header_compat.do()

    base_rom = ""
    if args.ines:
        base_rom = "headers/mother_ines.nes"
        OUTPATCH += "_ines"
    else:
        base_rom = "headers/mother_nes2.0.nes"
        OUTPATCH += "_nes2.0"

    patch(base_rom)

