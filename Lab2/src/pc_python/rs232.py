#!/usr/bin/env python3
from serial import Serial, EIGHTBITS, PARITY_NONE, STOPBITS_ONE
from sys import argv

assert len(argv) == 2
s = Serial(
    port=argv[1],
    baudrate=115200,
    bytesize=EIGHTBITS,
    parity=PARITY_NONE,
    stopbits=STOPBITS_ONE,
    xonxoff=False,
    rtscts=False
)
with open('key.bin', 'rb') as fp_key, open('enc2.bin', 'rb') as fp_enc, open('dec2.bin', 'wb') as fp_dec:
    key = fp_key.read(64)
    enc = fp_enc.read()
    assert len(enc) % 32 == 0

    s.write(key)
    for i in range(0, len(enc), 32):
        s.write(enc[i:i+32])
        dec = s.read(31)
        fp_dec.write(dec)
