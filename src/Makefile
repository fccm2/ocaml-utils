RMDIR = rmdir
CMOS = ints.cmo chars.cmo floats.cmo strings.cmo ints32.cmo ints64.cmo lists.cmo arrays.cmo imArrays.cmo imStrings.cmo inputs.cmo outputs.cmo loops.cmo loopsLbl.cmo options.cmo pervasive.cmo args.cmo randoms.cmo filenames.cmo

all: mod opt
mod: utLib.cma
opt: utLib.cmxa
utLib.cmo: utLib.ml
utLib.cma: \
 ints.cmo \
 chars.cmo \
 floats.cmo \
 strings.cmo \
 ints32.cmo \
 ints64.cmo \
 lists.cmo \
 arrays.cmo \
 imArrays.cmo \
 imStrings.cmo \
 inputs.cmo \
 outputs.cmo \
 loops.cmo \
 loopsLbl.cmo \
 options.cmo \
 pervasive.cmo \
 args.cmo \
 randoms.cmo \
 filenames.cmo \
 utLib.cmo
	ocamlc -a -o utLib.cma $^

utLib.cmx: utLib.ml
utLib.cmxa: \
 ints.cmx \
 chars.cmx \
 floats.cmx \
 strings.cmx \
 ints32.cmx \
 ints64.cmx \
 lists.cmx \
 arrays.cmx \
 imArrays.cmx \
 imStrings.cmx \
 inputs.cmx \
 outputs.cmx \
 loops.cmx \
 loopsLbl.cmx \
 options.cmx \
 pervasive.cmx \
 args.cmx \
 randoms.cmx \
 utLib.cmx
	ocamlopt -a -o utLib.cmxa $^

%.cmi: %.mli
	ocamlc -c $<
%.cmo: %.ml %.mli
	ocamlc -c $<
%.cmo: %.ml
	ocamlc -c $<

%.cmx: %.ml %.mli
	ocamlopt -c $<
%.cmx: %.ml
	ocamlopt -c $<
read_man:
	links _man/index.html
_man: \
 ints.cmi \
 chars.cmi \
 floats.cmi \
 strings.cmi \
 ints32.cmi \
 ints64.cmi \
 lists.cmi \
 arrays.cmi \
 imArrays.cmi \
 imStrings.cmi \
 inputs.cmi \
 outputs.cmi \
 loops.cmi \
 loopsLbl.cmi \
 options.cmi \
 pervasive.cmi \
 args.cmi \
 randoms.cmi \
 filenames.cmi \
 utLib.cmi
	mkdir -p _man
	ocamldoc -d _man -html \
	 ints.mli \
	 chars.mli \
	 floats.mli \
	 strings.mli \
	 ints32.mli \
	 ints64.mli \
	 lists.mli \
	 arrays.mli \
	 imArrays.mli \
	 imStrings.mli \
	 inputs.mli \
	 outputs.mli \
	 loops.mli \
	 loopsLbl.mli \
	 options.mli \
	 pervasive.mli \
	 args.mli \
	 randoms.mli \
	 filenames.mli \
	 utLib.mli
