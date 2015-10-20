package com.dao;
import java.util.*;
import java.sql.*;
import javax.sql.*;

import oracle.jdbc.OracleTypes;

import javax.naming.*;
public class AdminDAO {
	private Connection conn;
	private CallableStatement cs;
	private static AdminDAO dao;
	private static AdminDAO newInstance(){
		if(dao==null)
			dao=new AdminDAO();
		return dao;
	}
	//주소값 얻어오기(Connection)
	public void getConnection(){
		try{
			Context init=new InitialContext();
			DataSource ds=(DataSource)init.lookup("java://comp/env/jdbc/oracle");
			conn=ds.getConnection();
		}catch(Exception ex){
			System.out.println(ex.getMessage());
		}
	}
	//반환
	public void disConnection(){
		try{
			if(cs!=null) cs.close();
			if(conn!=null) conn.close();
		}catch(Exception ex){}
	}
	public List<AdminDTO> noticeListData(int page){
		List<AdminDTO> list=new ArrayList<AdminDTO>();
		try{
			getConnection();
			int rowSize=10;
			int start=(page*rowSize)-(rowSize-1);
			int end=(page*rowSize);
			String sql="{CALL noticeListData(?,?,?)}";
			cs=conn.prepareCall(sql);
			cs.registerOutParameter(1, OracleTypes.CURSOR);
			cs.setInt(2, start);
			cs.setInt(3, end);
			cs.executeUpdate();
			ResultSet rs=(ResultSet)cs.getObject(1);
			while(rs.next()){
				AdminDTO d=new AdminDTO();
				d.setNo(rs.getInt(1));
				d.setTitle(rs.getString(2));
				d.setContent(rs.getString(3));
				d.setHit(rs.getInt(4));
				d.setRegdate(rs.getDate(5));
				list.add(d);
			}
			rs.close();
		}catch(Exception ex){
			System.out.println(ex.getMessage());
		}
		finally{
			disConnection();
		}
		return list;
	}
	//내용보기
	public AdminDTO noticeContentData(int no){
		AdminDTO d=new AdminDTO();
		try{
			getConnection();
			String sql="{CALL noticeContentData(?,?,?)}";
			cs=conn.prepareCall(sql);
			cs.setInt(1, no);
			cs.registerOutParameter(2, OracleTypes.CURSOR);
			cs.registerOutParameter(3, OracleTypes.VARCHAR);
			cs.executeUpdate();
			ResultSet rs=(ResultSet)cs.getObject(2);
			String res=cs.getString(3);
			if(res.equals("yes")){
				rs.next();
				d.setNo(rs.getInt(1));
				d.setTitle(rs.getString(2));
				d.setContent(rs.getString(3));
				d.setRegdate(rs.getDate(4));
				d.setHit(rs.getInt(5));
				rs.close();
			}
		}catch(Exception ex){
			System.out.println(ex.getMessage());
		}
		finally{
			disConnection();
		}
		return d;
	}
	//이전 글, 다음 글 제목 가져오기
	public AdminDTO noticePrevTitle(int no){
		AdminDTO d=new AdminDTO();
		int prevNo=no-1;
		try{
			getConnection();
			String sql="SELECT no,title FROM notice WHERE no=?";
			cs=conn.prepareCall(sql);
			cs.setInt(1, prevNo);
			ResultSet rs=(ResultSet)cs.executeQuery();
			rs.next();
			d.setNo(rs.getInt(1));
			d.setTitle(rs.getString(2));
		}catch(Exception ex){
			System.out.println(ex.getMessage());
		}
		finally{
			disConnection();
		}
		return d;
	}
	public AdminDTO noticeNextTitle(int no){
		AdminDTO d=new AdminDTO();
		int nextNo=no+1;
		try{
			getConnection();
			String sql="SELECT no,title FROM notice WHERE no=?";
			cs=conn.prepareCall(sql);
			cs.setInt(1, nextNo);
			ResultSet rs=(ResultSet)cs.executeQuery();
			rs.next();
			d.setNo(rs.getInt(1));
			d.setTitle(rs.getString(2));
		}catch(Exception ex){
			System.out.println(ex.getMessage());
		}
		finally{
			disConnection();
		}
		return d;
	}
	public int noticeTotalPage(){
		int total=0;
		try{
			getConnection();
			String sql="{CALL noticeRowCount(?)}";
			cs=conn.prepareCall(sql);
			cs.registerOutParameter(1, OracleTypes.INTEGER);
			cs.executeUpdate();
			int count=cs.getInt(1);
			total=(int)(Math.ceil(count/10.0));
		}catch(Exception ex){
			System.out.println(ex.getMessage());
		}
		finally{
			disConnection();
		}
		return total;
	}
	public int noticeRowCount(){
		int total=0;
		try{
			getConnection();
			String sql="{CALL noticeRowCount(?)}";
			cs=conn.prepareCall(sql);
			cs.registerOutParameter(1, OracleTypes.INTEGER);
			cs.executeUpdate();
			total=cs.getInt(1);
			
		}catch(Exception ex){
			System.out.println(ex.getMessage());
		}
		finally{
			disConnection();
		}
		return total;
	}
}










