# Supabase Authentication Template for Flutter

This Flutter project provides a complete authentication template integrated with Supabase, offering a seamless login, registration, and password reset experience. It is designed with best practices in mind, ensuring a user-friendly and responsive UI across all screen sizes.

## Features

### Login Screen
- Email and password authentication with form validation.
- "Forgot Password?" functionality to send password reset emails.
- Custom error handling with user-friendly messages.

### Registration Screen
- User registration with email and password.
- Form validation for email and password fields.
- Terms of Service and Privacy Policy acknowledgment.

### Forgot Password Screen
- Allows users to request a password reset link.
- Email validation to ensure proper input.
- Custom Snackbar notifications for success and error messages.
- Option to return to the login screen.

### Reset Password Screen
- Handles password reset flow after clicking the reset link in the email.
- Secure password update with validation.

### Error Handling
- A generic error screen to handle initialization or critical errors with friendly messages.

### Responsive Design
- Optimized for various screen sizes and devices.
- Professionally styled text fields and buttons for a clean and modern look.

## Setup Instructions

1. Clone the repository.
2. Set up a Supabase project and configure the `.env` file with your `SUPABASE_URL` and `SUPABASE_ANON_KEY`.
3. Update the `.env` file path in `lib/configs/app_configs.dart` to your file path.
4. Update the Supabase redirect URL in the dashboard to match your app's deep link or route.
5. Run the Flutter app and enjoy the seamless authentication flow.

## Bulk Renaming Instructions in VS Code

To replace all occurrences of a word or phrase across the project using VS Code:

1. Open the **Search panel** by pressing `Cmd + Shift + F` (on Mac) or `Ctrl + Shift + F` (on Windows/Linux).
2. In the search bar, type the word or phrase you want to replace (e.g., `template`).
3. Click the small arrow next to the search bar to expand the options.
4. In the **Replace** field, type the new word or phrase (e.g., `word_bridge`).
5. Ensure the **Match Case** and **Match Whole Word** options are unchecked (unless needed).
6. Click **Replace All** to apply the changes across the project.

This is a quick and efficient way to rename variables, classes, or other text throughout your codebase.
