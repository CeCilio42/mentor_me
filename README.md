# Flutter App Mentor Me README

## Project Name
This Flutter app helps users connect to eachother and gain information. We connect younger people who need help with daily tasks, and elderly people who are lonely by creating mentoring oppotunity's

## Table of Contents
1. Introduction  
2. Features  
3. Installation  
4. Usage  
5. Folder Structure  
6. Dependencies  

---

## Introduction
This Flutter app is designed to promote kindness and social connection by providing users with a platform to actively engage in positive interactions. The app enables users to:

- Engage in acts of kindness by easily performing small kind gestures, such as giving compliments, helping in the community, or participating in volunteer work.
- Join discussions on ways to improve the community, where users can share ideas and inspire each other with kindness stories.
- Stay updated on important initiatives, events, and campaigns focused on fostering kindness and community spirit.
- Personalize their experience by setting notification preferences, choosing topics of interest (such as mental health or volunteering), and adjusting accessibility settings.
- Connect with local and global communities, empowering users to feel involved in creating positive change and promoting kindness.

The app offers an intuitive and user-friendly interface, making it easy for both those already active in kindness and newcomers to navigate and contribute positively to their environment.

## Features
- Mentoring
- Chatting
- Badges for completing tasks

## Installation
1. Clone the repository:
   ```sh
   git clone https://github.com/CeCilio42/mentor_me
   ```
2. Navigate to the project directory:
   ```sh
   cd app-folder
   ```
3. Install dependencies:
   ```sh
   flutter pub get
   ```
4. Run the app:
   ```sh
   flutter run
   ```

## Usage

Main Screen
The main screen features a bottom navigation bar with a button that expands to show a chat screen. You can easily close the chat screen when you’re done.

Mentor Cards
On the main screen, you can click on a mentor card to view more information about a mentor. You can add the mentor to your list to start engaging with them.

Mentor Filter
You can filter mentors based on various criteria. The filter settings allow you to narrow down the search, although the filter settings can't be adjusted just yet (for now, imagine that you did).

Click "Close" on the modal to dismiss it.
Click the "Back" button to return to the homepage or navigate as needed.
Navigation
You can always navigate back to the homepage using the back button on the post page or the home icon in the navigation bar.

## Folder Structure
```
lib/
 ├── main.dart          # Main entry point
 ├── screens/           # App screens
```

## Dependencies
```yaml
dependencies:
  flutter:
    sdk: flutter
  google_fonts: ^6.1.0
```
