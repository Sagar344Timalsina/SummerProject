/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cryptography;

/**
 *
 * @author Sagar Timalsina
 */
public class Cryptography {

    static String etext="";
    static String ctext="";
   static String dtext="";
    int key = 6;

    public String encryption(String name) {
        etext = name;
        char[] chars = etext.toCharArray();
        for (char c : chars) {
            c += key;
            ctext += c;
        }
        return ctext;
    }

    public String decryption(String name) {
        dtext = name;
        char[] chars = dtext.toCharArray();
        for (char c : chars) {
            c -= key;
            etext+=c;
        }
       return etext; 
    }

}
