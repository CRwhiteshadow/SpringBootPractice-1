package com.example.practice;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Configuration;

@Configuration
@SpringBootApplication
public class SpringBootPractice1Application {

	public static void main(String[] args) {
		SpringApplication.run(SpringBootPractice1Application.class, args);
	}
	
//    @Bean
//    public MultipartConfigElement multipartConfigElement(
//            @Value("${multipart.maxFileSize}") String maxFileSize,
//            @Value("${multipart.maxRequestSize}") String maxRequestSize) {
//        MultipartConfigFactory factory = new MultipartConfigFactory();
//        // 單一檔案最大size
//        factory.setMaxFileSize(DataSize.ofBytes(Integer.valueOf(maxFileSize)));
//        // 所有檔案合計最大size
//        factory.setMaxRequestSize(DataSize.ofBytes(Integer.valueOf(maxRequestSize)));
//        return factory.createMultipartConfig();
//    }

}
