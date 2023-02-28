## Overview
* ShortLink is URL shortening service where you enter a URL such as https://www.youtube.com/  and it returns a short URL such as https://rb.gy/2qcweb

## My approach

### Overview functions
* `/encode` feature to encode a URL to shortened URL. Using an encrypted hash
* `/decode` feature to decode a shortened URL to its original URL
* When user using its shorterned_url on the website, it will return back to original url(Not in requirements, but I want to challenge myself how to resolve it)

### Design

#### Client
* `/encode`
    * I use `SecureRandom.base58` module to generate a random hash string(a-z, A-Z, 0-9). With shortened link with hash 6 characters. I can generate `64^6=68B(billion)` shortened links. It can work effectively with a million-user application generating new shortened links every month in 5 years.
* `/decode`
    * For decode function, we will query into database to get its original url relies on a shortened link. I use RDBMS to read this information from database. However, with an application do not rely much on associations with other tables, I recommend to use `Redis` database to increase the speed of read-function and decrease the latency.
#### API
* For API functions(`encode and decode`). I supopose we give these API to a third party or to fron-tend team in a microservice system. We need to use at least one security layer to ensure the authorized user to use our API. In my project, I use JSON Web Tokens(Jwt) to generate authentication JWT to verify authorized user when calling to my application.
* For authentication, I set token working only 10 minutes to easily raise `Unauthorized` error if token expired.

#### Redirection function
* When user entering a shortend link on the browser/url. I want to check whether this url valid or not, and redirect back into its original url if it is valid and existed in my system. I will custom my routes to do this function.

#### Deployment
* I will deploy this project on Heroku.

#### Testing
* I use RSpec gem to write unit tests. Because time is limited so I could only write unit cases I pretend to write, not including unit tests in my application. But in real projects I worked, I would write unit tests to ensure my quality of code and function to reduce errors.

## System dependencies
Ensure your laptop/computer is familiar with these versions to avoid any problems when running my project.
* Rails 7.0.4
* Ruby 3.1.3


## Installation
1. Clone this project
2. Run `rake db:migrate`
3. Run `rails server` and enjoy


### API Documentation

#### Public features
* Encode:
    * Description: Encode an original url to a shortend url
    * URL: `/encode`
    * Method: GET
    * Params
    | Parameter | Type | Required  | Description |
    | `original_url` | `string` | true | Your original url wants to encode |

* Decode:
    * Description: Decode a shortend url to its original one
    * URL: `/decode`
    * Method: GET
    * Params
    | Parameter | Type | Required  | Description |
    | `short_url` | `string` | true | A shortened url wants to decode |
- List users:
    *  Description: Show all users
    * URL: `/users`
    * Method: GET
* Create User
    * Description: Create a new user
    * URL: `/users`
    * Method: POST
    * Params
    | Parameter | Type | Required  | Description |
    | `name` | `string` | true | Your full name |
    | `email` | `string` | true | Your email |
    | `password` | `string` | true | Your password  |
    | `username` | `string` | true | Your username
* Login
    * Description: Get a new token from your email and password
    * URL: `/api/auth/login`
    * Method: POST
    * Params
    | Parameter | Type | Required  | Description |
    | `email` | `string` | true | Your email |
    | `password` | `string` | true | Your password  |
* Delete user
    * Description: Delete a user from id
    * URL: `/users/:id`
    * Method: DELETE
#### API External
* Encode
    * Description: API encode from an original url to a shortend url
    * URL: `/api/encode`
    * Method: GET
    * Params
    | Parameter | Type | Required  | Description |
    | `original_url` | `string` | true | Your original url wants to encode |
* Decode
    * Description: API decode a shortend url to its original one
    * URL: `/api/decode`
    * Method: GET
    * Params
    | Parameter | Type | Required  | Description |
    | `short_url` | `string` | true | A shortened url wants to decode |

## How to test my application
`NOTE:` I attach an exported collection from my Postman. You can export to use this on your Postman application. Download here: abcwyc.com
1. For public features, you can use all of them.
2. For API features(particularly `/api/encode` and `/api/decode`). You need to follow these steps as a new user:
    1. Create a new account (If you already have an account, skip this step. Next step 2).
    2. Login with your account to get new token.
    3. In Postman application, Choose `Authorization -> Type -> Bearer Token` -> Insert your token step 2 in `Token` input, to call API `/api/encode` and `/api/decode`.
        *  If you have `Permission denied!!` error, please login again to get new token(I only set 10 minues for token in my project).

### Security
- When our application is large. We should consider to limit the times of creating a shortend link relying on user IP or an account per day to avoid DOS attack. We can use `Rate Limiting` technique such as set limit API requests from an IP, an account per day.

### Scalability
- To avoid the same shortened urls when creating, we can use a longer hash with 8, 10 characters or more than that to reduce the times of query whether it existed or not in `encode step`. More hashes we can create, the less times it duplicate.
- For a shortend url system, the ratio of reading data is higher than creating new shortend urls. To increase the speed of retrieving data from the database. I suggest to use a Cache system like `Redis` to save information of `original_url and short_url`, to increase the speed of retrieving existing data.
- With thousands/millions of requests per day, we should consider to use `a load balancer` to distribute our requests to avoid overloading server. If we use mysql, we can consider to use `Mysql Replication` to duplicate database records to stay consistent in data.
