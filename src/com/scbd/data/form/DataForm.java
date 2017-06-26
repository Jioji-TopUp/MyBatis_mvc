/**
 * 
 */
package com.scbd.data.form;

import org.apache.ibatis.type.Alias;

/**
 * @author Administrator
 *
 */
@Alias(value="data")
public class DataForm {

		private int login_id;
		private String login_username;
		private String login_password;
		public int getLogin_id() {
			return login_id;
		}
		public void setLogin_id(int login_id) {
			this.login_id = login_id;
		}
		public String getLogin_username() {
			return login_username;
		}
		public void setLogin_username(String login_username) {
			this.login_username = login_username;
		}
		public String getLogin_password() {
			return login_password;
		}
		public void setLogin_password(String login_password) {
			this.login_password = login_password;
		}
		@Override
		public String toString() {
			return "DataForm [login_id=" + login_id + ", login_username="
					+ login_username + ", login_password=" + login_password
					+ "]";
		}


		
		
	}



