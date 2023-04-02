package helper;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.util.Base64;

public class Encryption {

  private static final int SALT_LENGTH = 16;

  public static String encrypt(String password) {
    try {
      SecureRandom random = new SecureRandom();
      byte[] salt = new byte[SALT_LENGTH];
      random.nextBytes(salt);
      MessageDigest md = MessageDigest.getInstance("SHA-256");
      md.update(salt);
      md.update(password.getBytes());
      byte[] digest = md.digest();
      byte[] saltAndDigest = new byte[SALT_LENGTH + digest.length];
      System.arraycopy(salt, 0, saltAndDigest, 0, SALT_LENGTH);
      System.arraycopy(digest, 0, saltAndDigest, SALT_LENGTH, digest.length);
      return Base64.getEncoder().encodeToString(saltAndDigest);
    } catch (NoSuchAlgorithmException e) {
      throw new RuntimeException("Error encrypting password: " + e.getMessage());
    }
  }

  public static boolean matches(String password, String encryptedPassword) {
    try {
      byte[] saltAndDigest = Base64.getDecoder().decode(encryptedPassword);
      byte[] salt = new byte[SALT_LENGTH];
      byte[] digest = new byte[saltAndDigest.length - SALT_LENGTH];
      System.arraycopy(saltAndDigest, 0, salt, 0, SALT_LENGTH);
      System.arraycopy(saltAndDigest, SALT_LENGTH, digest, 0, digest.length);
      MessageDigest md = MessageDigest.getInstance("SHA-256");
      md.update(salt);
      md.update(password.getBytes());
      byte[] computedDigest = md.digest();
      return MessageDigest.isEqual(digest, computedDigest);
    } catch (NoSuchAlgorithmException e) {
      throw new RuntimeException("Error checking password: " + e.getMessage());
    }
  }
}
