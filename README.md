# Hotel Engine Challenge

## About

Challenge: Using Ruby on Rails, create a client that requests and consumes an external A{I of your choice. The API source can be anything you find interesting - music, movies, books, hiking trails, etc.

The deployed site's endpoints can be consumed at:

https://hotel-engine-challenge.herokuapp.com/


## Endpoints

### POST /api/v1/users

This endpoint is for creating a user.
Required params: 
```
params: {
      email: "billy123@example.com",
      password: "password123",
      password_confirmation: "password123"
}
```
Returns token when user is successfully created. Token is used for all API requests. 
Example of expected output:
```
{
    "token": "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE2MjQ3NjYzNDF9.0dptvQtYU_KlPgVf1Y"
}
```

### POST /api/v1/authentication

This endpoint is for authenticating a user. NOTE: Token expires after 24 hours so you must authenticate to receive a new one.

Required params: 

```
params: {
      email: "billy123@example.com",
      password: "password123",
}
```

**Returns a 404 error if the user is not found.**

Example of successful output:
```
{
    "token": "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE2MjQ3NjYzNDF9.0dptvQtYU_KlPgVf1Y"
}
```

### GET /api/v1/movies/list/:movie_lists

This endpoint returns a movie list based on list type.

List type: now_playing, popular, top_rated, upcoming, latest

Example of input:  /api/v1/movies/list/now_playing

Required header: 
```
'Authorization': "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE2MjQ3NjYzNDF9.0dptvQtYU_KlPgVf1Y"
```


Example of successful output:
```
 {
    "data": {
        "id": "1",
        "type": "movie",
        "attributes": {
            "date": null,
            "page": 1,
            "results": [
                {
                    "adult": false,
                    "backdrop_path": "/620hnMVLu6RSZW6a5rwO8gqpt0t.jpg",
                    "genre_ids": [
                        16,
                        35,
                        10751,
                        14
                    ],
                    "id": 508943,
                    "original_language": "en",
                    "original_title": "Luca",
                    "overview": "Luca and his best friend Alberto experience an unforgettable summer on the Italian Riviera. But all the fun is threatened by a deeply-held secret: they are sea monsters from another world just below the water’s surface.",
                    "popularity": 6852.159,
                    "poster_path": "/7rhzEufovmmUqVjcbzMHTBQ2SCG.jpg",
                    "release_date": "2021-06-17",
                    "title": "Luca",
                    "video": false,
                    "vote_average": 8.2,
                    "vote_count": 1147
                }
}
```
```
Optional param : {
  page: #page_number
}
```

### GET /api/v1/movies/search

Search for your favorite movie. _Users token is required in header_ 

Required params: {
            'query': the matrix
}

Example of successful output:
```
{
    "data": {
        "id": "1",
        "type": "movie",
        "attributes": {
            "date": null,
            "page": 1,
            "results": [
                {
                    "adult": false,
                    "backdrop_path": "/8K9qHeM6G6QjQN0C5XKFGvK5lzM.jpg",
                    "genre_ids": [
                        28,
                        878
                    ],
                    "id": 603,
                    "original_language": "en",
                    "original_title": "The Matrix",
                    "overview": "Set in the 22nd century, The Matrix tells the story of a computer hacker who joins a group of underground insurgents fighting the vast and powerful computers who now rule the earth.",
                    "popularity": 45.449,
                    "poster_path": "/f89U3ADr1oiB1s9GkdPOEpXUk5H.jpg",
                    "release_date": "1999-03-30",
                    "title": "The Matrix",
                    "video": false,
                    "vote_average": 8.2,
                    "vote_count": 19353
                }
```

### GET /api/v1/movie/:id

Returns specific movie details based on movie id
Example of expected output:
```
{
    "data": {
        "id": "1",
        "type": "movie",
        "attributes": {
            "date": null,
            "page": null,
            "results": {
                "adult": false,
                "backdrop_path": "/3GgkzCDq6KYpcmJmcOKh27hYRyj.jpg",
                "belongs_to_collection": null,
                "budget": 0,
                "genres": [
                    {
                        "id": 12,
                        "name": "Adventure"
                    },
                    {
                        "id": 16,
                        "name": "Animation"
                    },
                    {
                        "id": 10751,
                        "name": "Family"
                    },
                    {
                        "id": 14,
                        "name": "Fantasy"
                    }
                ],
                "homepage": "http://www.cinemamanagementgroup.com/film/ainbo/",
                "id": 588921,
                "imdb_id": "tt6570098",
                "original_language": "en",
                "original_title": "Ainbo: Spirit of the Amazon",
                "overview": "A girl was born and grew up in the deepest jungle of the Amazon, Colonia, that rests on the back of the most powerful Mother Spirit in the Amazon, Turtle Motelo Mama. One day she discovers that her homeland is being threatened and realizes that there are other humans in the world besides her people. As she fights to save her paradise against the greed and exploitation of children, logging, and illegal mining, she begins to struggle to reverse this destruction and impending evil of the Yucuruna, the darkness that lives in the Amazon. Guided by her mother's spirit, Ainbo is determined to save her land and save her people before it's too late.",
                "popularity": 58.684,
                "poster_path": "/dIksjFRSsSNRQXKFOh1xP2FL5Jv.jpg",
                "production_companies": [
                    {
                        "id": 116034,
                        "logo_path": null,
                        "name": "Tunche Films",
                        "origin_country": ""
                    }
```

### GET /api/v1/user/searches

Returns the users past search querys. _Users token is required in header_

Example of successful output:
```
{
    "data": [
        {
            "id": "1",
            "type": "search",
            "attributes": {
                "query": "/api/v1/movies/list/popular",
                "count": 1,
                "id": 1
            }
        }
    ]
}
```

### GET /api/v1/searches

This Enpoint returns all searches with all counts. _Token required_ I wasn't sure whether to leave it required or not but a future feature could be that there are admin tokens that can get different info like the one below.

Example of successful output:
```
{
    "data": [
        {
            "id": "1",
            "type": "search",
            "attributes": {
                "query": "/api/v1/movies/list/popular",
                "count": 1,
                "id": 1
            }
        }
    ]
}
```
