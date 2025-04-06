enum Endpoints {
  login,
  register,
  sendOtp,
  forgetPassword,
  verifyOtp,
 
}

const Map<Endpoints, String> endpointRawValues = {
  // AUTHENTICATION
  Endpoints.login: "/api/v1/login",
  Endpoints.register: "/api/v1/register",
  Endpoints.sendOtp: "/api/v1/sendOtp",
  Endpoints.forgetPassword: "/api/v1/forgetPassword",
  Endpoints.verifyOtp: "/api/v1/verifyOtp",
};