class SwaggerController < ApplicationController
  include Swagger::Blocks

  def index
    render json: Swagger::Blocks.build_root_json([ApiDocs])
  end
end
