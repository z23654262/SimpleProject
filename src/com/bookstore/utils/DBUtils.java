package com.bookstore.utils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ResourceBundle;

import org.apache.commons.dbcp2.BasicDataSource;

public class DBUtils {
	//创建DataSource接口的实现类对象(BasicDataSource)，我们的dbcp工具包已经帮我们实现好了，咱们直接用就好！
    private static BasicDataSource dataSource = new BasicDataSource();    
    
    //定义数据库链接变量
    private static final String DRIVERNAME;
    private static final String URL;
    private static final String USERNAME;
    private static final String PASSWORD;
    
    static {
        //注意，在给ResourceBundle的getBundle传参时应该注意两件事：第一，只传递文件名称并不传递文件后缀(即:yinzhengjie)，第二，该文件应该在classpath中或者是跟包名在同一路径(即：在src目录中)
        DRIVERNAME = ResourceBundle.getBundle("jdbc").getString("DriverName");
        URL = ResourceBundle.getBundle("jdbc").getString("url");
        USERNAME = ResourceBundle.getBundle("jdbc").getString("username");
        PASSWORD = ResourceBundle.getBundle("jdbc").getString("password");
    }
    
    //静态代码块，对象BasicDataSource对象中的配置，自定义
    static {
        //链接数据库的4个最基本信息，通过对象的set方法进行设置如下：
        dataSource.setDriverClassName(DRIVERNAME);                    //设置数据库驱动
        dataSource.setUrl(URL);                                        //设置访问数据库的路径
        dataSource.setUsername(USERNAME);                            //设置登录数据库的用户名
        dataSource.setPassword(PASSWORD);                            //设置登录数据库的密码
        dataSource.setInitialSize(10);
        dataSource.setMaxTotal(30);
        dataSource.setMaxIdle(10);
        dataSource.setMinIdle(5);
    }
    
    //定义静态方法，返回BasicDataSource类的对象
    public static Connection getConnection() throws SQLException {
        return dataSource.getConnection();
    }
    
    public static void free(Connection con,PreparedStatement pst,ResultSet rs) {
    	try {
			if(null != con) {
				con.close();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			if(null != pst) {
				pst.close();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			if(null != rs) {
				rs.close();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }
    
    public static void free(Connection con,PreparedStatement pst) {
    	try {
			if(null != con) {
				con.close();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			if(null != pst) {
				pst.close();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }
}
