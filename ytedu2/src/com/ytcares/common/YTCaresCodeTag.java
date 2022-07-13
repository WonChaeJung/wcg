package com.ytcares.common;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;
import javax.sql.DataSource;

public class YTCaresCodeTag extends TagSupport {
	private static final long serialVersionUID 		= -5273457438653684413L;
	
	private enum TYPE{
		TEXT(0), CODENTEXT(1);
		private int type;
		private TYPE(int type){this.type = type;}
		public String getType(){return String.valueOf(this.type);}
	};
	
	private static final String CONJUNCTION 		= " - ";
	private String id;
	private String name;
	private String cssClass;
	private String cssStyle;
	private String onchange;
	private String type;
	private String selected;
	private String required;
	private String blank;
	private String mcodeCd;
	private String valCol;
	private String lblCol;
	private String where;
	private String orderBy;
	private String disabled;
	private String table;
	
	public YTCaresCodeTag(){super();}
	
	@Override
	public int doStartTag() {
		Connection conn 		= null;
		PreparedStatement pstmt = null;
		ResultSet rs 			= null;
		
		try {
			JspWriter 		out = pageContext.getOut();
			StringBuffer 	buf = new StringBuffer("<SELECT ");
			
			if (id 		!= null && !"".equals(id)) 			buf.append("id=\"").append(id).append("\" ");
			if (name 	!= null && !"".equals(name)) 		buf.append("name=\"").append(name).append("\" ");
			if (required!= null && !"".equals(required)) 	buf.append("required=\"").append(required).append("\" ");
			if (cssClass!= null && !"".equals(cssClass)) 	buf.append("class=\"").append(cssClass).append("\" ");
			if (cssStyle!= null && !"".equals(cssStyle)) 	buf.append("style=\"").append(cssStyle).append("\" ");
			if (onchange!= null && !"".equals(onchange)) 	buf.append("onchange=\"").append(onchange).append("\"");
			if (disabled!= null && !"".equals(disabled)) 	buf.append("disabled=\"").append(disabled).append("\"");
			
			buf.append(">");
			
			if (blank != null && !"".equals(blank)) buf.append("<OPTION value=''>").append(blank).append("</OPTION>");
			
			Context initCtx = new InitialContext();
			DataSource ds = (DataSource)initCtx.lookup("java:comp/env/jdbc/ytedu");
			conn = ds.getConnection();
			
			StringBuffer sql = new StringBuffer();
			sql.append("\nSELECT * \nFROM\n\t");
			if (table == null || "".equals(table)) {
				sql.append("TCODE\n");
			}else {
				sql.append(table).append("\n");
			}
			//sql.append(valCol);
			
			String[] cols = lblCol.split(",");
//			for(int i = 0; i < cols.length; i++) {
//				cols[i] = cols[i].trim();
//				if (!valCol.equals(cols[i])) sql.append(",\n\t").append(cols[i]);
//			}
			
//			sql.append("\nFROM\n\tTCODE");
			sql.append("\nWHERE\n\tMCODE_CD='").append(mcodeCd).append("'");
			
			if (where != null && !"".equals(where)) sql.append(" AND\n\t").append(where);
			
			sql.append("\nORDER BY\n\t");
			if (orderBy != null && !"".equals(orderBy)) {
				sql.append(orderBy);
			} else {
				sql.append("ORDER_NO");
			}

			pstmt = conn.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();
			while(rs.next()) {
				buf.append("<OPTION value=\"").append(rs.getString(valCol)).append("\" ");
				if (selected != null && !"".equals(selected) && selected.equals(rs.getString(valCol))) {
					buf.append("selected='selected'");
				}
				ResultSetMetaData meta =  rs.getMetaData();
				int count = meta.getColumnCount();
				for(int i = 1; i <= count; i++) {
					String columnName = meta.getColumnName(i);
					buf.append(" ").append(columnName).append("=\"");
					if(rs.getString(i) != null) {
						buf.append(rs.getString(i));
					}
					buf.append("\"");
				}
				
				buf.append(">");
				if (TYPE.CODENTEXT.getType().equals(type) || TYPE.CODENTEXT.name().equalsIgnoreCase(type)) {
					buf.append(rs.getString(valCol)).append(CONJUNCTION);
					for(int i = 0; i < cols.length; i++) {
						buf.append(rs.getString(cols[i])).append(" ");
					}
				} else {
					for(int i = 0; i < cols.length; i++) {
						buf.append(rs.getString(cols[i])).append(" ");
					}
				}
				
				buf.append("</OPTION>");
			}
			
			buf.append("</SELECT>");
			out.print(buf.toString());
			out.flush();
			
		} catch (IOException e) {
			e.printStackTrace();
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs 		!= null) rs.close();
				if(pstmt 	!= null) pstmt.close();
				if(conn 	!= null) conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return SKIP_BODY;
	}

	public void setId(String id) {
		this.id = id;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setCssClass(String cssClass) {
		this.cssClass = cssClass;
	}

	public void setCssStyle(String cssStyle) {
		this.cssStyle = cssStyle;
	}

	public void setOnchange(String onchange) {
		this.onchange = onchange;
	}

	public void setType(String type) {
		this.type = type;
	}

	public void setSelected(String selected) {
		this.selected = selected;
	}
	
	public void setRequired(String required) {
		this.required = required;
	}
	
	public void setBlank(String blank) {
		this.blank = blank;
	}
	public void setMcodeCd(String mcodeCd) {
		this.mcodeCd = mcodeCd;
	}
	public void setValCol(String valCol) {
		this.valCol = valCol;
	}

	public void setLblCol(String lblCol) {
		this.lblCol = lblCol;
	}
	
	public void setWhere(String where) {
		this.where = where;
	}
	
	public void setOrderBy(String orderBy) {
		this.orderBy = orderBy;
	}
	
	public void setDisabled(String disabled) {
		this.disabled = disabled;
	}
	
	public void setTable(String table) {
		this.table = table;
	}
}
