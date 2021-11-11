package com.neuron.spring.approval.domain;

public class CodeInfo {
	private String groupCodeId;
	private String codeId;
	private String codeName;
	private String codeContents;
	
	public CodeInfo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getGroupCodeId() {
		return groupCodeId;
	}
	public void setGroupCodeId(String groupCodeId) {
		this.groupCodeId = groupCodeId;
	}
	public String getCodeId() {
		return codeId;
	}
	public void setCodeId(String codeId) {
		this.codeId = codeId;
	}
	public String getCodeName() {
		return codeName;
	}
	public void setCodeName(String codeName) {
		this.codeName = codeName;
	}
	public String getCodeContents() {
		return codeContents;
	}
	public void setCodeContents(String codeContents) {
		this.codeContents = codeContents;
	}
	@Override
	public String toString() {
		return "CodeInfo [groupCodeId=" + groupCodeId + ", codeId=" + codeId + ", codeName=" + codeName
				+ ", codeContents=" + codeContents + "]";
	}

}
