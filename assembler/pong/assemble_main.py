import os

files = [str(f) for f in os.listdir('.') if os.path.isfile(f) and str(f).endswith('.s')]

total = b''
for file in files:
    os.system("assembler " + file)
    with open("out.bin", "rb") as f:
        total += f.read()

with open("out.bin", "wb") as f:
    f.write(total)

