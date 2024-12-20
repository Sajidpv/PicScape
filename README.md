# PicScape - Wallpaper App

Get the APK from [Google Drive](https://drive.google.com/file/d/1Ofs5OH7pcioM5CDY5lEVj6U_bBSysqtc/view?usp=share_link)

PicScape is a Flutter-based app that lets users discover and download beautiful, high-resolution wallpapers. It fetches images from the Pexels API, allows image searching and browsing by categories, and supports lazy loading with a Pinterest-like image listing. Additionally, users can download high-resolution images directly to their devices.


Features

  1. **Home Screen**: Displays a list of popular photos fetched from the Pexels API.
  2. **Lazy Loading**: Images are loaded dynamically as the user scrolls (inspired by Pinterest’s image grid style).
  3.** Image Download**: Users can tap on any image to download directly to their device.
  4. **Search**: Allows users to search for images based on keywords.
  5. **Categories**: Users can filter images based on categories.
  6. **Image Download**: Tap on an image to download the high-resolution version to the device.
  7. **Local Notifications**: Displays a notification when the download is in progress and when it is completed.



Technologies & Packages Used

  1. **Provider**: Manages state for lazy loading and image fetching.
  2. **Cached Network Image**: Efficiently caches and loads images from the internet.
  3. **Path Provider**: Locates the correct directory to store downloaded images on the device.
  4. **Dio**: Manages HTTP requests to download images.
  5. ** Permission Handler**: Requests necessary permissions to write files to the device.
  6. **Get It**: A simple service locator for dependency management.
  7. **Shimmer**: Adds a loading effect for images while they are being fetched.
  8. **Flushbar**: Displays snackbars for messages, such as error or success notifications.
  9. **Flutter Staggered Grid View**: Used to create a Pinterest-style grid layout for images.
  10.**Flutter Local Notifications**: Sends notifications to inform the user about the download progress.


**App Setup**
  1. Clone the Repository
  git clone https://github.com/sajidpv/PicScape.git
  
  3. Install Dependencies
  Navigate to the project directory and run:
  flutter pub get
  
  3. Set up Pexels API
  To get access to the Pexels API, you need to sign up on Pexels and generate your API key.
  
  5. Run the App
  Once everything is set up, you can run the app on your emulator or physical device.


