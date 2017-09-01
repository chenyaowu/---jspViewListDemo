package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import entity.Item;
import util.CommonADO;

public class ItemDAO {
	
	
	public ArrayList<Item> getAllItem(){
		ArrayList<Item> list = new ArrayList<Item>();
		CommonADO com = CommonADO.getCommonADO();
		ResultSet rs = com.executeSelect("select * from item");
		try {
			while(rs.next()){
				Item item = new Item();
				item.setCity(rs.getString("city"));
				item.setId(rs.getInt("id"));
				item.setName(rs.getString("name"));
				item.setNumber(rs.getInt("number"));
				item.setPicture(rs.getString("picture"));
				item.setPrice(rs.getInt("price"));
				list.add(item);
			}
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}
	
	public Item getItemById(int id){
		CommonADO com = CommonADO.getCommonADO();
		String sql = "select * from item where id = '"+id+"'";
		ResultSet rs = com.executeSelect(sql);
		try {
			if(rs.next()){
				Item item = new Item();
				item.setCity(rs.getString("city"));
				item.setId(rs.getInt("id"));
				item.setName(rs.getString("name"));
				item.setNumber(rs.getInt("number"));
				item.setPicture(rs.getString("picture"));
				item.setPrice(rs.getInt("price"));
				rs.close();
				return item;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	public ArrayList<Item> getViewList(String list){
		ArrayList<Item> arrayList = new ArrayList<Item>();
		if(list!=null && list.length()>0){
			String arr[] = list.split(",");
			
			if(arr.length>=5){
				for (int i = arr.length-1; i >=arr.length-5; i--) {
					int id = Integer.parseInt(arr[i]);
					arrayList.add(getItemById(id));
				}
			}else{
				for (int i = arr.length-1; i >=0; i--) {
					int id = Integer.parseInt(arr[i]);
					arrayList.add(getItemById(id));
				}
			}
			
			
		}
		
		return arrayList;
	}
}
