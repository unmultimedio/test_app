# README

This is a simple application that allows users to register. The goal is to be a small coding task. Don't spend more than 1 hour.

## User registration

- Users should be able to register via an API Endpoint.
- A new user model should be created. Users have a unique email, first_name, last_name, zipcode, street and country
- This should be programmed with a simple Form object. You can go plain ruby object, or a gem, as you like.
- The users then receive a token in their model. That token has to be unique.
- Please write some basic tests.

## View details for the given user

- API Endpoint that returns details for the given user
- A token is required to access this endpoint and give user access.
- Please write a basic test.

Pick the tools you like and feel comfortable with. The goal is for me to see how you program.

# My own solution

- App is dockerized (but can be run in local rails environment)
- DB is SQLite
- Recommended testing using Postman-like app or curl

## Endpoints

### Register new user

Make a `POST` call to `/users` with body:

```
{
  "user": {
    "email": "ironman@avengers.marvel",,
    "first_name": "Tony",
    "last_name": "Stark",
    "zipcode": "1R0NM4N",
    "street": "Some Hidden Street",
    "country": "USA"
  }
}
```

Where `email` is mandatory, all other fields are optional.

The response should be something like:

```
{
  "id": 4,
  "email": "ironman@avengers.marvel",,
  "first_name": "Tony",
  "last_name": "Stark",
  "zipcode": "1R0NM4N",
  "street": "Some Hidden Street",
  "country": "USA"
  "token": "YnajVZXy1JX25SDci54Z6Es3",
  "created_at": "2017-02-07T04:18:13.039Z",
  "updated_at": "2017-02-07T04:18:13.039Z"
}
```

Save the `token` for future requests.

### Get a user

Make a `GET` call to `/users/:id?token=:token`.

If the token is correct, response should be something like:

```
{
  "id": 4,
  "email": "ironman@avengers.marvel",,
  "first_name": "Tony",
  "last_name": "Stark",
  "zipcode": "1R0NM4N",
  "street": "Some Hidden Street",
  "country": "USA"
  "token": "YnajVZXy1JX25SDci54Z6Es3",
  "created_at": "2017-02-07T04:18:13.039Z",
  "updated_at": "2017-02-07T04:18:13.039Z"
}
```

## Rails test

There are some test at model and controller level. You can run it by:

```
rails test
```