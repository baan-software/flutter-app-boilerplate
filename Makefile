.PHONY: generate clean run generate-l10n build-android build-ios

generate:
	flutter packages pub get
	dart run build_runner build --delete-conflicting-outputs

generate-l10n:
	flutter gen-l10n

clean:
	dart run build_runner clean
	flutter clean

run:
	flutter run

generate-watch:
	dart run build_runner watch --delete-conflicting-outputs

build-android:
	flutter build apk --debug

build-ios:
	flutter build ios --debug 

build-android-release:
	flutter build apk --release

build-ios-release:
	flutter build ios --release 