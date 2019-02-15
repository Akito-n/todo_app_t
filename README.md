# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version 2.5.3

* System dependencies

* Configuration

* Database creation PostgreSQL 11.1

* Database initialization

* How to run the test suite CircleCI

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

### schema

<img width="746" alt="2019-02-06 17 04 47" src="https://user-images.githubusercontent.com/47377923/52328805-4113e680-2a34-11e9-8459-32c0ed18a266.png">


### How to Deploy

1. Create an account to log in to Heroku
2. install "heroku-cli" [installer](https://devcenter.heroku.com/articles/heroku-cli#download-and-install)
3. log in to heroku

   ```   
  $ heroku login -i

  $ Enter your Heroku credentials.
  $ Email "your email"
  $ Password: "your password"

   ```

4. Go to the project folder
```
$ cd ~/yourproject
```   
5. create app on heroku
```
$ heroku create "Your App Name"
```

 * App name must be uniq

If you want to check the name of the application


```
$ heroku apps
```

After creating the Heroku application, **heroku** is created as a remote repository in git.

```
$ git remote -v
```

Deploy your app on heroku

```
$ git push heroku "Your App name"
```
