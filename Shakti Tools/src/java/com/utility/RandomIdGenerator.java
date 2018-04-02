package com.utility;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.util.Random;


public class RandomIdGenerator {
    
    
    public static String randomProIdGenerator(){
       
        char[] chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789".toCharArray();
Random rnd = new Random();
StringBuilder sb = new StringBuilder((10000000 + rnd.nextInt(90000000)) + "-");
for (int i = 0; i < 5; i++)
    sb.append(chars[rnd.nextInt(chars.length)]);

return sb.toString();
    }
    
}
