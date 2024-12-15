def combineBin(bin_files, outBin):
    with open(outBin, 'wb') as f_out:
        for bin_file in bin_files:
            with open(bin_file, 'rb') as f:
                f_out.write(f.read())

bin_files = [
    '../sim/sram/mapLUT.bin',
    '../sim/sram/barLUT.bin',
    '../sim/sram/barDigitLUT.bin',
    '../sim/sram/startLUT.bin',
    '../sim/sram/winLUT.bin',
    '../sim/sram/loseLUT.bin',
    '../sim/sram/idleBackgroundLUT.bin',
    '../sim/sram/qBlockLUT.bin',
    # 添加更多 bin 檔案
]

outBin = '../sim/sram/combinedLUT.bin'

combineBin(bin_files, outBin)