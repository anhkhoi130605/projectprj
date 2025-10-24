package utils;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class hashPassWord {

    // Hàm băm SHA-256
    public static String hash(String input) {
        try {
            MessageDigest digest = MessageDigest.getInstance("SHA-256");
            byte[] encodedHash = digest.digest(input.getBytes(StandardCharsets.UTF_8));

            // Chuyển thành chuỗi hex
            StringBuilder hexString = new StringBuilder();
            for (byte b : encodedHash) {
                String hex = Integer.toHexString(0xff & b);
                if (hex.length() == 1) hexString.append('0');
                hexString.append(hex);
            }
            return hexString.toString();

        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException("Lỗi khi hash password: " + e.getMessage(), e);
        }
    }

    // Dùng khi set mật khẩu (hash trước khi lưu DB)
    public static String setPassword(String plainTextPassword) {
        return hashPassword(plainTextPassword);
    }

    // Wrapper cho hash
    private static String hashPassword(String plainTextPassword) {
        return hash(plainTextPassword);
    }

    // So sánh mật khẩu người nhập với mật khẩu hash trong DB
    public static boolean isMatchPasswords(String plainTextPassword, String hashedPassword) {
        if (plainTextPassword == null || plainTextPassword.isEmpty()) {
            return false;
        }
        return hashedPassword.equals(hashPassword(plainTextPassword));
    }
}
