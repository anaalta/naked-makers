RSpec.describe "Data Request Response", type: :request do

  it "recieves json when making a data request" do

    get '/api/responses', params: { headers: { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' } }

    expect(response.body).to eq response_json

  end
end
