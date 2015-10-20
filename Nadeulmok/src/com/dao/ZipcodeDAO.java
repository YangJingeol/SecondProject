package com.dao;
import java.util.*;
import java.sql.*;
import javax.sql.*;

import oracle.jdbc.OracleTypes;

import javax.naming.*;

public class ZipcodeDAO {
	private Connection conn;
	private PreparedStatement ps;
	private CallableStatement cs;
	
	public void getConnection()
	{
		try
		{
			Context init = new InitialContext();
			DataSource ds = (DataSource)init.lookup("java://comp/env/jdbc/oracle");
			conn = ds.getConnection();
		}catch(Exception ex)
		{
			System.out.println(ex.getMessage());
		}
	}
	public void disConnection()
	{
		try {
			if(ps != null) ps.close();
			if(cs != null) cs.close();
			if(conn != null) conn.close();
			
		} catch (Exception ex) {
		}
	}
	
	public int postFindCount(String dong)
	{
		int count=0;
		try 
		{
			getConnection();
			String sql = "SELECT postCount('"+dong+"') FROM DUAL";
			ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			rs.next();
			count = rs.getInt(1);
			rs.close();
			
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
		}
		finally
		{
			disConnection();
		}
		return count;
	}

	public List<ZipcodeDTO> postFindData(String dong)
	{
		List<ZipcodeDTO> list = new ArrayList<ZipcodeDTO>();
		try 
		{
			getConnection();
			String sql = "{CALL postfind(?,?)}";
			cs = conn.prepareCall(sql);
			cs.setString(1, dong);
			cs.registerOutParameter(2, OracleTypes.CURSOR);
			cs.executeUpdate();
			ResultSet rs = (ResultSet)cs.getObject(2);
			
			while(rs.next())
			{
				ZipcodeDTO d = new ZipcodeDTO();
				d.setZipcode(rs.getString(1));
				d.setSido(rs.getString(2));
				d.setGugun(rs.getString(3));
				d.setDong(rs.getString(4));
				d.setBunji(rs.getString(5));
				list.add(d);
			}
			rs.close();
		} 
		catch (Exception ex) 
		{
			System.out.println(ex.getMessage());
		}
		finally
		{
			disConnection();
		}
		return list;
	}
}


