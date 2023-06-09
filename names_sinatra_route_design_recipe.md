# GET /names Route Design Recipe

## 1. Design the Route Signature

You'll need to include:
  * the HTTP method
  * the path
  * any query parameters (passed in the URL)
  * or body parameters (passed in the request body)

## 2. Design the Response

The route might return different responses, depending on the result.

For example, a route for a specific blog post (by its ID) might return `200 OK` if the post exists, but `404 Not Found` if the post is not found in the database.

Your response might return plain text, JSON, or HTML code. 

_Replace the below with your own design. Think of all the different possible responses your route will return._

```
<!-- Response when the post is found: 200 OK -->

Julia, Mary, Karim

```

```
<!-- Response when the post is not found: 404 Not Found -->


```

## 3. Write Examples


```
# Request:

GET /names

# Expected response:

Response for 200 OK
```

```
# Request:

GET /names?id=1

# Expected response:

Response for 404 Not Found
```

## 4. Encode as Tests Examples

```ruby
# file: spec/integration/application_spec.rb

require "spec_helper"

describe Application do
  include Rack::Test::Methods

  let(:app) { Application.new }

  context "GET /" do
    it 'returns 200 OK' do
      response = get('/names')
      expected_response = 'Julia, Mary, Karim'

      expect(response.status).to eq(200)
      expect(response.body).to eq(expected_response)
    end

    it 'returns 404 Not Found' do
      response = get('/names?id=1')

      expect(response.status).to eq(404)
    end
  end
end
```

## 5. Implement the Route

Write the route and web server code to implement the route behaviour.
