enum Endpoints {
  login,
  register,
  sendOtp,
  forgetPassword,
  verifyOtp,
  addRestaurant
 
}

const Map<Endpoints, String> endpointRawValues = {
  // AUTHENTICATION
  Endpoints.login: "/api/v1/auth/login",
  Endpoints.register: "/api/v1/auth/register",
  Endpoints.sendOtp: "/api/v1/auth/sendOtp",
  Endpoints.forgetPassword: "/api/v1/auth/forgetPassword",
  Endpoints.verifyOtp: "/api/v1/auth/verifyOtp",
  Endpoints.addRestaurant:"/api/v1/restaurant/register"
};