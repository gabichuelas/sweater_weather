## Sweater Weather

_Sweater Weather_ is a backend Rails API for a hypothetical weather & trip planning app that connects to the **Mapquest**, **Open Weather**, and **Pixabay** exernal APIs.

This project was completed during the end of Module 3 of the Backend Engineering Program at [Turing](www.turing.io), which focuses on building and consuming API's.

[Original Project Page](https://backend.turing.io/module3/projects/sweater_weather/)<br>
[Technical Requirements](https://backend.turing.io/module3/projects/sweater_weather/requirements)

### Versions
* Ruby 2.5.3
* Rails 6.0.3
* PostgreSQL database
* RSpec for testing

### Setup
1. Fork & clone the repo
2. Run `bundle install`
3. Run `rails db:{create,migrate}`
4. Run `bundle exec figaro install`
5. Add your API keys to the newly created `config/application.yml` file. Reference the **API Keys** section below for compatible environment variable key naming.
6. To run local test suite: `bundle exec rspec`
  * All API responses in test suite are mocked using `webmock` and `vcr` gems with the exception of the tests under `spec/services` which test the original external API connections to three different sources.

### Get Your Keys!
Add these to your `application.yml` file:

[Mapquest API](https://developer.mapquest.com/documentation/geocoding-api/)<br>
`GEOCODING_API_KEY: <api_key>`

[Open Weather API](https://openweathermap.org/api/one-call-api)<br>
`OPEN_WEATHER_API_KEY: <api_key>`

[Pixabay API](https://pixabay.com/service/about/api/)<br>
`PIXABAY_API_KEY: <api_key>`

### Sweater Weather in Action!
* Make sure to spin up a local server for _Sweater Weather_ before trying to run the requests in Postman.
* From the project directory, run `rails s`.
* The Postman collection below uses `http://localhost:3000` as the base domain.
[![Run in Postman](https://run.pstmn.io/button.svg)](https://app.getpostman.com/run-collection/1743be49414cecbda190)
