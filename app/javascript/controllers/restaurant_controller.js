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
    const { restaurant, user, index_data } = data;
    const restaurantIndex = document.querySelector(`#restaurantIndex_user_${user.id}`);
    if (restaurantIndex && index_data) { restaurantIndex.outerHTML = index_data; }
  }

  disconnect() {
    this.channel.unsubscribe();
  }
}
