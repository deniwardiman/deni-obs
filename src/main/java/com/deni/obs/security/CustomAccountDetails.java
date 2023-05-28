package com.deni.obs.security;

import com.deni.obs.model.UserCms;
/* COMMENT */
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.UserDetails;
/* COMMENT */
import org.springframework.util.StringUtils;

import java.util.Collection;
import java.util.List;

public class CustomAccountDetails extends UserCms /* COMMENT */ implements UserDetails /* COMMENT */ {
	
	private static final long serialVersionUID = 1L;
	private List<String> userRoles;
	private String token;

	public CustomAccountDetails(UserCms user, List<String> userRoles){
		super(user);
		this.userRoles = userRoles;
	}

	/* COMMENT */
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {

		String roles= StringUtils.collectionToCommaDelimitedString(userRoles);
		return AuthorityUtils.commaSeparatedStringToAuthorityList(roles);
	}

	@Override
	public boolean isAccountNonExpired() {
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}

	@Override
	public boolean isEnabled() {
		return true;
	}

	@Override
	public String getUsername() {
		return super.getName();
	}
	/* COMMENT */

	public String getEmail() {
		return super.getEmail();
	}

	public String getName() {
		return super.getName();
	}

}
