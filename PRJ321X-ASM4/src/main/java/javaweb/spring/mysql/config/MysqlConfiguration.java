package javaweb.spring.mysql.config;

import javax.sql.DataSource;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

import javaweb.spring.dao.ShoppingDao;
import javaweb.spring.dao.ShoppingDaoImpl;

@Configuration
@ComponentScan(basePackages="javaweb.spring")
@EnableWebMvc

public class MysqlConfiguration extends WebMvcConfigurerAdapter {
	@Bean
    public DataSource getDataSource() {
        DriverManagerDataSource dataSource = new DriverManagerDataSource();
        dataSource.setDriverClassName("com.mysql.jdbc.Driver");
        dataSource.setUrl("jdbc:mysql://localhost:3306/shoppingdb");
        dataSource.setUsername("root");        
        dataSource.setPassword("123456aA@");   
        return dataSource;
    }
     
    @Bean
    public ShoppingDao getShoppingDao() {
        return new ShoppingDaoImpl(getDataSource());
    }

}
