# VoltVault

Welcome to **VoltVault**, your one-stop shop for all electronic needs!

## About

VoltVault is an ecommerce app designed to provide a seamless shopping experience for electronic enthusiasts. Browse our extensive collection of gadgets, gizmos, and cutting-edge technology products.

## Table of Contents

- [Features](#features)
- [Technologies Used](#technologies-used)
- [Installation](#installation)
  - [Prerequisites](#prerequisites)
  - [TypeScript (npm Package)](#typescript-npm-package)
  - [Flutter App](#flutter-app)
- [Environment Variables](#environment-variables)
- [Running the App](#running-the-app)
- [Contributing](#contributing)
- [License](#license)

## Features

- Browse and search for electronic products.
- Detailed product information and reviews.
- Shopping cart and checkout functionality.
- User account management.
- Admin panel for product management and order tracking.

## Technologies Used

- **Frontend**: Flutter for the mobile application.
- **Backend**: TypeScript with Node.js for the backend API.
- **Database**: MongoDB for storing data.

## Installation

### Prerequisites

Ensure you have the following installed on your system:

- [Node.js](https://nodejs.org/) (for the backend)
- [npm](https://www.npmjs.com/) (Node package manager)
- [Flutter](https://flutter.dev/docs/get-started/install) (for the mobile app)
- [Dart](https://dart.dev/get-dart) (comes with Flutter SDK)
- [MongoDB](https://www.mongodb.com/docs/manual/installation/) (for the database)

### TypeScript (npm Package)

1. **Clone the Repository:**

   ```bash
   git clone https://github.com/ShivangSrivastava/VoltVault.git
   cd VoltVault
   ```

2. **Navigate to the Backend Directory:**

   ```bash
   cd server
   ```

3. **Install Dependencies:**

   ```bash
   npm install
   ```

4. **Create a `.env` File:**

   Copy the example environment file and add your configuration:

   ```bash
   cd .>.env
   ```

5. **Add Environment Variables:**

   Open the `.env` file and add the following variables:

   ```env
   JWT_SECRET_KEY=your_jwt_secret_key_here
   TOKEN_HEADER_KEY=your_token_header_key_here
   ```

6. **Run the Backend Server:**

   ```bash
   npn run build
   npm start
   ```

### Flutter App

1. **Navigate to the Flutter Directory:**

   ```bash
   cd volt_vault
   ```

2. **Install Dependencies:**

   ```bash
   flutter pub get
   ```

3. **Run the Flutter App:**

   ```bash
   flutter run
   ```

## Running the App

1. **Start the Backend Server:**

   Navigate to the `server` directory and run:

   ```bash
   npm start
   ```

2. **Start the Flutter App:**

   Navigate to the `flutter` directory and run:

   ```bash
   flutter run
   ```

Ensure the backend server is running before starting the Flutter app to ensure the frontend can connect to the API.

## Contributing

We welcome contributions to VoltVault! If you have suggestions or improvements, please follow these steps:

1. Fork the repository.
2. Create a new branch for your changes.
3. Make your changes and commit them.
4. Open a pull request with a clear description of your changes.

---

### Additional Resources

- [Flutter Documentation](https://flutter.dev/docs)
- [Node.js Documentation](https://nodejs.org/en/docs/)
- [npm Documentation](https://docs.npmjs.com/)

Feel free to reach out if you have any questions or need further assistance!

Happy coding!
