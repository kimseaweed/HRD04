package DBPKG;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dto.CheckVoteDTO;
import dto.DoVoteDTO;
import dto.MemberDTO;
import dto.RankMemberDTO;

public class DAO {
	
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	
	public static Connection getConnection() throws Exception {
		Connection conn;
		Class.forName("oracle.jdbc.OracleDriver");
		conn=DriverManager.getConnection(
				"jdbc:oracle:thin:@//localhost:1521/xe","C##system","1234");
		System.out.println("접속시작");
		return conn;
	}
	
	public static void getClose(Connection conn,PreparedStatement pstmt, ResultSet rs){
		try {
			if(conn!=null) {conn.close();}
			if(pstmt!=null)	pstmt.close();
			if(rs!=null) {rs.close();}
		} catch (SQLException e) {
			System.out.println("닫기문제");
			e.printStackTrace();
		}
		System.out.println("접속종료");
	}
	
///////////////////////////
	
	public List<MemberDTO> getMember(){
		List<MemberDTO> list = new ArrayList<>();
		
		try {
			conn = DAO.getConnection();
			rs = conn.prepareStatement("SELECT M.M_nO,P.P_NAME, M.M_NAME, DECODE( M.P_SCHOOL, '1', '고졸', '2','학사','3','석사','4','박사') AS P_SCHOOL , SUBSTR(M.M_JUMIN,0,6)||'-'||SUBSTR(M.M_JUMIN,7,7) AS M_JUMIN, M.M_CITY, SUBSTR(P.p_TEL1,0,2)||'-'||P.p_TEL2||'-'||P.p_TEL3 AS P_TEL FROM TBL_MEMBER_202005 M JOIN TBL_PARTY_202005 P ON P.P_CODE = M.P_CODE").executeQuery();
			if(rs.next()) {
				do{
						list.add(
								new MemberDTO(
										rs.getString(1),
										rs.getString(2),
										rs.getString(3),
										rs.getString(4),
										rs.getString(5),
										rs.getString(6),
										rs.getString(7)
										)
								);
				}while(rs.next());
			}else {
				System.out.println("getVote : 조회결과 없음");
			}
		} catch (Exception e) {
			System.out.println("getMember : 실패");
			e.printStackTrace();
		}finally {
			DAO.getClose(conn, pstmt, rs);
		}			
		return list;
	}
	
	public List<CheckVoteDTO> getVote(){
		List<CheckVoteDTO> list = new ArrayList<>();
		
		try {
			conn = DAO.getConnection();
			rs = conn.prepareStatement("SELECT V_NAME AS NAME, 19||SUBSTR(V_JUMIN,0,2)||'년'||SUBSTR(V_JUMIN,3,2)||'월'||SUBSTR(V_JUMIN,5,2)||'일생' AS BIRTH,'만 '||(2020-(19||SUBSTR(V_JUMIN,0,2)))||'세' as age,decode(SUBSTR(V_JUMIN,7,1),'1','남','2','여') AS GENDER,V_NO AS NO,SUBSTR(V_TIME,0,2)||':'||SUBSTR(V_TIME,3,2)AS TIME,DECODE(v_confirm,'Y','확인','N','미확인')AS CONFIRM FROM TBL_VOTE_202005 where v_area = '제1투표장'").executeQuery();
			if(rs.next()) {
				do{
						list.add(
								new CheckVoteDTO(
										rs.getString(1),
										rs.getString(2),
										rs.getString(3),
										rs.getString(4),
										rs.getString(5),
										rs.getString(6),
										rs.getString(7)
										)
								);
				}while(rs.next());
			}else {
				System.out.println("getVote : 조회결과 없음");
			}
		} catch (Exception e) {
			System.out.println("getVote : 실패");
			e.printStackTrace();
		}finally {
			DAO.getClose(conn, pstmt, rs);
		}			
		return list;
	}
	
	public List<RankMemberDTO> getRank(){
		List<RankMemberDTO> list = new ArrayList<>();
		
		try {
			conn = DAO.getConnection();
			rs = conn.prepareStatement("select M.M_NO as no,M.M_NAME as name,COUNT(V.V_NO) AS TOTAL FROM TBL_MEMBER_202005 M JOIN TBL_VOTE_202005 V  ON M.M_NO = V.V_NO where v.V_CONFIRM = 'Y' GROUP BY M.M_NO, M.M_NAME  ORDER BY TOTAL DESC").executeQuery();
			if(rs.next()) {
				do{
						list.add(
								new RankMemberDTO(
										rs.getString(1),
										rs.getString(2),
										rs.getString(3)
										)
								);
				}while(rs.next());
			}else {
				System.out.println("getRank : 조회결과 없음");
			}
		} catch (Exception e) {
			System.out.println("getRank : 실패");
			e.printStackTrace();
		}finally {
			DAO.getClose(conn, pstmt, rs);
		}			
		return list;
	}
//////////////////////////////
	public int doVote(DoVoteDTO dto){
		try {
			System.out.println("투표시작");
			conn = DAO.getConnection();
			pstmt =  conn.prepareStatement("INSERT INTO TBL_VOTE_202005 (V_JUMIN, V_NAME,V_NO,V_TIME,V_AREA,V_CONFIRM)VALUES(?,?,?,?,?,?)");
			pstmt.setString(1, dto.getV_jumin());
			pstmt.setString(2, dto.getV_name());
			pstmt.setString(3, dto.getV_no() );
			pstmt.setString(4, dto.getV_time());
			pstmt.setString(5, dto.getV_area());
			pstmt.setString(6, dto.getV_confirm());
			return pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("doVote : 실패");
			e.printStackTrace();
		}finally {
			DAO.getClose(conn, pstmt, rs);
		}			
		return -1;
	}
	
}
