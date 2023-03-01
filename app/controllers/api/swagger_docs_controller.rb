class Api::SwaggerDocsController < ActionController::Base
  include Swagger::Blocks

  swagger_root do
    key :swagger, '2.0'
    info do
      key :version, '1.0.0'
      key :title, 'Your API Title'
      key :description, 'Your API Description'
      contact do
        key :name, 'Your Name'
      end
    end
    key :basePath, '/api'
    key :consumes, ['application/json']
    key :produces, ['application/json']
  end

  def show
    render json: Swagger::Blocks.build_root_json([API::Docs])
  end
end



# class API::DocsController < ActionController::Base
#   include Swagger::Blocks

#   swagger_root do
#     key :swagger, '2.0'
#     info do
#       key :version, '1.0.0'
#       key :title, 'Blog App'
#       key :description, 'A blog application where you can post your article'
#       contact do
#         key :name, 'Fayob'
#       end
#     end
#     key :basePath, '/api'
#     key :consumes, ['application/json']
#     key :produces, ['application/json']
#   end

#   def index
#     render json: Swagger::Blocks.build_root_json([API::V1::Docs])
#   end
# end
