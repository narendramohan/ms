package com.ms.util;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.util.Arrays;
import java.util.Base64;

public class EncryptionUtil {
	
	/**
	    * From a password, a number of iterations and a salt,
	    * returns the corresponding digest
	    * @param iterationNb int The number of iterations of the algorithm
	    * @param password String The password to encrypt
	    * @param salt byte[] The salt
	    * @return byte[] The digested password
	    * @throws NoSuchAlgorithmException If the algorithm doesn't exist
	    * @throws UnsupportedEncodingException 
	    */
	   public static byte[] getHash(String password, byte[] salt) throws NoSuchAlgorithmException, UnsupportedEncodingException {
	      
	       return getHash(0,  password, salt);
	   }
	   
	/**
	    * From a password, a number of iterations and a salt,
	    * returns the corresponding digest
	    * @param iterationNb int The number of iterations of the algorithm
	    * @param password String The password to encrypt
	    * @param salt byte[] The salt
	    * @return byte[] The digested password
	    * @throws NoSuchAlgorithmException If the algorithm doesn't exist
	    * @throws UnsupportedEncodingException 
	    */
	   public static byte[] getHash(int iterationNb, String password, byte[] salt) throws NoSuchAlgorithmException, UnsupportedEncodingException {
	       MessageDigest digest = MessageDigest.getInstance("SHA-256");
	       digest.reset();
	       digest.update(salt);
	       byte[] input = digest.digest(password.getBytes("UTF-8"));
	       for (int i = 0; i < iterationNb; i++) {
	           digest.reset();
	           input = digest.digest(input);
	       }
	       return input;
	   }
	   
	   /**
	    * From a base 64 representation, returns the corresponding byte[] 
	    * @param data String The base64 representation
	    * @return byte[]
	    * @throws IOException
	    */
	   public static byte[] base64ToByte(String data) throws IOException {
	       //BASE64Decoder decoder = new BASE64Decoder();
	       //return decoder.decodeBuffer(data);
		   return Base64.getDecoder().decode(data);
	   }
	 
	   /**
	    * From a byte[] returns a base 64 representation
	    * @param data byte[]
	    * @return String
	    * @throws IOException
	    */
	   public static String byteToBase64(byte[] data){
	      // BASE64Encoder endecoder = new BASE64Encoder();
	      // return endecoder.encode(data);
		   return Base64.getEncoder().encodeToString(data);
	   }
	   
	   
	   public static void main(String args[]) {
		   
		  
		try {
			
	           
	           byte proposedDigest[];
	          // proposedDigest = getHash(0, "admin", bSalt);
				 SecureRandom random = SecureRandom.getInstance("SHA1PRNG");
		           // Salt generation 64 bits long
		           byte[] bSalt = new byte[8];
		           random.nextBytes(bSalt);
		       proposedDigest = getHash(0, "admin", bSalt);
	           byte bDigest[] = getHash(0, "admin", bSalt);
	           String sproposedDigest = byteToBase64(proposedDigest);
	           String sDigest = byteToBase64(bDigest);
               String sSalt = byteToBase64(bSalt);
	           System.out.println(sproposedDigest);
	           System.out.println(sDigest);
	           System.out.println(sSalt);
			   System.out.println(Arrays.equals(proposedDigest, bDigest));
		} catch (NoSuchAlgorithmException | UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
          
	   }
}
