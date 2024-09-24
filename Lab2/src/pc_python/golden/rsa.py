#!/usr/bin/env python
from sys import argv, stdin, stdout
from struct import unpack, pack

def mul_naive(a, b, n):
    ret = 0
    for i in range(255, -1, -1):
        ret <<= 1
        if ret >= n:
            ret -= n
        if b & (1<<i):
            ret += a
            if ret >= n:
                ret -= n
    return ret

def power_naive(a, b, n):
    a2 = a + 0
    ret = 1
    for i in range(256):
        if b & (1<<i):
            ret = mul_naive(ret, a2, n)
        a2 = mul_naive(a2, a2, n)
    return ret

def mont_preprocess(a, n):
    """return a*2^(256) % n"""
    for i in range(256):
        a <<= 1
        if a >= n:
            a -= n
    # or, equivalent to this
    # return (a<<256)%n
    return a

def mul_mont(a, b, n):
    """return a*b*2^(-256) % n"""
    ret = 0 # Note: ret must has 257b [0,2n)
    for i in range(256):
        if b & (1<<i):
            ret += a
        if ret & 1:
            ret += n
        ret >>= 1
    return ret if ret<n else ret-n # [0,n) now

def power_mont(a, b, n):
    a2 = mont_preprocess(a+0, n)
    ret = 1
    # print hex(ret)
    for i in range(256):
        if b & (1<<i):
            ret = mul_mont(ret, a2, n)
        a2 = mul_mont(a2, a2, n)
    return ret

if __name__ == '__main__':
    val_n = 0xCA3586E7EA485F3B0A222A4C79F7DD12E85388ECCDEE4035940D774C029CF831
    val_e = 0x0000000000000000000000000000000000000000000000000000000000010001
    val_d = 0xB6ACE0B14720169839B15FD13326CF1A1829BEAFC37BB937BEC8802FBCF46BD9
    assert len(argv) == 2, "Usage: {} e|d".format(argv[0])
    if argv[1] == 'e':
        exponentiation = val_e
        r_chunk_size = 31
        w_chunk_size = 32
    else:
        exponentiation = val_d
        r_chunk_size = 32
        w_chunk_size = 31
    while True:
        chunk = stdin.read(r_chunk_size)
        n_read = len(chunk)
        if n_read < r_chunk_size:
            if n_read != 0:
                print "There are {} trailing bytes left (ignored).".format(n_read)
            break
        else:
            vals = unpack("{}B".format(r_chunk_size), chunk)
            msg = 0
            for val in vals:
                msg = (msg<<8) | val
            # Choose one
            # msg_new = power_naive(msg, exponentiation, val_n)
            msg_new = power_mont(msg, exponentiation, val_n)
            vals_new = map(lambda shamt: (msg_new>>shamt)&255, range((w_chunk_size-1)*8, -8, -8))
            vals_new = pack("{}B".format(w_chunk_size), *vals_new)
            stdout.write(vals_new)
