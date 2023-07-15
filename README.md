# app_book
# BookApp

BookApp is a cross-platform mobile application developed using Flutter. It allows users to access a wide range of books, both offline and online, with features such as search, bookmarking, preview mode, and more. This README.md file provides detailed information about the app, its features, setup instructions, and collaborators.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Features

### Offline Version

The app provides a free offline version that users can access without an internet connection. It includes a limited selection of books and allows users to interact with the available content.

### Online Version

The app also offers an online version, which requires an internet connection. This version provides additional features and access to a wider range of books. Users can browse, search, and purchase books directly from the app.

### Search Bar

The app includes a search bar that allows users to filter available books based on their search input. If a book is not available in the offline free version (i.e., if it's a paid book), a link is provided to redirect users to the appropriate online source.

### Online Status Flag

The app renders an online status flag at the top of the screen, indicating whether the user is currently online or offline. This feature helps users determine their connectivity status while using the app.

### Onboarding Screen

The app provides an onboarding screen to guide users through the initial setup and introduce them to the app's features and functionality.

### Splash Screen

Upon launching the app, users are greeted with a visually appealing splash screen, enhancing the overall user experience.

### Grid View

The main screen of the app displays the available books in a grid view, allowing users to easily browse through and select their desired titles.

### Share Option

The app also has the ability to share books through the share icon to different platforms like WhatsApp, Instagram, a particular person, Facebook, and more.

### Preview Mode

On click of each book displayed in a category, the app provides a preview of the book, including the name of the author and a detailed description.

### Categories

The app makes a request to the Google API on load to fetch all the ebooks available in various categories such as coding, art, literature, finance, fiction, and more.

### Payment Screen

The app has a payment screen to help you purchase paid books and add them to your bookshelf.

### 2 Sections

The app offers a grid view of sites where you can access free books and a horizontal scroll section of different book categories coming from the API, such as coding, art, fiction, and more. If the book is available on Amazon as a paid book, the Amazon logo is displayed to enable the user to visit the Amazon official site to purchase it.

### Bookmark

The app offers a bookmarking feature where you can save any of your preferred books to your shelf.

### API Integration

The app integrates with the Google API to interact with the SQL database, especially in offline mode. It makes a certain number of requests to fetch data from the API, which is stored in the local database for users to access and interact with in offline mode.

## Collaborators

The following emails have been added as collaborators to the project:

- [iumeha@yahoo.com](#collaborators)
- [anikechidube@gmail.com](#collaborators)
- [agumartha053@gmail.com](#collaborators)
- [anisiubammesoma8@gmail.com](#collaborators)
- [Sophialisa908@gmail.com](#collaborators)

## Installation

To install the BookApp on your mobile device, follow these steps:

1. Clone the GitHub repository: `git clone https://github.com/chidubesteve/BookApp.git`
2. Navigate to the project directory: `cd BookApp`
3. Install the required dependencies: `flutter pub get`
4. Build the APK file: `flutter build apk`
5. Locate the generated APK file in the `build/app/outputs/flutter-apk` directory.
6. Transfer the APK file to your mobile device.
7. On your mobile device, navigate to the location where you transferred the APK file and install it.

Note: Ensure that you have Flutter and the necessary development environment set up before proceeding with the installation.

## Usage

Once you have installed the BookApp on your mobile device, follow these steps to start using it:

1. Launch the app from your device's app drawer.
2. On the onboarding screen, follow the instructions to set up the app.
3. Browse through the available books in the grid view or scroll through the different book categories.
4. Use the search bar to filter books based on your preferences.
5. Click on a book to view its detailed preview, including the author's name and description.
6. Purchase paid books from the payment screen and add them to your bookshelf.
7. Share books with others through various platforms using the share icon.
8. Bookmark your preferred books to easily access them later.
9. Enjoy reading offline or explore more books in the online version.
10. Explore different categories and discover new books to expand your reading collection.

## Support

For any inquiries, issues, or suggestions regarding the BookApp, please contact one of the [collaborators](#collaborators) listed above or send an email.

## License

This project is licensed under the [MIT License](https://github.com/git/git-scm.com/blob/main/MIT-LICENSE.txt).
