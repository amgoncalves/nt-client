# nanoTwitter Client Library

[nanoTwitter (nT)](https://github.com/amgoncalves/sassy-twitter) is a minimal version of [Twitter](https://twitter.com/) built on [Sinatra](http://sinatrarb.com/).  This client library provides tools to interface with the nanoTwitter API.

## Routes

Tweet

```
GET "/api/v1/:apitoken/tweets/:id"
GET "/api/v1/:apitoken/tweets/recent"
POST "/api/v1/:apitoken/tweets/new"
POST "/api/v1/:apitoken/tweets/:id/reply"
POST "/api/vi/:apitoken/tweets/:id/retweet"
```

User

```
GET "/api/v1/:apitoken/users/:key"
GET "/api/v1/:apitoken/users/:key/tweets"
GET "/api/v1/:apitoken/users/:key/followers"
GET "/api/v1/:apitoken/users/:key/following"
POST "/api/v1/:apitoken/users/:key/follow"
POST "/api/v1/:apitoken/users/:key/unfollow"
```

Search:

```
POST "/api/v1/:apitoken/search/:key/users"
POST "/api/v1/:apitoken/search/:key/tweets"

```

TODO:

```
POST "/api/v1/:apitoken/users/:key/update"
```

## Authors

Si Chen, Alyssa Goncalves, Shuai Yu

COSI-105b Software Engineering for Scalability

Brandeis University, Spring 2018
