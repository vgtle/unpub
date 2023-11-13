dev-web:
	cd unpub_web &&\
	fvm dart pub global activate webdev 2.7.4 &&\
	fvm dart pub global activate webdev_proxy 0.1.1 &&\
	fvm dart pub global run webdev_proxy serve -- --auto=refresh --log-requests

dev-api:
	cd unpub &&	fvm dart run build_runner watch

build:
	cd unpub_web &&\
	fvm dart pub global activate webdev 2.7.4 &&\
	fvm dart pub global run webdev build
	fvm dart unpub/tool/pre_publish.dart
	fvm dart format **/*.dart
