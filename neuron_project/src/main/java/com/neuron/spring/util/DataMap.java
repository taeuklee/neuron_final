package com.neuron.spring.util;

import org.apache.commons.collections4.map.ListOrderedMap;

/**
 * key 값을 camelCase 로 변경한 Map으로 변경한다.
 * ex) PASSWORD => password, MEMBER_ID => memberId, member_photo_file => memberPhotoFile
 *
 */
public class DataMap extends ListOrderedMap {

	private static final long serialVersionUID = 1L;

	@Override
	public Object put(Object key, Object value) {
		String tmp = (String) key;
		if (tmp.indexOf('_') < 0 && Character.isLowerCase(tmp.charAt(0))) {
			return super.put(tmp, value);
		}
		StringBuilder result = new StringBuilder();
		boolean nextUpper = false;
		int len = tmp.length();

		for (int i = 0; i < len; i++) {
			char currentChar = tmp.charAt(i);
			if (currentChar == '_') {
				nextUpper = true;
			} else {
				if (nextUpper) {
					result.append(Character.toUpperCase(currentChar));
					nextUpper = false;
				} else {
					result.append(Character.toLowerCase(currentChar));
				}
			}
		}
		return super.put(result.toString(), value);
	}

	public String getString(Object key){
		if(key != null){
			String result = "";
			if(super.get(key) != null){
				result = super.get(key).toString();
			}
			return result;
		}
		return "";
	}


	public int getInt(Object key){
		if(key != null){
			String result = "0";
			if(super.get(key) != null){
				result = super.get(key).toString();
			}
			return Integer.parseInt(result);
		}
		
		return 0;
	}

	public long getLong(Object key){
		if(key != null){
			return Long.parseLong(this.getString(key));
		}
		return 0;
	}
}

