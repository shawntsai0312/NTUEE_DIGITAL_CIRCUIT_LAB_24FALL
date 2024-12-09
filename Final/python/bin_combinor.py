def combineBin(bin1, bin2, bin3, outBin):
    with open(bin1, 'rb') as f1, open(bin2, 'rb') as f2, open(bin3, 'rb') as f3, open(outBin, 'wb') as f:
        f.write(f1.read())
        f.write(f2.read())
        f.write(f3.read())

mapBin = '../sim/sram/mapLUT.bin'
barBin = '../sim/sram/barLUT.bin'
barDigitBin = '../sim/sram/barDigitLUT.bin'
outBin = '../sim/sram/combinedLUT.bin'

combineBin(mapBin, barBin, barDigitBin, outBin)