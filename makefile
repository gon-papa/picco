.PHONY: all pubget gen watch clean

all: gen

# Get dependencies
pubget:
	fvm flutter pub get

# Generate code (build once)
gen:
	fvm flutter pub run build_runner build --delete-conflicting-outputs

# Watch for changes and regenerate continuously
watch:
	fvm flutter pub run build_runner watch --delete-conflicting-outputs

# Clean generated files
clean:
	fvm flutter pub run build_runner clean

