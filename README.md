# Moodster

Mental health is incredibly important and Moodster is here to help you easily keep track of your daily emotions through the use of facial recognition. Built in Ruby, Moodster is able to capture your image, analyze that image, set your mood from the image and keep track of your all your images.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites


The Ruby Gems
gem 'sinatra-activerecord'
gem 'sqlite3'
gem 'pry'
gem 'require_all'
gem 'rest-client'
gem 'json'
source "https://rubygems.org"
```
* [Microsoft Azure Face API]
(https://azure.microsoft.com/en-us/services/cognitive-services/face/) - API Dependency
```

### Installing

```
Step 1. Fork repository

```
Step 2. Clone repository to your computer

```
Step 3. ::run (bundle install) from the terminal

```
Step 4. ::Go to moodster/app/models/user.rb and enter
your Microsoft Facial Recognition Key: The place holder key there is expired.

```
Step 5. ::run (rake db:migrate) from the terminal to create your local database

```
Step 6. ::run (rails s) from the terminal to start application.

```
Step 7. ::open http://localhost:3000/ from your web browser.

```

## Deployment

Moodster uses Microsoft's Facial Recognition to build an emotions model to create a daily emotional tracking diary.

## Built With

* [Ruby](https://www.ruby-lang.org/en/) - The ruby framework used
* [ActiveRecord](http://guides.rubyonrails.org/active_record_basics.html) - ActiveRecord Database Management
* [SQLite3](https://www.sqlite.org/cli.html) - Database
* [Microsoft Facial Recognition: Azure Face](https://azure.microsoft.com/en-us/services/cognitive-services/face/) - Facial Recognition

## Contributing

Please read [CONTRIBUTING.md](./CONTRIBUTING.md) for details on our code of conduct, and the process for submitting pull requests to us.

## Versioning

We use [SemVer](http://semver.org/) for versioning. For the versions available, see the [tags on this repository](https://github.com/your/project/tags).

## Authors

* **Abraham Lin** - *Dev* - [alin684](https://github.com/alin684)
* **Bryan Ortiz** - *Dev* - [zitro](https://github.com/zitro)

See also the list of [contributors](https://github.com/your/project/contributors) who participated in this project.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

* Microsoft Azure Face API.
