MAJOR = $(shell grep "^\#define[[:space:]]*MAJOR" addons/main/script_mod.hpp | egrep -m 1 -o '[[:digit:]]+')
MINOR = $(shell grep "^\#define[[:space:]]*MINOR" addons/main/script_mod.hpp | egrep -m 1 -o '[[:digit:]]+')
PATCH = $(shell grep "^\#define[[:space:]]*PATCHLVL" addons/main/script_mod.hpp | egrep -m 1 -o '[[:digit:]]+')
BUILD = $(shell grep "^\#define[[:space:]]*BUILD" addons/main/script_mod.hpp | egrep -m 1 -o '[[:digit:]]+')
VERSION = $(MAJOR).$(MINOR).$(PATCH)
VERSION_FULL = $(VERSION).$(BUILD)
PREFIX = kge
BIN = @kge
ZIP = kge
CBA = tools/cba
FLAGS = -i $(CBA) -w unquoted-string
COPY = cp LICENSE README.md kuikka.paa mod.cpp CHANGELOG.md $(BIN)

$(BIN)/addons/$(PREFIX)_%.pbo: addons/%
	@mkdir -p $(BIN)/addons
	@echo "  PBO  $@"
	@armake build ${FLAGS} -f $< $@

# Shortcut for building single addons (eg. "make <component>.pbo")
%.pbo:
	@"$(MAKE)" $(MAKEFLAGS) $(patsubst %, $(BIN)/addons/$(PREFIX)_%, $@)

all: $(patsubst addons/%, $(BIN)/addons/$(PREFIX)_%.pbo, $(wildcard addons/*))

filepatching: clean
	@"$(MAKE)" $(MAKEFLAGS) FLAGS="-i $(CBA) -w unquoted-string -p"
	@$(COPY)

$(BIN)/keys/%.biprivatekey:
	@mkdir -p $(BIN)/keys
	@echo "  KEY  $@"
	@armake keygen -f $(patsubst $(BIN)/keys/%.biprivatekey, $(BIN)/keys/%, $@)

$(BIN)/addons/$(PREFIX)_%.pbo.$(PREFIX)_$(VERSION_FULL).bisign: $(BIN)/addons/$(PREFIX)_%.pbo $(BIN)/keys/$(PREFIX)_$(VERSION_FULL).biprivatekey
	@echo "  SIG  $@"
	@armake sign -f $(BIN)/keys/kge_$(VERSION_FULL).biprivatekey $<

signatures: $(patsubst addons/%, $(BIN)/addons/$(PREFIX)_%.pbo.$(PREFIX)_$(VERSION_FULL).bisign, $(wildcard addons/*)) \
		$(patsubst optionals/%, $(BIN)/optionals/$(PREFIX)_%.pbo.$(PREFIX)_$(VERSION_FULL).bisign, $(wildcard optionals/*))

clean:
	@rm -rf $(BIN) $(ZIP)_*.zip

release:
	@"$(MAKE)" clean
	@"$(MAKE)" $(MAKEFLAGS) signatures
	@echo "  ZIP  kge_$(VERSION).zip"
	@$(COPY)
	@zip -r $(ZIP)_$(VERSION).zip $(BIN) &> /dev/null

.PHONY: release
