# HDFC Test Task API
This api is a test task demonstration of a user getting logged in using oauth apps provided by various social networks, i.e. facebook, twitter, github, linkedin, google and instagram

### Heroku link: [API](https://hdfcapi.herokuapp.com/)

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

MIT License

Copyright (c) 2017 Hemant Manwani

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
