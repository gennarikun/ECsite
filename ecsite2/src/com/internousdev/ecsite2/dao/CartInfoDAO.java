package com.internousdev.ecsite2.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.internousdev.ecsite2.dto.CartInfoDTO;
import com.internousdev.ecsite2.util.DBConnector;

public class CartInfoDAO{

	public List<CartInfoDTO> getCartInfoDtoList(String loginId)
	{
		DBConnector dbConnector = new DBConnector();
		Connection connection = dbConnector.getConnection();
		List<CartInfoDTO> cartInfoDtoList = new ArrayList<CartInfoDTO>();

		String sql="select"
				+ " ci.id as id,"
				+ " ci.user_id as user_id,"
				+ " ci.product_id as product_id,"
				+ " ci.product_count as product_count,"
				+ " ci.item_price as item_price,"
				+ " ci.regist_date AS regist_date,"
				+ " ci.update_date AS update_date"
				+ " FROM cart_info as ci"
				+ " LEFT JOIN item_info_transaction as iit"
				+ " ON ci.product_id = iit.id"
				+ " WHERE ci.user_id = ?"
				+ " order by update_date desc, regist_date desc";
		try
		{
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			System.out.println("cartinfodao-getcartinfodtolist:"+loginId);
			preparedStatement.setString(1, loginId);
			ResultSet resultSet = preparedStatement.executeQuery();
			while(resultSet.next())
			{
				CartInfoDTO cartInfoDTO = new CartInfoDTO();
				cartInfoDTO.setId(resultSet.getInt("id"));
				cartInfoDTO.setUserId(resultSet.getString("user_id"));
				cartInfoDTO.setProductId(resultSet.getInt("product_id"));
				cartInfoDTO.setProductCount(resultSet.getInt("product_count"));
				cartInfoDTO.setItemPrice(resultSet.getInt("item_price"));
				cartInfoDtoList.add(cartInfoDTO);
			}
		}
		catch (SQLException e)
		{
			e.printStackTrace();
		}
			try
			{
				connection.close();
			}
			catch (SQLException e)
			{
				e.printStackTrace();
			}
		return cartInfoDtoList;
	}

	public int getTotalPrice(String userId)
	{
		int totalPrice = 0;
		DBConnector dbConnector = new DBConnector();
		Connection connection = dbConnector.getConnection();
		String sql = "select sum(product_count * item_price) as total_price from cart_info where user_id=? group by user_id";
		try
		{
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, userId);
			ResultSet resultSet = preparedStatement.executeQuery();
			if(resultSet.next()) {
				totalPrice = resultSet.getInt("total_price");
			}
		}
		catch (SQLException e)
		{
			e.printStackTrace();
		}
		try
		{
			connection.close();
		} catch (SQLException e)
		{
			e.printStackTrace();
		}
		return totalPrice;
	}

	public int regist(String userId, int productId, int productCount,int itemPrice)
	{
		DBConnector dbConnector = new DBConnector();
		Connection connection = dbConnector.getConnection();
		int count = 0;
		String sql = "insert into cart_info(user_id, product_id, product_count,item_price,regist_date,update_date)"
				+ " values (?, ?, ?, ?,now(),now())";

		try
		{
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, userId);
			preparedStatement.setInt(2, productId);
			preparedStatement.setInt(3, productCount);
			preparedStatement.setInt(4, itemPrice);

			count = preparedStatement.executeUpdate();
		}
		catch (SQLException e)
		{
			e.printStackTrace();
		}
		try
		{
			connection.close();
		}
		catch (SQLException e)
		{
			e.printStackTrace();
		}
		return count;
	}

	public int update(String userId, int productId, int productCount)
	{
		// カートにすでに存在する商品の購入個数情報を更新する(数を加える)
		DBConnector db = new DBConnector();
		Connection con = db.getConnection();
		String sql = "UPDATE cart_info SET product_count=(product_count + ?), update_date = now() WHERE user_id=? AND product_id=?";

		int result = 0;

		try
		{
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1,productCount);
			ps.setString(2,userId);
			ps.setInt(3,productId);
			result = ps.executeUpdate();

		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		try
		{
			con.close();
		}catch(SQLException e)
		{
			e.printStackTrace();
		}


		return result;
	}

	public int delete(String productId, String userId)
	{
		DBConnector dbConnector = new DBConnector();
		Connection connection = dbConnector.getConnection();
		int count = 0;
		String sql = "delete from cart_info where product_id=? and user_id=?";

		try
		{
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, productId);
			preparedStatement.setString(2, userId);

			count = preparedStatement.executeUpdate();
		}
		catch (SQLException e)
		{
			e.printStackTrace();
		}
		try
		{
			connection.close();
		}
		catch (SQLException e)
		{
			e.printStackTrace();
		}
		return count;
	}

	public int deleteAll(String userId)
	{
		DBConnector dbConnector = new DBConnector();
		Connection connection = dbConnector.getConnection();
		int count = 0;
		String sql = "delete from cart_info where user_id=?";

		try
		{
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, userId);

			count = preparedStatement.executeUpdate();
		}
		catch (SQLException e)
		{
			e.printStackTrace();
		}
		try
		{
			connection.close();
		}
		catch (SQLException e)
		{
			e.printStackTrace();
		}
		return count;
	}

	public boolean isExistsCartInfo (String loginId, int productId)
	{
		// 引数として受け取ったloginIdのユーザーが、productIdの商品を購入した履歴が存在するかどうかを判別する
		DBConnector db = new DBConnector();
		Connection con = db.getConnection();
		String sql = "SELECT COUNT(id) AS COUNT FROM cart_info WHERE user_id = ? and product_id=?";

		boolean result = false;

		try
		{
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, loginId);
			ps.setInt(2, productId);
			ResultSet rs = ps.executeQuery();

			if(rs.next())
			{
				if(rs.getInt("COUNT") > 0)
				{
					result = true;
				}
			}
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		try
		{
			con.close();
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}

		return result;
	}


	public int linkToLoginId( String loginId)
	{
		DBConnector dbConnector = new DBConnector();
		Connection connection = dbConnector.getConnection();
		int count = 0;
		String sql = "update cart_info set user_id=? where temp_user_id=?";

		try
		{
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, loginId);
			count = preparedStatement.executeUpdate();
		}
		catch (SQLException e)
		{
			e.printStackTrace();
		}
		try
		{
			connection.close();
		}
		catch (SQLException e)
		{
			e.printStackTrace();
		}
		return count;
	}

	public boolean addCart(String userId, int productId, int productCount, int itemPrice)
	{
		// TODO 自動生成されたメソッド・スタブ
		return false;
	}

}