# Name of your mod
MOD = kge

# Version of you mod
VERSION = 1.0.5

# Folder where files will be saved
BIN = release/@$(MOD)

# Files that need to be copied to release mod
COPY = LICENSE README.md kuikka.paa mod.cpp

# Folder where your addon folders are located
ADDONS = addons

# Flags for armake
FLAGS = -i tools/cba/addons -w unquoted-string

############# END OF SETTINGS ####################

# Create bin folder (if needed) and build pbo
$(BIN)/$(ADDONS)/$(MOD)_%.pbo: $(ADDONS)/%
	@mkdir -p $(BIN)/$(ADDONS)
	@echo "  PBO  $@"
	@armake build ${FLAGS} -f $< $@

# This is a shortcut for building single addons, so you can just call "make medical.pbo"
%.pbo:
	make $(patsubst %, $(BIN)/$(ADDONS)/$(MOD)_%, $@)

# Build all addon folders
all: $(patsubst $(ADDONS)/%, $(BIN)/$(ADDONS)/$(MOD)_%.pbo, $(wildcard $(ADDONS)/*))

# Remove bin folder
clean:
	rm -rf $(BIN) $(MOD)_*.zip

# Build pbos, copy required files and zip folder
release: all
	@echo "  ZIP  $(MOD)_$(VERSION).zip"
	@cp $(COPY) $(BIN)
	@zip -r $(MOD)_$(VERSION).zip $(BIN) &> /dev/null
