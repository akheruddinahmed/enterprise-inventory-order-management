package managementSystem.configuration;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
public class Config {

//	---------------- PASSWORD ENCODER ----------------

	@Bean
	public BCryptPasswordEncoder passwordEncoder() {

		return new BCryptPasswordEncoder();
	}

//	---------------- SECURITY CONFIG ----------------

	@Bean
	public SecurityFilterChain securityFilter(HttpSecurity http) throws Exception {

		http

				.csrf(csrf -> csrf.disable())

				.authorizeHttpRequests(auth -> auth

						.requestMatchers(

								"/",

								"/user/**",

								"/oauth2/**",

								"/login/**",

								"/css/**",

								"/js/**",

								"/images/**"

						).permitAll()

						.anyRequest().permitAll())

//		---------------- GITHUB LOGIN ----------------

				.oauth2Login(oauth ->

				oauth

						.defaultSuccessUrl("/user/oauthSuccess", true))

//		---------------- DISABLE DEFAULT LOGIN ----------------

				.formLogin(form -> form.disable())

				.httpBasic(httpBasic -> httpBasic.disable());

		return http.build();
	}

}