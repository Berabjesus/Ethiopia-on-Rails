# Ethiopia on Rails, Articles Web App About Ethiopia

> This is a Ruby on Rails Capstone project in Microverse's rails curriculum, to build a Ruby on Rails application where people can write articles. Find it the project description [here](https://www.notion.so/Lifestyle-articles-b82a5f10122b4cec924cd5d4a6cf7561#55d51338627b42bd95d86e2d1e58f105).

> This website is created to allow users to view, create, update, and store articles and images about the country Ethiopia. It has several other functionalities like login through Github and Google, see the current weather in Ethiopia, search an article and view articles by the current user.

[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![License: MIT][license-shield]][license-url]

## Built With

- Ruby v2.7.0
- Ruby on Rails v6.0.3
- HTML
- CSS
- Bootstrap
- Carrierwave
- Cloudinary
- Omniauth
- Rspec
- Capybara
- Bcrypt
- Rubocop

## Features
- Login or sign up with Google, Github or directly with the web app
- See the available categories
- Search for articles
- See articles created by the logged in user
- Vote for Articles
- Edit articles
- See the highest voted article in the index page

## See the Live version here - > [Live Link](https://polar-lake-14735.herokuapp.com)

### Prerequisites

- Ruby: 2.6.3
- Rails: 5.2.3
- Postgres: >=9.5

## Getting Started

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
1. Updaate your yanr if its outof date with `yarn install --check-files`
2. Run `rails db:create`
3. Run `rails db:migrate`
4. Sign up and login using the app. Login with github and google will only work in the live version because the api keys are not available publicly.