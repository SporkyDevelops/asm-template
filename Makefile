DOCKER_IMAGE = x86_64_asm_env 
DOCKER_RUN = docker run --rm --platform linux/amd64 -v $(shell pwd):/workspace -w /workspace $(DOCKER_IMAGE)

ASM = 
ASM_FLAGS = 

# If using nasm, set ASM_FLAGS for elf64 format
ifeq ($(ASM),nasm)
    ASM_FLAGS = -f elf64
endif

BUILD_DIR = output
FILE_DIR = src

# Default target
all: build

# Build the assembly program
build: $(BUILD_DIR)
	@if [ -z "$(TARGET)" ]; then \
		echo "Usage: make build TARGET=<filename_without_extension>"; \
		exit 1; \
	fi; \
	BUILD_OUTPUT=$$($(DOCKER_RUN) bash -c "$(ASM) $(ASM_FLAGS) $(FILE_DIR)/$(TARGET).s -o $(BUILD_DIR)/$(TARGET).o; gcc -o $(BUILD_DIR)/$(TARGET) $(BUILD_DIR)/$(TARGET).o -nostdlib -static 2>&1"); \
	if [ $$? -ne 0 ]; then \
		echo "$$BUILD_OUTPUT" > /dev/null; \
		if [ "$(SHOW_ERROR)" = "1" ]; then echo "Build failed with error code: $$?"; fi; \
		exit 1; \
	fi

# Run the built program
run: build
	@if [ -z "$(TARGET)" ]; then \
		echo "Usage: make run TARGET=<filename_without_extension>"; \
		exit 1; \
	fi; \
	$(DOCKER_RUN) bash -c "./$(BUILD_DIR)/$(TARGET)"

.PHONY: all build run
