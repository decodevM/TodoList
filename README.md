# SwiftUI TodoList App

![SwiftUI Logo](https://developer.apple.com/assets/elements/icons/swiftui/swiftui-96x96_2x.png)

## Overview

This is a simple iOS TodoList app developed using SwiftUI and following the MVVM (Model-View-ViewModel) architecture. The app allows users to create, check, and delete todo items, with data persistently stored locally.

## Features

- **MVVM Architecture:** Utilizes the MVVM design pattern for better separation of concerns.
- **Local Storage:** Persists todo items locally using Swift's UserDefaults or CoreData.
- **Animations:** Incorporates smooth animations for a polished user experience.
- **Navigation:** Implements navigation to seamlessly move between different screens.

## Screenshots

<!-- All Screenshots in the Same Row -->
<p align="left">
  <img src="./ScreenShots/2.png" alt="Todo List View" width="200" title="Todo List View">
  <img src="./ScreenShots/3.png" alt="Swipe to Delete" width="200" title="Swipe to Delete">
  <img src="./ScreenShots/4.png" alt="Edit Mode" width="200" title="Edit Mode">
  <img src="./ScreenShots/5.png" alt="Add New Todo Item"  width="200" title="Add New Todo Item">
</p>
<!-- End of All Screenshots in the Same Row -->

## Video Demo

<!-- <video width="50%" height="auto" autoplay loop muted playsinline>
  <source src="./ScreenShots/1.mp4" type="video/mp4">
  Your browser does not support the video tag.
</video> -->

<p>
 <img src="./ScreenShots/1.gif" alt="Video Demo" width="200">
<p>

_The video above demonstrates the animations in the todo list view._

## Getting Started

### Prerequisites

- Xcode 15.0 or later
- Swift 5.9 or later

### Installation

1. Clone the repository:

```bash
    git clone https://github.com/decodevM/TodoList.git
```

## Updating the project

To update the project to the latest version run the following command

```bash
    git pull origin main
```

## Contributing

the project is open for contributions, feel free to open a pull request or an issue if you find any bug or if you want
to add a new feature to the project.
However, the main branch is protected so you have to open a pull request to contribute.
To contribute to the project you have to follow the following steps:

- you can use the following command to create a new branch

```bash
    git switch -c <your-branch-name>
```

- then you have to commit your changes to your branch

```bash
    git add .
    git commit -m "your commit message"
```

- then you have to push your branch to the remote repository

```bash
    git push -u origin <your-branch-name>
```

then you have to open a pull request to the main branch and wait for it to be reviewed and merged.
