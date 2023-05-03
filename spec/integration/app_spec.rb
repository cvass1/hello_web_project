require 'spec_helper'
require 'rack/test'
require_relative '../../app'

describe Application do
  include Rack::Test::Methods

  let(:app) { Application.new }

  context "GET to /" do
    it "returns 200 OK and returns correct response" do
      response = get("/")

      expect(response.status).to eq(200)
      expect(response.body).to eq('Hello')

    end
  end

  context "GET /hello" do
    it "returns HTML response" do
      response = get('/hello')

      expect(response.body).to eq "<html>
    <head></head>
    <body>
      <h1>Hello!</h1>
    </body>
</html>"
    end

  end

  context "GET /names" do
    it 'returns 200 OK' do
      response = get('/names')
      expected_response = 'Julia, Mary, Karim'

      expect(response.status).to eq(200)
      expect(response.body).to eq(expected_response)
    end

  end

  context "POST /sort_names" do
    it 'returns a list of sorted names' do
      input = '?names=Joe,Alice,Zoe,Julia,Kieran'
      response = post('/sort_names'+input)
      expected_response = 'Alice,Joe,Julia,Kieran,Zoe'
      
      expect(response.status).to eq(200)
      expect(response.body).to eq(expected_response)
   
    end

    it 'returns a list of sorted names' do
      input = '?names=Alice,Zoe,Julia,Kieran'
      response = post('/sort_names'+input)
      expected_response = 'Alice,Julia,Kieran,Zoe'
      
      expect(response.status).to eq(200)
      expect(response.body).to eq(expected_response)
   
    end
  end


end