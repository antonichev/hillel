require_relative 'base'

module Controllers
  class Main < Controllers::Base

    get '/' do
      products = Models::Product.all
      slim :index, locals: { products: products }
    end

    get '/products/:id' do
      id = params['id'].to_i

      product = Models::Product.find(id)
      
      slim 'products/product'.to_sym, locals: { product: product } 
    end

    error ActiveRecord::RecordNotFound do
      slim :p404
    end
  end
end
