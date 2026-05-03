package com.health.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.config.annotation.web.configurers.AbstractHttpConfigurer;

@Configuration
@EnableWebSecurity
public class SecurityConfig {

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        http
            .csrf(AbstractHttpConfigurer::disable) // Disable CSRF for manual React/JS auth
            .authorizeHttpRequests(auth -> auth
                .requestMatchers("/api/user/login", "/api/user/signup", "/api/user/ping").permitAll()
                .requestMatchers("/SignupServlet", "/LoginServlet", "/LogoutServlet", "/HealthDataServlet", "/ProfileServlet").permitAll()
                .requestMatchers("/", "/index.jsp", "/login.jsp", "/signup.jsp", "/css/**", "/js/**", "/img/**").permitAll()
                .anyRequest().permitAll() // Allow all while testing, let JS check 'user' in localStorage
            )
            .formLogin(AbstractHttpConfigurer::disable) // Disable the default Spring Login form
            .httpBasic(AbstractHttpConfigurer::disable); // Disable Basic Auth
        
        return http.build();
    }
}
