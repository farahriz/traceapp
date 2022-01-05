# Trace App
Simple contact tracing app in Rails.

## Install

### Clone the repository

```shell
git clone git@github.com:farahriz/traceapp.git
cd traceapp
```

### Check your Ruby version
```shell
ruby -v
```

This app was created with ruby 3.0.3

If your don't have an appopriate version of ruby, install the right version using [rbenv](https://github.com/rbenv/rbenv) (it could take quite a while, but don't panic; it just takes some time):

```shell
rbenv install 3.0.3
```

### Install dependencies
Using [Bundler](https://github.com/bundler/bundler) and [Yarn](https://github.com/yarnpkg/yarn):
```shell
bundle && yarn
```

Install neccesary gems
```shell
bundle install
```

### Initialize the databsell
```shell
rails db:create db:migrate
```

### Start the server and try it out
```shell
bin/rails server
```

App should run on localhost:3000
