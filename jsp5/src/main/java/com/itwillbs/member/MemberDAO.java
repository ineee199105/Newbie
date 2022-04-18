package com.itwillbs.member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class MemberDAO {
	// Data Access Object : 데이터 처리 객체
	// => DB관련 모든처리를 하는 객체

	// 공통으로 사용하는 변수 선언
	private Connection con = null;
	// -> 디비의 연결정보를 관리
	private PreparedStatement pstmt = null;
	// -> sql 쿼리 구문을 실행
	private ResultSet rs = null;
	// -> select구문 실행시 레코드셋 데이터를 저장객체
	private String sql = "";
	

//	public MemberDAO() {
//		System.out.println(" DAO 객체 생성 완료!@@@$$$$ ");
//	}
	
	//////////////////////////////////////////////////////////////////////
	// 디비 연결 동작(메서드) - 1,2단계
	private Connection getCon() throws Exception{
		String DRIVER = "com.mysql.cj.jdbc.Driver";
		String DBURL = "jdbc:mysql://localhost:3306/jspdb";
		String DBID = "root";
		String DBPW = "1234";
		
		// 1. 드라이버 로드
		Class.forName(DRIVER);
		
		// 2. 디비 연결
		con = DriverManager.getConnection(DBURL, DBID, DBPW);
		
		System.out.println(" DAO : 디비연결 성공! "+con);
		
		return con;
	}
	//////////////////////////////////////////////////////////////////////
	// 디비 자원해제 동작
	public void closeDB(){
		try {
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(con != null) con.close();
			
			System.out.println(" DAO : 디비 연결 자원해제 ");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	///////////////////////////////////////////////////////////////////////
	

	// 회원가입 - insertMember()
	public void insertMember(MemberBean mb) {
		System.out.println(" DAO : 회원가입 메서드 실행! ");
		String DRIVER = "com.mysql.cj.jdbc.Driver";
		String DBURL = "jdbc:mysql://localhost:3306/jspdb";
		String DBID = "root";
		String DBPW = "1234";
		
		try {
			// 1. 드라이버 로드
			Class.forName(DRIVER);
			// 2. 디비 연결
			con = DriverManager.getConnection(DBURL, DBID, DBPW);
			// 3. sql작성 & pstmt 객체 생성
			sql = "insert into itwill_member(id,pw,name,gender,age,email,reg_date) "
					+ "values(?,?,?,?,?,?,?)";
			
			pstmt = con.prepareStatement(sql);
			// ??? 
			pstmt.setString(1,mb.getId());
			pstmt.setString(2, mb.getPw());
			pstmt.setString(3, mb.getName());
			pstmt.setString(4, mb.getGender());
			pstmt.setInt(5, mb.getAge());
			pstmt.setString(6, mb.getEmail());
			pstmt.setTimestamp(7, mb.getReg_date());
			
			// 4. sql 실행
			pstmt.executeUpdate();
			
			System.out.println(" DAO : 회원가입 완료! ");
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				// DB관련 동작이 모두 끝났을때 객체 정보가 남아있는경우
				// 자원을 해제
				if(pstmt != null){ pstmt.close(); }
				if(con != null){ con.close(); }
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

	}
	// 회원가입 - insertMember()
	
	// loginCheck(id,pw)
	public int loginCheck(String id,String pw){
		int result = -1;
		
		try {
			// 1. 드라이버 로드
			// 2. 디비 연결
			con = getCon();
			// 3. sql 작성(select) & pstmt생성
			sql = "select pw from itwill_member where id=?";
			pstmt = con.prepareStatement(sql);
			
			// ???
			pstmt.setString(1, id);

			// 4. sql 실행
			rs = pstmt.executeQuery();
			
			// 5. 데이터 처리
			if(rs.next()){
				//아이디에 해당하는 비밀번호가 있다. => 회원
				if(pw.equals(rs.getString("pw"))){
					// 입력받은 비밀번호와 디비에 저장된 비밀번호가 동일하다
					// => 본인
					result = 1;					
				}else{
					// 입력받은 비밀번호와 디비에 저장된 비밀번호가 다르다
					result = 0;
				}				
			}else{
				//아이디에 해당하는 비밀번호가 없다. => 비회원
				result = -1;
			}
			
			System.out.println(" DAO : 로그인 체크완료! ("+result+")");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
		return result;
	}
	// loginCheck(id,pw)
	
	
	// getMember(id)
	public MemberBean getMember(String id){
		MemberBean mb = null;
		
		try {
			// 1 2 디비연결
			con = getCon();
			// 3 sql 작성(select) & pstmt 객체
			sql = "select * from itwill_member where id=?";
			pstmt = con.prepareStatement(sql);
			
			// ???
			pstmt.setString(1, id);
			
			// 4 sql 실행
			rs = pstmt.executeQuery();
			// 5 데이터 처리
			if(rs.next()){
				// 아이디에 해당하는 회원정보를 저장
				mb = new MemberBean();
				
				mb.setId(rs.getString("id"));
				mb.setPw(rs.getString("pw"));
				mb.setName(rs.getString("name"));
				mb.setGender(rs.getString("gender"));
				mb.setAge(rs.getInt("age"));
				mb.setEmail(rs.getString("email"));
				mb.setReg_date(rs.getTimestamp("reg_date"));
			}
			
			System.out.println(" DAO : 회원정보 저장완료! ");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
		return mb;
	}
	// getMember(id)
	
	
	
	
	// updateMember(updateBean)
	public int updateMember(MemberBean umb){
		int result = -1;
		
		try {
			// 1 2 디비연결
			con = getCon();
			// 3 sql 작성(select) & pstmt 객체
			sql = "select pw from itwill_member where id = ?";
			pstmt = con.prepareStatement(sql);
			
			// ??
			pstmt.setString(1, umb.getId());
			
			// 4 sql 실행
			rs = pstmt.executeQuery();
			
			// 5 데이터 처리
			if(rs.next()){// 수정할 정보가 있을때(회원)
				if(umb.getPw().equals(rs.getString("pw"))){
					// 본인 => 정보 수정
					
					// 3 sql 작성(update) & pstmt 객체 
					sql = "update itwill_member set name=?,gender=?,age=? where id=?";
					pstmt = con.prepareStatement(sql);
					
					// ????
					pstmt.setString(1, umb.getName());
					pstmt.setString(2, umb.getGender());
					pstmt.setInt(3, umb.getAge());
					pstmt.setString(4, umb.getId());
					
					// 4 sql 실행
					result = pstmt.executeUpdate();
					//result = 1;					
				}else{
					// 본인 X, 정보수정 X  
					result = 0;
					System.out.println(" DAO : 비밀번호 오류, 정보수정 X");
				}
			}else{
				result = -1;
				System.out.println(" DAO : 회원정보가 없음, 정보수정 X");
			}			
			
			System.out.println(" DAO : 회원정보 수정완료! ("+result+")");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}		
		
		return result;
	}
	// updateMember(updateBean)
	
	
	// deleteMember(id,pw)
	public int deleteMember(String id,String pw){
		int result = -1;
		
		try {
			// 1 2 디비연결
			con = getCon();
			// 3 sql 작성(select) & pstmt 객체
			sql = "select pw from itwill_member where id = ?";
			pstmt = con.prepareStatement(sql);
			
			// ??
			pstmt.setString(1,id);
			
			// 4 sql 실행
			rs = pstmt.executeQuery();
			
			// 5 데이터 처리
			if(rs.next()){// 수정할 정보가 있을때(회원)
				if(pw.equals(rs.getString("pw"))){
					// 본인 => 정보 수정
					
					// 3 sql 작성(delete) & pstmt 객체 
					sql = "delete from itwill_member where id=?";
					pstmt = con.prepareStatement(sql);
					
					// ????
					pstmt.setString(1, id);
					
					// 4 sql 실행
					result = pstmt.executeUpdate();
					//result = 1;					
				}else{
					// 본인 X, 정보수정 X  
					result = 0;
					System.out.println(" DAO : 비밀번호 오류, 정보삭제 X");
				}
			}else{
				result = -1;
				System.out.println(" DAO : 회원정보가 없음, 정보삭제 X");
			}			
			
			System.out.println(" DAO : 회원정보 삭제완료! ("+result+")");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}		
		
		return result;
	}
	// deleteMember(id,pw)
	
	// getMemberList()
	public ArrayList getMemberList(){
		ArrayList memberList = new ArrayList();
		
		try {
			// 1 2 디비연결
			con = getCon();
			// 3 sql 작성(select) & pstmt 객체
			//sql = "select * from itwill_member";
			sql = "select * from itwill_member where id != ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "admin");
			// 4 sql 실행
			rs = pstmt.executeQuery();
			
			// 5 데이터 처리(DB정보를 모두 저장)
			while(rs.next()){
				// 회원 1명의 정보를 memberList 한칸에 저장
				MemberBean mb = new MemberBean();
				
				mb.setAge(rs.getInt("age"));
				mb.setEmail(rs.getString("email"));
				mb.setGender(rs.getString("gender"));
				mb.setId(rs.getString("id"));
				mb.setName(rs.getString("name"));
				mb.setPw(rs.getString("pw"));
				mb.setReg_date(rs.getTimestamp("reg_date"));
				System.out.println("회원 정보(1명) 저장완료");
				////////////////////////////////////////////////////////////
				
				memberList.add(mb);
				System.out.println("회원리스트 한칸에 저장완료");
			}
			
			System.out.println(" DAO : 회원 전체목록 저장완료! ");
			System.out.println(memberList);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
		return memberList;
	}
	// getMemberList()
	
	
	
	
	
	

}//MemberDAO
