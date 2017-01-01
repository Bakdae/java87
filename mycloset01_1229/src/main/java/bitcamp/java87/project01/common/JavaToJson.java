package bitcamp.java87.project01.common;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.JsonIOException;

import bitcamp.java87.project01.domain.Style;

public class JavaToJson {
  
  @SuppressWarnings("null")
  public String toJson(Style style) throws JsonProcessingException{
    
    System.out.println(" :: 디버깅 toJson 내부 시작 ");
    
    String jsonStr="";
    
    String[] styleInfoArray1 = style.getInfomation1().split("`");
    String[] styleInfoArray2 = style.getInfomation2().split("`");
    String[] styleInfoArray3 = style.getInfomation3().split("`");
    String[] styleInfoArray4 = style.getInfomation4().split("`");
    String[] styleInfoArray5 = style.getInfomation5().split("`");
    
    ObjectMapper mapper = new ObjectMapper();
    
    Map<String,Object> styleData = new HashMap<String,Object>();
    
    styleData.put("styleNo", style.getStyleNo());
    styleData.put("userNo", style.getUser_no());
    styleData.put("fileName", style.getFileName().trim());
    styleData.put("tnFileName", style.getTnFileName().trim());
    styleData.put("styleTitle", style.getStyleTitle());
    
    if(styleInfoArray1.length != 0){
      styleData.put("styleInfo1", styleInfoArray1[0].trim());
      styleData.put("priceInfo1", styleInfoArray1[1].trim());
      styleData.put("priceInfo1", styleInfoArray1[2].trim());
    }
    
    if(styleInfoArray2.length != 0){
      styleData.put("styleInfo2", styleInfoArray2[0].trim());
      styleData.put("priceInfo2", styleInfoArray2[1].trim());
      styleData.put("priceInfo2", styleInfoArray2[2].trim());
    }
    
    if(styleInfoArray3.length != 0){
      styleData.put("styleInfo3", styleInfoArray3[0].trim());
      styleData.put("priceInfo3", styleInfoArray3[1].trim());
      styleData.put("priceInfo3", styleInfoArray3[2].trim());
    }
    
    if(styleInfoArray4.length != 0){
      styleData.put("styleInfo4", styleInfoArray4[0].trim());
      styleData.put("priceInfo4", styleInfoArray4[1].trim());
      styleData.put("priceInfo4", styleInfoArray4[2].trim());
    }
    
    if(styleInfoArray5.length != 0){
      styleData.put("styleInfo5", styleInfoArray5[0].trim());
      styleData.put("priceInfo5", styleInfoArray5[1].trim());
      styleData.put("priceInfo5", styleInfoArray5[2].trim());
    }
    
    styleData.put("styleLike", style.getStyleLike());
    styleData.put("hashTagString", style.getHashTagString().trim());
    styleData.put("regDate", style.getRegDate());
    styleData.put("styleDesc", style.getStyleDesc().trim());
    
    
    System.out.println(" :: 디버깅 toJson 파싱직전 ");
    
    jsonStr = mapper.writeValueAsString(styleData);
    
    System.out.println(" :: 디버깅 toJson 파싱후 ");
    
    System.out.println(" Debug Raw Data "+jsonStr);
    
    return jsonStr;
  };
  
  public String getJsonArrayString (List list){
    
    System.out.println(" 디버깅 getJsonArray Start");
       
    String retJsonStr ="[";
    
    for (int i = 0; i < list.size(); i++) {
      Style style =(Style)list.get(i);
      
      retJsonStr += "{";
      retJsonStr += "\"styleNo\": \"" + style.getStyleNo() +"\",";
      retJsonStr += "\"tnFileName\": \"" + style.getTnFileName() +"\",";
      retJsonStr += "\"imgProfile\": \"" + style.getUser_no().getPhot_path() + "\",";
      retJsonStr += "\"styleTitle\" : \"" + style.getStyleTitle() +"\",";
      retJsonStr += "\"hashTagString\" : \"" + style.getHashTagString() +"\"}";
      if ( i < (list.size()-1) ) {
        retJsonStr += ",";
      }
    }
    retJsonStr += "]";
    
    return retJsonStr;
  }
  
  public JSONObject toJSONObject (List list){
    
    JSONObject jsonObj = new JSONObject();
    try{
      JSONArray jArray = new JSONArray();
      
      for (int i = 0; i < list.size(); i++) {
        
        Style style =(Style)list.get(i);
        
        JSONObject sObject = new JSONObject(); // 배열 내에 들어갈 json
        sObject.put("styleNo", style.getStyleNo() );
        sObject.put("tnFileName", style.getTnFileName() );
        sObject.put("imgProfile", style.getUser_no().getPhot_path() );
        sObject.put("styleTitle", style.getStyleTitle() );
        sObject.put("hashTagString", style.getHashTagString() );
        jArray.add(sObject);
      }
      jsonObj.put("jArray",jArray);
    }catch (Exception e){
      e.printStackTrace();
    }
    
    return jsonObj;
    
  }
  
  public JSONArray toJSONArray (List list){
    
    JSONArray jArray = new JSONArray();

    try{
      
      for (int i = 0; i < list.size(); i++) {
        
        Style style =(Style)list.get(i);
        
        JSONObject sObject = new JSONObject(); // 배열 내에 들어갈 json
        sObject.put("styleNo", style.getStyleNo() );
        sObject.put("tnFileName", style.getTnFileName() );
        sObject.put("imgProfile", style.getUser_no().getPhot_path() );
        sObject.put("styleTitle", style.getStyleTitle() );
        sObject.put("hashTagString", style.getHashTagString() );
        jArray.add(sObject);
      }
    }catch (Exception e){
      e.printStackTrace();
    }
    
    System.out.println(" 디버깅 toJSONArray(List list) >> "+jArray);
    
    return jArray;
    
  }
  
}
