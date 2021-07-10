## Requirement


- Ruby v 3.0.2
- Rails v 6.1.4
- Sqlite3 v 1.4
- Node v 14.17.3



## Setup in Local


``` bash
# clone from repository
$ git clone https://github.com/eli-kristina/ror.git

# go to the working directory
$ cd ror

# install dependencies
$ RAILS_ENV=development bundle install

# migrate database
$ rake db:migrate
$ rake db:seed

# serve with reload at localhost:3001
$ RAILS_ENV=development rails s -p 3001

# open your browser http://localhost:3001
```


## Run Unit Test


``` bash
# Run all unit test
$ bundle exec rspec

# Run specific file to test 
$ rspec ./spec/{file_path}
```



## GraphQL


http://localhost:3001/graphiql


``` bash
# sample usage
query {
    fetchPermissions(id: 1) {
      id
      name
    }
}
```