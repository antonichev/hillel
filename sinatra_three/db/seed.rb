class Seed
  def self.seed
    create_products
  end

  def self.seed_users
    create_users
  end

  private

  PRODUCTS = [
    { id: 1, title: 'First Product', description: 'description of first product', price: 10 },
    { id: 2, title: 'Second Product', description: 'description of second product', price: 20 }
  ]

  USERS = [
    { id: 1, login: 'admin', password: '******' }
  ]

  def self.create_products
    Models::Product.create(PRODUCTS)
  end

  def self.create_users
    Models::User.create(USERS)
  end
end
