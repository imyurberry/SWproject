package com.sw.board;

import java.sql.Connection;

import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration( locations= {"file:src/main/webapp/WEB-INF/spring/root-context.xml"} )
public class DataSourceTest {
	@Autowired
	DataSource ds;
	
	@Test
	public void testConnection() throws Exception {
		Connection conn = null;
		
		conn = ds.getConnection();
		System.out.println("DB�� ���ӵ� : " + (conn!=null));
		
		conn.close();
	}
}
