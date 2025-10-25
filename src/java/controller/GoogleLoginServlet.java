package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.logging.Logger;
import java.util.logging.Level;
import org.json.JSONObject;
import org.json.JSONException;

/**
 * Google Login Servlet - Xử lý đăng nhập qua Google OAuth
 * @author Hieu
 */
@WebServlet(name = "GoogleLoginServlet", urlPatterns = {"/google-login"})
public class GoogleLoginServlet extends HttpServlet {
    private static final Logger LOGGER = Logger.getLogger(GoogleLoginServlet.class.getName());
    private static final String GOOGLE_TOKEN_VERIFY_URL = "https://oauth2.googleapis.com/tokeninfo?id_token=";
    private static final String GOOGLE_ISSUER = "https://accounts.google.com";
    private static final int CONNECTION_TIMEOUT = 5000;
    private static final int READ_TIMEOUT = 5000;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String credential = request.getParameter("credential");

        if (credential == null || credential.trim().isEmpty()) {
            LOGGER.log(Level.WARNING, "Credential is null or empty");
            sendErrorResponse(response, "Missing credential", HttpServletResponse.SC_BAD_REQUEST);
            return;
        }

        try {
            String clientId = "241470665821-3vbsh1pbsp17rd1vb6dctv2qlh5c721g.apps.googleusercontent.com";

            JSONObject payload = verifyTokenWithGoogle(credential);
            if (payload == null) {
                sendErrorResponse(response, "Invalid token", HttpServletResponse.SC_UNAUTHORIZED);
                return;
            }

            if (!isTokenValid(payload, clientId)) {
                sendErrorResponse(response, "Token validation failed", HttpServletResponse.SC_UNAUTHORIZED);
                return;
            }

            // 🔹 Lấy thông tin người dùng từ payload
            String email = payload.getString("email");
            String name = payload.optString("name", "Người dùng");
            String picture = payload.optString("picture", "");
            String userId = payload.getString("sub");

            LOGGER.log(Level.INFO, "✅ Google Login success for user: {0}", email);

            // 🔹 Tạo session và set thông tin người dùng
            HttpSession session = request.getSession(true);

            // -- Nếu bạn có model.User, dùng đoạn này:
            model.User user = new model.User();
            user.setUserName(name);
            user.setEmail(email);
            user.setAvatarUrl(picture);
            session.setAttribute("user", user);

            // -- Nếu không có model.User, dùng đoạn đơn giản hơn:
            // session.setAttribute("userEmail", email);
            // session.setAttribute("userName", name);
            // session.setAttribute("userAvatar", picture);

            session.setMaxInactiveInterval(30 * 60); // 30 phút

            // 🔹 Cookie bảo mật
            response.addHeader("Set-Cookie",
                "JSESSIONID=" + session.getId() + "; Path=/; HttpOnly; Secure; SameSite=Strict");

            // 🔹 Chuyển hướng về trang chủ
            response.sendRedirect(request.getContextPath() + "/eduHome/eduHome.jsp");

        } catch (JSONException e) {
            LOGGER.log(Level.SEVERE, "JSON parsing error: " + e.getMessage());
            sendErrorResponse(response, "Invalid response format", HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error during Google login: " + e.getMessage(), e);
            sendErrorResponse(response, "An error occurred during login", HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }

    /**
     * <CHANGE> Verify token with Google API
     */
    private JSONObject verifyTokenWithGoogle(String credential) {
        HttpURLConnection conn = null;
        try {
            URL url = new URL(GOOGLE_TOKEN_VERIFY_URL + credential);
            conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");
            conn.setConnectTimeout(CONNECTION_TIMEOUT);
            conn.setReadTimeout(READ_TIMEOUT);

            // <CHANGE> Check response code
            int responseCode = conn.getResponseCode();
            if (responseCode != 200) {
                LOGGER.log(Level.WARNING, "Google API returned status: " + responseCode);
                return null;
            }

            // <CHANGE> Read and parse response
            BufferedReader reader = new BufferedReader(
                new InputStreamReader(conn.getInputStream())
            );
            StringBuilder response = new StringBuilder();
            String line;
            while ((line = reader.readLine()) != null) {
                response.append(line);
            }
            reader.close();

            return new JSONObject(response.toString());

        } catch (IOException e) {
            LOGGER.log(Level.SEVERE, "Error connecting to Google API: " + e.getMessage());
            return null;
        } catch (JSONException e) {
            LOGGER.log(Level.SEVERE, "Error parsing Google response: " + e.getMessage());
            return null;
        } finally {
            if (conn != null) {
                conn.disconnect();
            }
        }
    }

    /**
     * <CHANGE> Validate token audience, issuer, and expiration
     */
    private boolean isTokenValid(JSONObject payload, String clientId) {
        try {
            // Check audience (aud)
            if (!payload.has("aud")) {
                LOGGER.log(Level.WARNING, "Token missing 'aud' field");
                return false;
            }
            
            String aud = payload.getString("aud");
            if (!aud.equals(clientId)) {
                LOGGER.log(Level.WARNING, "Token audience mismatch. Expected: " + clientId + ", Got: " + aud);
                return false;
            }

            // <CHANGE> Check issuer (iss)
            if (!payload.has("iss")) {
                LOGGER.log(Level.WARNING, "Token missing 'iss' field");
                return false;
            }
            
            String iss = payload.getString("iss");
            if (!iss.equals(GOOGLE_ISSUER)) {
                LOGGER.log(Level.WARNING, "Token issuer mismatch. Expected: " + GOOGLE_ISSUER + ", Got: " + iss);
                return false;
            }

            // <CHANGE> Check expiration (exp)
            if (!payload.has("exp")) {
                LOGGER.log(Level.WARNING, "Token missing 'exp' field");
                return false;
            }
            
            long expTime = payload.getLong("exp");
            long currentTime = System.currentTimeMillis() / 1000;
            if (currentTime > expTime) {
                LOGGER.log(Level.WARNING, "Token has expired");
                return false;
            }

            // <CHANGE> Check email verified
            if (!payload.has("email_verified")) {
                LOGGER.log(Level.WARNING, "Token missing 'email_verified' field");
                return false;
            }
            
            boolean emailVerified = payload.getBoolean("email_verified");
            if (!emailVerified) {
                LOGGER.log(Level.WARNING, "User email is not verified");
                return false;
            }

            return true;
        } catch (JSONException e) {
            LOGGER.log(Level.SEVERE, "Error validating token: " + e.getMessage());
            return false;
        }
    }

    /**
     * <CHANGE> Send error response as JSON
     */
    private void sendErrorResponse(HttpServletResponse response, String message, int statusCode) 
            throws IOException {
        response.setStatus(statusCode);
        response.setContentType("application/json;charset=UTF-8");
        
        JSONObject errorJson = new JSONObject();
        errorJson.put("error", message);
        response.getWriter().write(errorJson.toString());
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // <CHANGE> GET requests not supported for this endpoint
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "GET method not supported");
    }

    @Override
    public String getServletInfo() {
        return "Google Login Servlet - Handles Google OAuth authentication";
    }
}