package beans;

import java.sql.ResultSet;

public class StoryBean {
	private ResultSet resultSet;

	public StoryBean() {
	}

	public StoryBean(ResultSet resultSet) {
		this.resultSet = resultSet;
	}

	public ResultSet getResultSet() {
		return resultSet;
	}

	public void setResultSet(ResultSet resultSet) {
		this.resultSet = resultSet;
	}

}
