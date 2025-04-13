enum Endpoints {
  login,
  register,
  sendOtp,
  forgetPassword,
  verifyOtp,
  addRestaurant,
  getAllRestaurant,
  getRestaurantById,
  updateRestaurant,
  updateRestaurantOpentStatus,
  addDish,
  updateDish,
  deleteDish,
  updateDishStatus,
  getAllDishByRestaurant,
  getDishById,
 
}

const Map<Endpoints, String> endpointRawValues = {
  // AUTHENTICATION
  Endpoints.login: "/api/v1/auth/login",
  Endpoints.register: "/api/v1/auth/register",
  Endpoints.sendOtp: "/api/v1/auth/sendOtp",
  Endpoints.forgetPassword: "/api/v1/auth/forgetPassword",
  Endpoints.verifyOtp: "/api/v1/auth/verifyOtp",
  Endpoints.addRestaurant:"/api/v1/restaurant/register",
  Endpoints.getAllRestaurant:"/api/v1/restaurant",
  Endpoints.getRestaurantById:"/api/v1/restaurant",
  Endpoints.updateRestaurantOpentStatus:"/api/v1/restaurant/update",
  Endpoints.addDish:"/api/v1/dish/add/restaurant",
  Endpoints.getAllDishByRestaurant:"/api/v1/dish/restaurant",
  Endpoints.getDishById:"/api/v1/dish",
  Endpoints.deleteDish:"/api/v1/dish/delete",

};