package com.neuron.spring.util;

import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

/**
 * String controller 사용, pageIndex(defalut=1), itemCountePerPage(default=10) 설정
 * 로그인 사용자인경우 registId,updateId 자동으로 추가함
 * @see com.tws.web.TwsMapArgumentResolver
 *
 */
public class RequestResolver {

	DataMap map = new DataMap();

    public Object get(String key){
    	if(this.containsKey(key)){
    		return map.get(key);
    	}else{
    		return null;
    	}

    }

    public void put(String key, Object value){
        map.put(key, value);
    }

    public Object remove(String key){
        return map.remove(key);
    }

    public boolean containsKey(String key){
        return map.containsKey(key);
    }

    public boolean containsValue(Object value){
        return map.containsValue(value);
    }

    public void clear(){
        map.clear();
    }

    public Set<Entry<String, Object>> entrySet(){
        return map.entrySet();
    }

    public Set<String> keySet(){
        return map.keySet();
    }

    public boolean isEmpty(){
        return map.isEmpty();
    }

    public void putAll(Map<? extends String, ?extends Object> m){
        map.putAll(m);
    }

    public DataMap getMap(){
    	if(map == null){
    		map = new DataMap(); 
    	}
        return map;
    }
    public String getString(Object key){
    	if(key != null){
    		String result = "";
    		if(map.get(key) != null) {
    			return map.get(key).toString();    			
    		}
    		return result;
    	}
		return "";
	}

	public int getInt(Object key){
		if(key!=null){
			String result = this.getString(key);
			return Integer.parseInt(result);
		}
		return 0;
	}

	public int getInt(Object key, int defaultValue){
		if(key  != null){
			String result = this.getString(key);
			if(result.equals(""))
				result = "0";
			return Integer.parseInt(result);
		}
		return 0;
	}

	public long getLong(Object key){
		if(key != null){
			String result = this.getString(key);
			if(result.equals(""))
				result = "0";
			return Long.parseLong(result);
		}
		return 0;
	}

	public long getLong(Object key, long defaultValue){
		if(key != null){
			String result = this.getString(key);
			if(result.equals(""))
				result = "0";
			return Long.parseLong(result);
		}
		return 0;
	}

	public void putTotalCount(List<DataMap> list, String attributeName){
		long totalCount = 0l;
		if(list != null && list.size() > 0 ){
			totalCount = ((DataMap)list.get(0)).getLong("totalCount");
		}
		this.map.put(attributeName, totalCount);
	}

	public void putTotalCount(List<DataMap> list){
		this.putTotalCount(list, "totalCount");
	}


	public void putPageCount(List<DataMap> list, int itemCountPerPage){
		long totalCount = 0l;
		if(list != null && list.size() > 0 ){
			totalCount = ((DataMap)list.get(0)).getLong("totalCount");
		}
		int pageCount = (int) (Math.ceil((double) totalCount / (double) itemCountPerPage));
		this.map.put("pageCount", pageCount);
	}
	
	/**
	 * 데이터개수, 페이지 수 맵에 저장
	 * @param list	 
	 */
	public void setPaginationInfo(List<DataMap> list){
		this.putTotalCount(list);
		this.putPageCount(list, this.getInt("itemCntPerPage"));
	}
	
	public void setPaginationInfo2(List list){
		this.putTotalCount(list);
		this.putPageCount(list, this.getInt("itemCntPerPage"));
	}

}
