# ecommerce_app

Shoe Ecommerce App.

# approach and architecture

I've used Flutter Riverpod to handle the app's state, blending MVC and Repository patterns. I aimed for clear and readable code. For simple API calls, I kept things straightforward without creating separate states in providers. However, for managing the cart locally, I made a CartState class to keep track of the current cart status.

# Libraries

# state_management
- flutter_riverPod

# network
- dio

# responsive_size
- flutter_screen_util

# image_slider
- carousel_slider

# html parsing
- html

# network_image
- cached_network_image

