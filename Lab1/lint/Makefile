all:
	cat lint.log

%: %.sv
	-rm lint.log nLintLog nLintDB
	@nLint -sort s -out lint.log +incdir+../src -sv $<
	make all
