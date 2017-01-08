package bitcamp.java87.project01.common;

import java.util.Arrays;
import java.util.List;

public class HashTag {
  
  String[] hashTagArray;
  
  String hashTagString1;
  String hashTagString2;
  String hashTagString3;
  
  String compliteString;
  List<String> hashTagList;
  
  public HashTag() {
  }
  
  public String parsing(String desc){
    
    hashTagString1="";
    hashTagArray = desc.split(" ");
    
    for(String word : hashTagArray){
      int sharpNumber = word.indexOf("#");
      
      if(sharpNumber>0){
        hashTagString1 += word.substring(word.indexOf("#"));
      }else if(sharpNumber==0){
        hashTagString1 += word;
      }
    }
    
    System.out.println("hashTagString1 => "+hashTagString1);
    
    hashTagString2="";
    hashTagArray = null;
    hashTagArray = hashTagString1.split(",");
    
    for(String word : hashTagArray){
      int sharpNumber = word.indexOf("#");
      
      if(sharpNumber>0){
        hashTagString2 += word.substring(word.indexOf("#"));
      }else if(sharpNumber==0){
        hashTagString2 += word;
      }
    }
    
    System.out.println("hashTagString2 => "+hashTagString2);
    
    hashTagString3 = "";
    hashTagArray = null;
    hashTagArray = hashTagString2.split("\\.");
    
    for(String word : hashTagArray){
      int sharpNumber = word.indexOf("#");
      
      if(sharpNumber>0){
        hashTagString3 += word.substring(word.indexOf("#"));
      }else if(sharpNumber==0){
        hashTagString3 += word;
      }
    }
    
    System.out.println("hashTagString3 => "+hashTagString3);
    
/*
    hashTagArray=null;
    hashTagArray = hashTagString3.split("#");
    hashTagList = Arrays.asList(hashTagArray);
    for( String e : hashTagList ){System.out.println("List에 들어있는 값 : "+e);}
*/
    
    return hashTagString3; 
  }
}
