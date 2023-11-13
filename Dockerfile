FROM dart:stable AS build
WORKDIR /app
COPY unpub/pubspec.* ./
RUN ls
RUN dart pub get
COPY unpub/ .
RUN dart pub get --offline
RUN dart compile exe bin/unpub.dart -o bin/unpub
FROM scratch
COPY --from=build /runtime/ /
COPY --from=build /app/bin/unpub /app/bin/
