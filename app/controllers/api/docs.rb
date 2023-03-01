class Api::Docs
  include Swagger::Blocks

  swagger_path '/example' do
    operation :get do
      key :description, 'Example endpoint'
      key :summary, 'Get example data'
      key :tags, ['Example']
      parameter do
        key :name, :id
        key :in, :query
        key :description, 'ID of the example'
        key :required, true
        key :type, :integer
      end
      response 200 do
        key :description, 'Success'
        schema do
          key :type, :object
          key :properties, {
            id: { type: :integer },
            name: { type: :string },
            description: { type: :string },
          }
        end
      end
    end
  end
end



# class Api::Docs
#   include Swagger::Blocks

#   swagger_path '/post' do
#     operation :get do
#       key :description, 'post endpoint'
#       key :summary, 'Get posts data'
#       key :tags, ['Example']
#       parameter do
#         key :name, :id
#         key :in, :query
#         key :description, 'ID of the post'
#         key :required, true
#         key :type, :integer
#       end
#       response 200 do
#         key :description, 'Success'
#         schema do
#           key :type, :object
#           key :properties, {
#             id: { type: :integer },
#             name: { type: :string },
#             description: { type: :string },
#           }
#         end
#       end
#     end
#   end
# end
