class Restaurant < ApplicationRecord
  belongs_to :user
  after_commit :broadcast_data

  private

  def broadcast_data
    index_data = RestaurantsController.renderer.render(partial: 'restaurants/index', locals: { restaurants: user.restaurants })
    restaurant_data = { restaurant: self, user: user, index_data: index_data }
    ActionCable.server.broadcast("user/#{user.id}", restaurant_data)
  end
end
