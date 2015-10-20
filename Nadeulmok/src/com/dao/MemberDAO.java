package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDAO {
	 private Connection conn;
	   private PreparedStatement ps;

	   public void getConnection()
	   {
		   try
		   {
			   // JNDI를 초기화 
			   Context init=new InitialContext();
			   DataSource ds=(DataSource)init.lookup("java://comp/env/jdbc/oracle");
			   conn=ds.getConnection();
		   }catch(Exception ex)
		   {
			   System.out.println(ex.getMessage());
		   }
	   }
	   // 반환 
	   public void disConnection()
	   {
		   try
		   {
			   if(ps!=null) ps.close();
			   if(conn!=null) conn.close();
		   }catch(Exception ex){}
	   }
	   
	   public void memberJoin(MemberDTO d)
	    {
	    	try
	    	{
	    		getConnection();
	    		String sql="INSERT INTO Lmember VALUES(?,"
	    				  +"?,?,?,?,?,?,?,?,?,?)";
	    		ps=conn.prepareStatement(sql);
	    		ps.setString(1, d.getEmail());
	    		ps.setString(2, d.getPwd());
	    		ps.setString(3, d.getName());
	    		ps.setString(4, d.getNickname());
	    		ps.setString(5, d.getSex());
	    		ps.setInt(6, d.getAge());
	    		ps.setString(7, d.getNation());
	    		ps.setString(8, d.getTel());
	    		ps.setString(9, d.getLang());
	    		ps.setString(10, d.getIntro());
	    		ps.setString(11, d.getPhoto());
	    		ps.executeUpdate(); // IN OUT 
	    		
	    	}catch(Exception ex)
	    	{
	    		System.out.println(ex.getMessage());
	    	}
	    	finally
	    	{
	    		disConnection();
	    	}
	    }
	   
	   public int idcheck(String id)
	    {
	    	int count=0;
	    	try
	    	{
	    		getConnection();
	    		String sql="SELECT COUNT(*) FROM Lmember "
	    				  +"WHERE email=?";
	    		ps=conn.prepareStatement(sql);
	    		ps.setString(1, id);
	    		ResultSet rs=ps.executeQuery();
	    		rs.next();
	    		count=rs.getInt(1);
	    		rs.close();
	    	}catch(Exception ex)
	    	{
	    		System.out.println(ex.getMessage());
	    	}
	    	finally
	    	{
	    		disConnection();
	    	}
	    	return count;
	    }
}
