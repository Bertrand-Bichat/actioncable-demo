class Restaurant < ApplicationRecord
  belongs_to :user
  after_commit :broadcast_data

  private

  def broadcast_data
    index_data = RestaurantsController.renderer.render(partial: 'restaurants/index', locals: { restaurants: user.restaurants, user: user })
    show_data = RestaurantsController.renderer.render(partial: 'restaurants/show', locals: { restaurant: self })
    restaurant_data = { restaurant: self, user: user, index_data: index_data, show_data: show_data }
    ActionCable.server.broadcast("user_#{user.id}", restaurant_data)
  end
end
