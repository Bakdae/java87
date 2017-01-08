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
	public String toJson(Style style) throws JsonProcessingException {
		
		System.out.println(" :: 디버깅 toJson 내부 시작 ");
		
		String jsonStr = "";
		
		String[] styleInfoArray1 = style.getInfomation1().split("`");
		String[] styleInfoArray2 = style.getInfomation2().split("`");
		String[] styleInfoArray3 = style.getInfomation3().split("`");
		String[] styleInfoArray4 = style.getInfomation4().split("`");
		String[] styleInfoArray5 = style.getInfomation5().split("`");
		
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> styleData = new HashMap<String, Object>();
		
		styleData.put("styleNo", style.getStyleNo());
		styleData.put("userNo", style.getUser_no());
		styleData.put("fileName", style.getFileName().trim());
		styleData.put("tnFileName", style.getTnFileName().trim());
		styleData.put("styleTitle", style.getStyleTitle());
		
		if (styleInfoArray1.length != 0) {
			styleData.put("styleInfo1", styleInfoArray1[0].trim());
			styleData.put("priceInfo1", styleInfoArray1[1].trim());
			styleData.put("position1x", styleInfoArray1[2].trim().split(",")[0]);
			styleData.put("position1y", styleInfoArray1[2].trim().split(",")[1]);
		}
		
		if (styleInfoArray2.length != 0) {
			styleData.put("styleInfo2", styleInfoArray2[0].trim());
			styleData.put("priceInfo2", styleInfoArray2[1].trim());
			styleData.put("position2x", styleInfoArray2[2].trim().split(",")[0]);
			styleData.put("position2y", styleInfoArray2[2].trim().split(",")[1]);
		}
		
		if (styleInfoArray3.length != 0) {
			styleData.put("styleInfo3", styleInfoArray3[0].trim());
			styleData.put("priceInfo3", styleInfoArray3[1].trim());
			styleData.put("position3x", styleInfoArray3[2].trim().split(",")[0]);
			styleData.put("position3y", styleInfoArray3[2].trim().split(",")[1]);
		}
		
		if (styleInfoArray4.length != 0) {
			styleData.put("styleInfo4", styleInfoArray4[0].trim());
			styleData.put("priceInfo4", styleInfoArray4[1].trim());
			styleData.put("position4x", styleInfoArray4[2].trim().split(",")[0]);
			styleData.put("position4y", styleInfoArray4[2].trim().split(",")[1]);
		}
		
		if (styleInfoArray5.length != 0) {
			styleData.put("styleInfo5", styleInfoArray5[0].trim());
			styleData.put("priceInfo5", styleInfoArray5[1].trim());
			styleData.put("position5x", styleInfoArray5[2].trim().split(",")[0]);
			styleData.put("position5y", styleInfoArray5[2].trim().split(",")[1]);
		}
		
		styleData.put("styleLike", style.getStyleLike());
		styleData.put("hashTagString", style.getHashTagString().trim());
		styleData.put("regDate", style.getRegDate());
		styleData.put("styleDesc", style.getStyleDesc().trim());
		
		System.out.println(" :: 디버깅 toJson 파싱직전 ");
		
		jsonStr = mapper.writeValueAsString(styleData);
		
		System.out.println(" :: 디버깅 toJson 파싱후 ");
		
		System.out.println(" Debug Raw Data " + jsonStr);
		
		return jsonStr;
	};
	
	public String getJsonArrayString(List list) {
		
		System.out.println(" 디버깅 getJsonArray Start");
		
		String retJsonStr = "[";
		
		for (int i = 0; i < list.size(); i++) {
			Style style = (Style) list.get(i);
			
			retJsonStr += "{";
			retJsonStr += "\"styleNo\": \"" + style.getStyleNo() + "\",";
			retJsonStr += "\"tnFileName\": \"" + style.getTnFileName() + "\",";
			retJsonStr += "\"imgProfile\": \"" + style.getUser_no().getPhot_path() + "\",";
			retJsonStr += "\"styleTitle\" : \"" + style.getStyleTitle() + "\",";
			retJsonStr += "\"hashTagString\" : \"" + style.getHashTagString() + "\"}";
			if (i < (list.size() - 1)) {
				retJsonStr += ",";
			}
		}
		retJsonStr += "]";
		
		return retJsonStr;
	}
	
	public JSONObject toJSONObject(List list) {
		
		JSONObject jsonObj = new JSONObject();
		try {
			JSONArray jArray = new JSONArray();
			
			for (int i = 0; i < list.size(); i++) {
				
				Style style = (Style) list.get(i);
				
				JSONObject sObject = new JSONObject(); // 배열 내에 들어갈 json
				sObject.put("styleNo", style.getStyleNo());
				sObject.put("tnFileName", style.getTnFileName());
				sObject.put("imgProfile", style.getUser_no().getPhot_path());
				sObject.put("styleTitle", style.getStyleTitle());
				sObject.put("hashTagString", style.getHashTagString());
				jArray.add(sObject);
			}
			jsonObj.put("jArray", jArray);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return jsonObj;
		
	}
	
	public JSONArray toJSONArray(List list) {
		
		JSONArray jArray = new JSONArray();
		
		try {
			
			for (int i = 0; i < list.size(); i++) {
				
				Style style = (Style) list.get(i);
				
				JSONObject sObject = new JSONObject(); // 배열 내에 들어갈 json
				sObject.put("styleNo", style.getStyleNo());
				sObject.put("user_no", style.getUser_no().getUser_no());
				sObject.put("tnFileName", style.getTnFileName());
				sObject.put("imgProfile", style.getUser_no().getPhot_path());
				sObject.put("styleTitle", style.getStyleTitle());
				sObject.put("hashTagString", style.getHashTagString());
				jArray.add(sObject);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		System.out.println(" 디버깅 toJSONArray(List list) >> " + jArray);
		
		return jArray;
		
	}
	
	// 스타일 제이슨으로 만들기
	public HashMap detailView (Style style){
		
		String[] style1=null;
		String[] position1=null;
		String[] style2=null;
		String[] position2=null;
		String[] style3=null;
		String[] position3=null;
		String[] style4=null;
		String[] position4=null;
		String[] style5=null;
		String[] position5=null;
		
		System.out.println("    @@ 디테일 뷰에서 디버깅 Style >> "+style);
		
		System.out.println("info1 : "+style.getInfomation1());
		System.out.println("info1 길이 :"+style.getInfomation1().length());
		System.out.println("info2 :"+style.getInfomation2());
		System.out.println("info2 길이 :"+style.getInfomation2().length());
		System.out.println("info3 : "+style.getInfomation3());
		System.out.println("info3 길이 : "+style.getInfomation3().length());
		System.out.println("info4 : "+style.getInfomation4());
		System.out.println("info4 길이 : "+style.getInfomation4().length());
		System.out.println("info5 : "+style.getInfomation5());
		System.out.println("info5 길이 : "+style.getInfomation5().length());
		
		
		if(style.getInfomation1().length() != 2){
			
			style1 = style.getInfomation1().split("`");
			System.out.println("javaToJson debugging style1 >> "+style1);
			position1 = style1[2].split(",");
			
		}
		if(style.getInfomation2().length() != 2){
		
			style2 = style.getInfomation2().split("`");
			System.out.println("javaToJson debugging style2>> "+style2);
			position2 = style2[2].split(",");
		
		}
		if(style.getInfomation3().length() != 2){
		
			style3 = style.getInfomation3().split("`");
			System.out.println("javaToJson debugging style3>> "+style3);
			position3 = style3[2].split(",");
		
		}
		if(style.getInfomation4().length() != 2){
		
			style4 = style.getInfomation4().split("`");
			System.out.println("javaToJson debugging style4>> "+style4);
			position4 = style4[2].split(",");
		
		}
		if(style.getInfomation5().length() != 2){
		
			style5 = style.getInfomation5().split("`");
			System.out.println("javaToJson debugging style5>> "+style5);
			position5 = style5[2].split(",");
			
		}
		
		HashMap<String, Object> styleData = new HashMap<String, Object>();
		
		if ( style1 != null) {
			styleData.put("styleInfo1", style1[0].trim());
			styleData.put("priceInfo1", style1[1].trim());
			styleData.put("position1x", position1[0]);
			styleData.put("position1y", position1[1]);
		}
		
		if ( style2 != null) {
			styleData.put("styleInfo2", style2[0].trim());
			styleData.put("priceInfo2", style2[1].trim());
			styleData.put("position2x", position2[0]);
			styleData.put("position2y", position2[1]);
		}
		
		if ( style3 != null) {
			styleData.put("styleInfo3", style3[0].trim());
			styleData.put("priceInfo3", style3[1].trim());
			styleData.put("position3x", position3[0]);
			styleData.put("position3y", position3[1]);
		}
		
		if ( style4 != null) {
			styleData.put("styleInfo4", style4[0].trim());
			styleData.put("priceInfo4", style4[1].trim());
			styleData.put("position4x", position4[0]);
			styleData.put("position4y", position4[1]);
		}
		
		if ( style5 != null) {
			styleData.put("styleInfo5", style5[0].trim());
			styleData.put("priceInfo5", style5[1].trim());
			styleData.put("position5x", position5[0]);
			styleData.put("position5y", position5[1]);
		}
		
		styleData.put("styleLike", style.getStyleLike());
		styleData.put("hashTagString", style.getHashTagString().trim());
		styleData.put("regDate", style.getRegDate());
		styleData.put("styleDesc", style.getStyleDesc().trim());
		styleData.put("styleNo", style.getStyleNo());
		styleData.put("user_no", style.getUser_no().getUser_no());
		styleData.put("fileName", style.getFileName());
		styleData.put("styleTitle", style.getStyleTitle());
	
	    
	    System.out.println(" 디버깅 toHashMap(Style style) >> "+styleData);
	    
	    return styleData;
	    
	  }
	
}
