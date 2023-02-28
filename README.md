## Overview
* ShortLink is a URL shortening service where you enter a URL such as https://www.youtube.com/, and it returns a short URL such as https://rb.gy/2qcweb
---
## My approach

#### Overview functions
* `/encode` feature to encode a URL to shortened URL. Using an encrypted hash to shorten your original URL.
* `/decode` feature to decode a shortened URL to its original URL
* When users access its shorterned_url on the website, it will redirect to original URL(`Perhaps not including in requirements, but I want to challenge myself how to resolve it`)

#### Design

##### Client
* `/encode`
    * I use `SecureRandom.base58` module to generate a random hash string(a-z, A-Z, 0-9). With shortened link with a hash of six characters. I can generate `64^6=68B(billion)` shortened links. 
* `/decode`
    * For the decode function, we will query the database to get its original URL relies on a shortened link. I use RDBMS to read this information from the database. However, with an application not relying much on associations with other tables, I recommend using the `Redis` database to increase read-function speed and decrease latency.
##### API
* For API functions(`encode and decode`). I suppose we give these APIs to a third party or to the front-tend team in a microservice system. We need to use at least one security layer to ensure the authorized User uses our API. In my project, I use `JSON Web Tokens(JWT)` to generate authentication JWT to verify authorized users when calling my API features.
* For authentication, I set the token working only 10 minutes to easily raise an `Unauthorized` error if the token expired.

##### Redirection function
* When users access a shortened link on the browser. I want to check whether this URL is valid or not and redirect back to its original URL if it is valid and exists in my system. I will customize my routes to do this function.

##### Deployment
* I will deploy this project on Heroku.

##### Testing
* I use the RSpec gem to write unit tests. Because time is limited, I could only write unit cases I pretended to write, not including unit tests in my application. But I would write unit tests to ensure code quality and function to reduce errors in actual projects I worked on.

----

### System dependencies
If you clone this project and run it on your local. Ensure your laptop/computer is familiar with these versions to avoid any problems when running my project.
* Rails 7.0.4
* Ruby 3.1.3

### Installation
1. Clone this project
2. Run `rake db:migrate`
3. Run `rails server`
4. If you want to test your local, import [my Postman collection](https://github.com/minhtienvu/url_shortener/blob/master/Oivan_url_shortened.postman_collection.json) to test in `Local` folder 

---
### API Documentation

#### Public features
* Encode: 
    * Description: Encode an original URL to a shortened URL
    * URL: `/encode`
    * Method: GET
    * Params
    | Parameter | Type | Required  | Description |
    | `original_url` | `string` | true | An original url wants to encode |

* Decode:
    * Description: Decode a shortened URL to its original one
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
* Delete User
    * Description: Delete a user from id
    * URL: `/users/:id`
    * Method: DELETE
#### API External
* Login
    * Description: Get a new token from your email and password(The token is valid for 10 minutes). Use this token to call API `/api/encode` and `/api/decode`
    * URL: `/api/auth/login`
    * Method: POST
    * Params
    | Parameter | Type | Required  | Description |
    | `email` | `string` | true | Your email |
    | `password` | `string` | true | Your password  |
* Encode
    * Description: API encode from an original URL to a shortened URL
    * URL: `/api/encode`
    * Authorization: Bearer Token
    * Method: GET
    * Params
    | Parameter | Type | Required  | Description |
    | `original_url` | `string` | true | Your original url wants to encode |
* Decode
    * Description: API decode a shortened URL to its original one
    * URL: `/api/decode`
    * Authorization: Bearer Token
    * Method: GET
    * Params
    | Parameter | Type | Required  | Description |
    | `short_url` | `string` | true | A shortened url wants to decode |

## How to test my application
I attached my Postman collection on this project. You can [download at this link](https://github.com/minhtienvu/url_shortener/blob/master/Oivan_url_shortened.postman_collection.json) and import it to your Postman application to test it easily : 
- `Local` folder: If you clone this project and test it on your local
- `Heroku` folder: If you want to use my project on the Heroku server

#### For public features
   * You can use some features without creating an account at [these list](https://github.com/minhtienvu/url_shortener/edit/master/README.md#public-features).
#### For API features(particularly `/api/encode` and `/api/decode`)
   * You need to follow these steps as a new user:
       * **Step 1**. Create a new account (If you already have one, skip this step. Next step 2).
       * **Step 2**. Login with your created account to get a new token in API `/api/auth/login`.
       * **Step 3**. In the Postman application, Choose `Authorization -> Type -> Bearer Token` -> Insert your token step 2 in `Token` input. Then insert your params according to `encode` or `decode` function to call API.
           *  If you have `Permission denied!!` error which means your token is expired, please use API `/api/auth/login` again to get a new token(I only set 10 minutes for the token in my project).
       * **Step 4**. You can use a shortened URL on the browser. It will redirect to your original URL if it has been encoded and exists in the database.


### Security
- When our application is large. We should consider limiting the times of creating a shortened link relying on a user IP or an account per day to avoid a DOS attack. We can use the `Rate Limiting` technique, such as set limited times of API requests from an IP, an account per day.

### Scalability
- To avoid the duplicate shortened urls when creating, we can use a longer hash with 8, 10 characters, or more than that to reduce the times of query whether it existed or not in `encode step`. More hashes we can create, the fewer times it duplicates.
- For a shortened URL system, the ratio of reading data is normally higher than creating new shortened URLs. To increase the speed of retrieving data from the database. I suggest using a Cache system like `Redis` to save `original_url and short_url` information to increase the speed of retrieving existing data.
- With hundred thousands/millions of requests per day, we should consider using `a load balancer` to distribute our requests to avoid overloading the server. If we use MySQL, we can consider using `Mysql Replication` to duplicate database records to stay consistent in data.
