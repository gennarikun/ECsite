package com.internousdev.ecsite2.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.internousdev.ecsite2.dao.CartInfoDAO;
import com.internousdev.ecsite2.dto.CartInfoDTO;
import com.opensymphony.xwork2.ActionSupport;

public class AddCartAction extends ActionSupport implements SessionAware
{

	private int productId;
	private int itemPrice;
	private int productCount;
	private String pay;

	private Map<String,Object> session;

	public String execute()
	{

		String userId=String.valueOf(session.get("login_user_id"));
		System.out.println(userId);
		CartInfoDAO cartInfoDAO = new CartInfoDAO();

		// 1. カートに商品を新規追加or情報を更新する
				int count = 0;
				if(cartInfoDAO.isExistsCartInfo(userId, productId)){
					 count = cartInfoDAO.update(userId, productId, productCount);
				}else{
					 count = cartInfoDAO.regist(userId,productId, productCount, itemPrice);
				}

				if(count > 0) {
					//	カート情報取得
 					List<CartInfoDTO> cartInfoDtoList=new ArrayList<CartInfoDTO>();
					cartInfoDtoList = cartInfoDAO.getCartInfoDtoList(userId);
					if(cartInfoDtoList.isEmpty())
					{
						cartInfoDtoList=null;
					}
					session.put("cartInfoDtoList",cartInfoDtoList);

					//	合計金額を取得
					int totalPrice = Integer.parseInt(String.valueOf(cartInfoDAO.getTotalPrice(userId)));
					session.put("totalPrice", totalPrice);
					return SUCCESS;
				}

				return ERROR;

	}
	public int getProductId(){
		return productId;
	}
	public void setProductId(int productId){
		this.productId=productId;
	}
	public int getItemPrice(){
		return itemPrice;
	}
	public void setItemPrice(int itemPrice){
		this.itemPrice=itemPrice;
	}
	public int getProductCount(){
		return productCount;
	}
	public void setProductCount(int productCount){
		this.productCount=productCount;
	}
	public String getPay() {
		return pay;
	}
	public void setPay(String pay) {
		this.pay = pay;
	}
	public Map<String,Object> getSession(){
		return session;
	}
	public void setSession(Map<String,Object> session){
		this.session=session;
	}
}
