import { Controller } from "stimulus";
import { createConsumer } from "@rails/actioncable"

export default class extends Controller {
  static values = { id: Number };

  connect() {
    this.channel = createConsumer().subscriptions.create(
      { channel: "UserChannel", user_id: this.idValue },
      { received: (data) => this.renderPartial(data) }
    );
  }

  renderPartial(data) {
    const { restaurant, user, index_data, show_data } = data;
    const restaurantIndex = document.querySelector(`#restaurantIndex_user_${user.id}`);
    const restaurantShow = document.querySelector(`#show_restaurant_${restaurant.id}`);
    if (restaurantIndex && index_data) { restaurantIndex.outerHTML = index_data; }
    if (restaurantShow && show_data) { restaurantShow.outerHTML = show_data; }
  }

  disconnect() {
    this.channel.unsubscribe();
  }
}
