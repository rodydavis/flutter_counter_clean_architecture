# Flutter Counter App

This example to take the default counter app and refactor it to use clean architecture and riverpod.

The core of the app is in the `/core` folder containing the business logic and domain models.

For showcasing that the logic can run outside of flutter and multiple targets, there is a `/api`, `/web` and `/cli` folder.

The `/app` folder contains the flutter app targeting all 6 platforms.
