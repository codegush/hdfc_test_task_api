# HDFC Test Task API
This api is a test task demonstration of a user getting logged in using oauth apps provided by various social networks, i.e. facebook, twitter, github, linkedin, google and instagram

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites

Please make sure you are running with ruby ~2.3.7, rails ~5.1.6 and postgres 9.6

### Installing

Please following the below steps to set it up on your local machine

1. Clone the repository
2. Setup the DB creds in the `config/file database.yml`
3. Create DB using
    ```
    rake db:create
    ```
4. Create tables using
    ```
    rake db:migrate
    ```
5. Run the server using 
    ```
    rails s -b 'ssl://localhost:3000?key=/home/tech/Downloads/localhost.key&cert=/home/tech/Downloads/localhost.crt'
    ```
    For more information on running the rails app on ssl please have a look on the link [Install SSL certificate on local machine](https://www.devmynd.com/blog/rails-local-development-https-using-self-signed-ssl-certificate/)

## Authors

* **Hemant Manwani** - *Initial work* - [Profile](https://hemant-manwani.github.io/profile/)

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details
