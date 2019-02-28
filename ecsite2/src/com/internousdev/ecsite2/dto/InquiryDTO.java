package com.internousdev.ecsite2.dto;

public class InquiryDTO
{
	public String name;
	public String qtype;
	public String body;

	public String getName(){
		return name;
	}

	public void setName(String name){
		this.name=name;
	}

	public String getQtype(){
		return qtype;
	}

	public void setQtype(String qtype){
		this.qtype=qtype;
	}

	public String getBody(){
		return body;
	}

	public void setBody(String body){
		this.body=body;
	}
}