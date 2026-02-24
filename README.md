# the_web

## Personal portfolio website built with Flutter Web

A fast, responsive, and minimal portfolio designed to showcase my work, skills, and experience as a developer.



## Overview

### the_web is a lightweight Flutter Web application built to present:

* About

* Technical Skills

* Selected Projects

* Professional Experience

* Contact Information

* The focus of this project is clean architecture, performance, and responsive design.

# -------------------------------------------------------------------------------- #

# Tech Stack

* Flutter (Web)

* Dart

* Material Design

* Responsive layout principles

# --------------------------------------------------------------------------------  #

## Features

* Responsive across desktop, tablet, and mobile

* Modular and scalable structure

* Reusable components

* Clean UI with minimal design

* Optimized web build

# -------------------------------------------------------------------------------- #

## Project Structure

lib/
  main.dart
  screens/
  widgets/
  models/
  utils/

* screens/ → Core sections of the portfolio

* widgets/ → Reusable UI components

* models/ → Data representations

* utils/ → Constants, themes, helpers

# -------------------------------------------------------------------------------- #

## Contact

* GitHub: https://github.com/yourusername

* LinkedIn: https://linkedin.com/in/yourprofile







# #-----------------------------------------------------------------------------# #
# # ---------------------------------------------------------------------------- # #

## Customization

To adapt this portfolio:

Update content inside models/ or data files

Modify theme and styling in utils/

Add or remove sections inside screens/

Replace assets in the assets/ directory

## Deployment

You can deploy the build/web folder to:

GitHub Pages

Firebase Hosting

Vercel

Netlify

Any static hosting provider

-- This keeps your codebase production-grade. --
flutter analyze

## Run locally (Chrome)

flutter run -d chrome

## Build for Production

flutter build web

## Production files will be generated in:
build/web/

Production Build Optimization
A. Build in Release Mode
flutter build web --release

HTML (smaller size):

flutter build web --web-renderer html

CanvasKit (better visuals):

flutter build web --web-renderer canvaskit

Use Base Href (For GitHub Pages)

If deploying to:

https://username.github.io/the_web/

Build with:

flutter build web --base-href /the_web/

Very important for routing to work properly.

Enable Deferred Loading (Optional Advanced Optimization)

In web/index.html:

<script>
  window.flutterConfiguration = {
    canvasKitMaximumSurfaces: 4,
  };
</script>


For large apps, consider deferred imports — but for a portfolio this is usually unnecessary.


Deployment Optimization
For GitHub Pages

Build:

flutter build web --release --base-href /the_web/


Push build/web to gh-pages branch.

Enable GitHub Pages in repository settings.