package JavaEEProject;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
public class ProjectSpringApp  {

    public static void main(String[] args) throws Exception {
        SpringApplication.run(ProjectSpringApp.class, args);
    }
}
