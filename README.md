# Rust Newsletter Service
![CI](https://github.com/Ejedavy/newsletter/actions/workflows/ci.yaml/badge.svg)
![Test](https://github.com/Ejedavy/newsletter/actions/workflows/test.yaml/badge.svg)
![Audit](https://github.com/Ejedavy/newsletter/actions/workflows/audit.yaml/badge.svg)

A robust newsletter service written in Rust, designed for efficiency and reliability.

<!-- Badges -->


![Newsletter](https://www.activecampaign.com/wp-content/uploads/2023/08/Newsletter.jpg)

## Description

This Rust-based newsletter service provides a platform for managing subscriptions and sending out newsletter emails efficiently. Leveraging Rust's performance and safety features, the service is both fast and reliable, making it an excellent choice for managing large-scale email campaigns.

### Features

- Subscribe/Unsubscribe functionality
- Email template management
- Bulk email sending with performance optimization
- Secure handling of user data

## Getting Started

### Dependencies

- Rust Programming Language (latest stable version)
- PostgreSQL for the database backend
- Any SMTP server for email sending (e.g., SendGrid, Mailgun)
- `.env` file for environment-specific settings

### Installing

Clone the repository and build the project:

```bash
# Clone the repository
git clone https://github.com/yourusername/rust-newsletter.git

# Navigate to the project directory
cd rust-newsletter

# Build the project
cargo build
```

## Configuration

Create a `.env` file in the root directory with the following contents:

- DATABASE_URL=postgres://user:password@localhost/newsletter
- SMTP_USERNAME=your_smtp_username
- SMTP_PASSWORD=your_smtp_password
- SMTP_SERVER=smtp.yourprovider.com
- SMTP_PORT=587
- SENDER_EMAIL=newsletter@yourdomain.com

Replace the values with your actual database credentials and SMTP settings.

## Executing program

Run the program with:

```bash
cargo run
```


Run tests with:

```bash
cargo test
```


## Usage

After starting the service, it will be listening for requests to handle newsletter subscriptions and sending emails.

### API Endpoints

- `POST /subscriptions` - for adding new subscribers
- `POST /newsletters` - for sending out a newsletter to all subscribers

## Contributing

Contributions to the newsletter service are welcome!

To contribute:

1. Fork the repository.
2. Create a new branch (`git checkout -b feature-branch`).
3. Make your changes.
4. Commit your changes (`git commit -am 'Add some feature'`).
5. Push to the branch (`git push origin feature-branch`).
6. Create a new Pull Request.

## Authors

- David Eje(https://github.com/ejedavy)

