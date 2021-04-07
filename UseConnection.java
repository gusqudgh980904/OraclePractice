package day0406;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class UseConnection {

	public UseConnection(){
		//1.Driver �ε�
		try {
			//�ܺ� Driver(������ jar)�� Eclipse���� �ν��ϵ��� ������� build path�� �����ؾ��Ѵ�
			//�ܺ� Driver(������ jar)�� �������� JDK���� �ν��ϵ��� ������� class path�� �����ؾ��Ѵ�			
			Class.forName("oracle.jdbc.OracleDriver");
			System.out.println("����̹� �ε� ����");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}//catch
		
		//2.�ε��� ����̹��� ����Ͽ� Connection ���
		String url="jdbc:oracle:thin:@localhost:1521:orcl";
		String id="scott";
		String pass="tiger";
		
		try {
			Connection con=DriverManager.getConnection(url,id,pass);
			System.out.println("DB��������:"+con);
		} catch (SQLException e) {
			e.printStackTrace();
			
		}//catch
		
		
		
	}//UseConnection
	
	public static void main(String[] args) {
		new UseConnection();			
	}//main

}//class
