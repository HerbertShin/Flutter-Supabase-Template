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
3. Update the Supabase redirect URL in the dashboard to match your app's deep link or route.
4. Run the Flutter app and enjoy the seamless authentication flow.
