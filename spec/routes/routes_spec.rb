describe 'GET /api/users/:user_id/posts' do
  let(:expected_response) do
    [
      { id: 1, name: 'John' },
      { id: 2, name: 'Jane' }
    ]
  end
  before do
    get '/api/users/1/posts'
  end
  it 'returns all posts' do
    expect(response).to have_http_status(:ok)
    expect(JSON.parse(response.body)).to eq(expected_response)
  end
  swagger_api 'List all posts' do
    response :ok do
      key :description, 'OK'
      schema do
        key :type, :array
        items do
          key :type, :object
          property :id do
            key :type, :integer
          end
          property :name do
            key :type, :string
          end
        end
      end
    end
  end
end
