package com.neuron.spring.approval.domain;

public class DocumentFile {
	public int fileNo;
	public int fileOrder;
	public int documentNo;
	public String fileName;
	public String fileRename;
	public long fileSize;
	public String filePath;
	public String fileKind;
	
	
	public DocumentFile() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getFileNo() {
		return fileNo;
	}
	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}
	public int getFileOrder() {
		return fileOrder;
	}
	public void setFileOrder(int fileOrder) {
		this.fileOrder = fileOrder;
	}
	public int getDocumentNo() {
		return documentNo;
	}
	public void setDocumentNo(int documentNo) {
		this.documentNo = documentNo;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getFileRename() {
		return fileRename;
	}
	public void setFileRename(String fileRename) {
		this.fileRename = fileRename;
	}
	
	public long getFileSize() {
		return fileSize;
	}
	public void setFileSize(long fileSize) {
		this.fileSize = fileSize;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	public String getFileKind() {
		return fileKind;
	}
	public void setFileKind(String fileKind) {
		this.fileKind = fileKind;
	}
	
	@Override
	public String toString() {
		return "DocumentFile [fileNo=" + fileNo + ", fileOrder=" + fileOrder + ", documentNo=" + documentNo
				+ ", fileName=" + fileName + ", fileRename=" + fileRename + ", fileSize=" + fileSize + ", filePath="
				+ filePath + ", fileKind=" + fileKind + "]";
	}
	
}
