## Setup Guide 📚

- You can read through this [documentation](https://guides.rubyonrails.org/v5.1/getting_started.html) to setup ruby on rails on your machine.

## System Requirements ⚙️🛠️

- Ruby version `3.0.3`
- Rails version `6.0.0` or higher
- Postgresql version  `16.0` or higher
- NodeJS version `16.17.0` or higher

## Server setup 🖥️

(On the Codebase)

- On the `config/` folder create a `local_env.yml` file.
- The file should contain the following ENV variables needed for the application to run.
  ```yaml
  # On config/local_env.yml

  DB_USERNAME: 'your_db_username'
  DB_PASSWORD: 'your_db_password'
  DB_HOST: 'localhost'
  ```

(On Terminal/Console)

- Run `bundle install` to install the necessary gems for the application
- Create the database by running `rails db:create`.
- To add the tables to database `rails db:migrate`.
- To populate the database with initial date run `rails db:seed`.
- Then run `bin/dev` to start your server. The rails app should be accessible in `localhost:3000` in you browser.
