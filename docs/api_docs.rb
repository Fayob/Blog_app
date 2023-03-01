Swagger::Blocks.configure do |config|
  config.base_path = '/api/v1'
  config.swagger_root = File.join(Rails.root, 'public', 'docs')
  config.api_version = '1.0.0'
  config.title = 'Blog App API'
  config.description = 'Documentation for blog app API'
  
  swagger_schema :User do
    key :required, [:id, :name, :email, :photo, :bio]
    property :id do
      key :type, :integer
      key :format, :int64
    end
    property :name do
      key :type, :string
    end
    property :email do
      key :type, :string
    end
    property :photo do
      key :type, :string
    end
    property :bio do
      key :type, :text
    end
  end
  
  swagger_path '/users' do
    operation :get do
      key :summary, 'Get a list of users'
      key :description, 'Returns a list of users'
      key :operationId, 'listUsers'
      key :produces, [
        'application/json'
      ]
      response 200 do
        key :description, 'A list of users'
        schema do
          key :type, :array
          items do
            key :'$ref', :User
          end
        end
      end
      response :default do
        key :description, 'unexpected error'
        schema do
          key :'$ref', :ErrorModel
        end
      end
    end
  end
  
  swagger_path '/users/{id}' do
    parameter do
      key :name, :id
      key :in, :path
      key :description, 'ID of user to fetch'
      key :required, true
      key :type, :integer
      key :format, :int64
    end
    operation :get do
      key :summary, 'Find user by ID'
      key :description, 'Returns a single user'
      key :operationId, 'getUserById'
      key :produces, [
        'application/json'
      ]
      key :tags, [
        'users'
      ]
      response 200 do
        key :description, 'successful operation'
        schema do
          key :'$ref', :User
        end
      end
      response :default do
        key :description, 'unexpected error'
        schema do
          key :'$ref', :ErrorModel
        end
      end
    end
  end
end
