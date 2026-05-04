all:
	$(MAKE) -C src
doc:
	$(MAKE) -C src _man
clean:
	$(MAKE) -C src clean
