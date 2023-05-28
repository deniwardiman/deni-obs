package com.deni.obs.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.security.SecurityProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;
import org.springframework.security.web.firewall.HttpFirewall;
import org.springframework.security.web.firewall.StrictHttpFirewall;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;
import org.springframework.security.web.util.matcher.RequestMatcher;

import javax.servlet.http.HttpServletRequest;
import java.util.regex.Pattern;

@Configuration
@EnableGlobalMethodSecurity(prePostEnabled = true)
@EnableWebSecurity
@ComponentScan(basePackageClasses = {CustomAccountDetailsService.class})
/* COMMENT */
public class WebSecurityConfig /* COMMENT */ extends WebSecurityConfigurerAdapter /* COMMENT */ {

    /* COMMENT */
    private final UserDetailsService userDetailsService;

    @Autowired private SecurityProperties securityProperties;

    @Autowired
    public WebSecurityConfig(UserDetailsService userDetailsService) {
        this.userDetailsService = userDetailsService;
    }

    @Autowired
    public void configAuthentication(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(userDetailsService).passwordEncoder(passwordencoder());
    }

    @Bean(name = "passwordEncoder")
    public PasswordEncoder passwordencoder() {
        return new BCryptPasswordEncoder();
    }

    @Bean
    public HttpFirewall allowSemicolonHttpFirewall() {
        StrictHttpFirewall firewall = new StrictHttpFirewall();
        firewall.setAllowSemicolon(true);
        return firewall;
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {

        // Build the request matcher for CSFR
        RequestMatcher csrfRequestMatcher = new RequestMatcher() {

            // Enabled CSFR protection on the following urls:
            private AntPathRequestMatcher[] requestMatchers = {
//                new AntPathRequestMatcher("/**/verify"),
                new AntPathRequestMatcher("/login*")
            };
            
            private Pattern allowedMethods = 
            Pattern.compile("^(GET|HEAD|TRACE|OPTIONS)$");
            
            @Override
            public boolean matches(HttpServletRequest request) {
                // If the request match one url the CSFR protection will be enabled
                for (AntPathRequestMatcher rm : requestMatchers) {
                    // enable csrf only for login
                    if (rm.matches(request) && !(allowedMethods.matcher(request.getMethod()).matches())) {
                        return true; }
                }
                return false;
            } // method matches
        }; // new RequestMatcher

                http.authorizeRequests() //.antMatchers("/user-cms/**").hasAuthority("admin")
                        .anyRequest().fullyAuthenticated()
                        .and()
                        .formLogin()
                        .loginPage("/login")
                        .failureUrl("/login?error")
                        .failureHandler(new CustomAuthenticationFailureHandler())
                        .defaultSuccessUrl("/home", true)
                        .permitAll()
                        .and()
                        .logout()
                        .logoutRequestMatcher(new AntPathRequestMatcher("/logout"))
                        .logoutSuccessUrl("/login?success")
                        .permitAll()
                        .and()
                        .exceptionHandling().accessDeniedPage("/403")
                        .and()
                        .csrf().ignoringAntMatchers("/ckeditor/**") // Disable csrf only on some request matches
                        .and()
                        .headers().frameOptions().sameOrigin(); //enable frameoption from same origin

    }
    @Override
    public void configure(WebSecurity web) throws Exception {
        super.configure(web);
        web.httpFirewall(allowUrlEncodedSlashHttpFirewall());
        web.ignoring().antMatchers("/resources/**", "/user-cms/account_activation/confirm/**", "/images/**");
    }

    @Bean
    public HttpFirewall allowUrlEncodedSlashHttpFirewall() {
        StrictHttpFirewall firewall = new StrictHttpFirewall();
        firewall.setAllowUrlEncodedSlash(true);
        firewall.setAllowBackSlash(true);
        firewall.setAllowSemicolon(true);
        return firewall;
    }

    @Bean
    SavedRequestAwareAuthenticationSuccessHandler handler() {
        SavedRequestAwareAuthenticationSuccessHandler handler = new SavedRequestAwareAuthenticationSuccessHandler();
        handler.setAlwaysUseDefaultTargetUrl(true);
        return  handler;
    }
}