clean:
	$(RM) utLib.cma
	$(RM) ints.cmo
	$(RM) chars.cmo
	$(RM) floats.cmo
	$(RM) strings.cmo
	$(RM) ints32.cmo
	$(RM) ints64.cmo
	$(RM) lists.cmo
	$(RM) arrays.cmo
	$(RM) imArrays.cmo
	$(RM) imStrings.cmo
	$(RM) inputs.cmo
	$(RM) outputs.cmo
	$(RM) loops.cmo
	$(RM) loopsLbl.cmo
	$(RM) args.cmo
	$(RM) options.cmo
	$(RM) pervasive.cmo
	$(RM) randoms.cmo
	$(RM) filenames.cmo
	$(RM) utLib.cmo
	$(RM) utLib.cmxa
	$(RM) ints.cmx
	$(RM) chars.cmx
	$(RM) floats.cmx
	$(RM) strings.cmx
	$(RM) ints32.cmx
	$(RM) ints64.cmx
	$(RM) lists.cmx
	$(RM) arrays.cmx
	$(RM) imArrays.cmx
	$(RM) imStrings.cmx
	$(RM) inputs.cmx
	$(RM) outputs.cmx
	$(RM) loops.cmx
	$(RM) loopsLbl.cmx
	$(RM) args.cmx
	$(RM) options.cmx
	$(RM) pervasive.cmx
	$(RM) randoms.cmx
	$(RM) filenames.cmx
	$(RM) utLib.cmx
	$(RM) ints.o
	$(RM) chars.o
	$(RM) floats.o
	$(RM) strings.o
	$(RM) ints32.o
	$(RM) ints64.o
	$(RM) lists.o
	$(RM) arrays.o
	$(RM) imArrays.o
	$(RM) imStrings.o
	$(RM) inputs.o
	$(RM) outputs.o
	$(RM) loops.o
	$(RM) loopsLbl.o
	$(RM) args.o
	$(RM) options.o
	$(RM) pervasive.o
	$(RM) randoms.o
	$(RM) filenames.o
	$(RM) ints.cmi
	$(RM) chars.cmi
	$(RM) floats.cmi
	$(RM) strings.cmi
	$(RM) ints32.cmi
	$(RM) ints64.cmi
	$(RM) lists.cmi
	$(RM) arrays.cmi
	$(RM) imArrays.cmi
	$(RM) imStrings.cmi
	$(RM) inputs.cmi
	$(RM) outputs.cmi
	$(RM) loops.cmi
	$(RM) loopsLbl.cmi
	$(RM) args.cmi
	$(RM) options.cmi
	$(RM) pervasive.cmi
	$(RM) randoms.cmi
	$(RM) filenames.cmi
	$(RM) utLib.cmi
	$(RM) utLib.o
	$(RM) utLib.a
	$(RM) _man/*.html
	$(RM) _man/*.css
	test -d _man/ && $(RMDIR) _man/ || :

# dep:
# $ ocamldep *.ml *.mli
#
args.cmo : \
    pervasive.cmi \
    args.cmi
args.cmx : \
    pervasive.cmx \
    args.cmi
args.cmi :
arrays.cmo : \
    arrays.cmi
arrays.cmx : \
    arrays.cmi
arrays.cmi :
chars.cmo : \
    chars.cmi
chars.cmx : \
    chars.cmi
chars.cmi :
filenames.cmo : \
    filenames.cmi
filenames.cmx : \
    filenames.cmi
filenames.cmi :
floats.cmo : \
    floats.cmi
floats.cmx : \
    floats.cmi
floats.cmi :
imArrays.cmo : \
    imArrays.cmi
imArrays.cmx : \
    imArrays.cmi
imArrays.cmi :
imStrings.cmo : \
    imStrings.cmi
imStrings.cmx : \
    imStrings.cmi
imStrings.cmi :
inputs.cmo : \
    strings.cmi \
    inputs.cmi
inputs.cmx : \
    strings.cmx \
    inputs.cmi
inputs.cmi :
ints.cmo : \
    ints.cmi
ints.cmx : \
    ints.cmi
ints.cmi :
ints32.cmo : \
    ints32.cmi
ints32.cmx : \
    ints32.cmi
ints32.cmi :
ints64.cmo : \
    ints64.cmi
ints64.cmx : \
    ints64.cmi
ints64.cmi :
lists.cmo : \
    lists.cmi
lists.cmx : \
    lists.cmi
lists.cmi :
loops.cmo : \
    loops.cmi
loops.cmx : \
    loops.cmi
loops.cmi :
loopsLbl.cmo : \
    loopsLbl.cmi
loopsLbl.cmx : \
    loopsLbl.cmi
loopsLbl.cmi :
options.cmo : \
    options.cmi
options.cmx : \
    options.cmi
options.cmi :
outputs.cmo : \
    outputs.cmi
outputs.cmx : \
    outputs.cmi
outputs.cmi :
pervasive.cmo : \
    pervasive.cmi
pervasive.cmx : \
    pervasive.cmi
pervasive.cmi :
randoms.cmo : \
    strings.cmi \
    randoms.cmi
randoms.cmx : \
    strings.cmx \
    randoms.cmi
randoms.cmi :
strings.cmo : \
    strings.cmi
strings.cmx : \
    strings.cmi
strings.cmi :
utLib.cmo : \
    strings.cmi \
    randoms.cmi \
    pervasive.cmi \
    outputs.cmi \
    options.cmi \
    loopsLbl.cmi \
    loops.cmi \
    lists.cmi \
    ints64.cmi \
    ints32.cmi \
    ints.cmi \
    inputs.cmi \
    imStrings.cmi \
    imArrays.cmi \
    floats.cmi \
    chars.cmi \
    arrays.cmi \
    args.cmi \
    utLib.cmi
utLib.cmx : \
    strings.cmx \
    randoms.cmx \
    pervasive.cmx \
    outputs.cmx \
    options.cmx \
    loopsLbl.cmx \
    loops.cmx \
    lists.cmx \
    ints64.cmx \
    ints32.cmx \
    ints.cmx \
    inputs.cmx \
    imStrings.cmx \
    imArrays.cmx \
    floats.cmx \
    chars.cmx \
    arrays.cmx \
    args.cmx \
    utLib.cmi
utLib.cmi :
