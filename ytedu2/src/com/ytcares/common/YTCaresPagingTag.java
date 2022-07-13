package com.ytcares.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.tagext.TagSupport;

public class YTCaresPagingTag extends TagSupport {
	private static final long serialVersionUID 		= -5273457438653684413L;
	
	public void setId(String id) {
		this.id = id;
	}

	public void setCount(String count) {
		this.count = count;
	}

	public void setPageNum(String pageNum) {
		this.pageNum = pageNum;
	}

	public void setPageSize(String pageSize) {
		this.pageSize = pageSize;
	}

	public void setNaviSize(String naviSize) {
		this.naviSize = naviSize;
	}

	public void setOnclick(String onclick) {
		this.onclick = onclick;
	}

	public void setCssClass(String cssClass) {
		this.cssClass = cssClass;
	}

	private String id, count, pageNum, pageSize, naviSize, onclick;
	private String firstPageImg, lastPageImg, prevPageImg, nextPageImg;
	private String cssClass;
	
	private int iCount, iPageNum, iPageSize, iNaviSize;
	private int iTotalPage, iFromPage, iToPage;
	
	public YTCaresPagingTag() {super();}
	
	public void init() {
		firstPageImg = pageContext.getServletContext().getInitParameter("firstPageImg");
		prevPageImg = pageContext.getServletContext().getInitParameter("prevPageImg");
		nextPageImg = pageContext.getServletContext().getInitParameter("nextPageImg");
		lastPageImg = pageContext.getServletContext().getInitParameter("lastPageImg");

		if (cssClass == null || "".equals(cssClass)) {
			cssClass = "ytcares-paging";
		}
		if (count != null && !count.equals("")) {
			iCount = Integer.parseInt(count);
		} else {
			iCount 	= 0;
			iTotalPage 	= 0;
		}
		//현재페이지
		if (pageNum != null && !"".equals(pageNum)) {
			iPageNum = Integer.parseInt(pageNum);
			if (iPageNum < 1) {
				iPageNum = 1;
			}
		} else {
			iPageNum = 1;
		}
		//페이지당 레코드 수
		if (pageSize != null && !"".equals(pageSize)) {
			iPageSize = Integer.parseInt(pageSize);
		} else {
			iPageSize = 10;
		}
		if (naviSize != null && !"".equals(naviSize)) {
			iNaviSize = Integer.parseInt(naviSize);
		} else {
			iNaviSize = 10;
		}
		/*
		if (noPerIdx != null && !noPerIdx.equals(""))
			noPerIdxInt = Integer.parseInt(noPerIdx);
		*/
		if (iCount != 0) {
			iTotalPage 	= ((iCount - 1) / iPageSize) + 1;
			if (iPageNum > iTotalPage) {
				iPageNum = iTotalPage;
			}
			iFromPage 	= ((iPageNum - 1) / iNaviSize) * iNaviSize + 1;
			iToPage		= (iFromPage + iNaviSize - 1);
			if (iToPage >= iTotalPage) {
				iToPage = iTotalPage;
			}
		} else {
			iTotalPage = 0;
		}
	}
	
	@Override
	public int doEndTag() throws javax.servlet.jsp.JspTagException {
		try {
			StringBuffer buf = new StringBuffer();
			String cxtPath = ((HttpServletRequest)pageContext.getRequest()).getContextPath();
			init();
			
			if (iTotalPage != 0 && iTotalPage != 1) {
				buf.append("\n<table ");
				if (id != null && !"".equals(id)) {
					buf.append("id=\"");
					buf.append(id);
					buf.append("\" ");
				}
				if (cssClass != null && !"".equals(cssClass)) {
					buf.append("class=\"");
					buf.append(cssClass);
					buf.append("\" ");
				}
				
				buf.append(" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\">\n");
				buf.append("<tr>\n");
				if (iFromPage > 1) {
					buf.append("<td>");
					buf.append("<a href=\"javascript:");
					buf.append(onclick);
					buf.append("('1')\">");
					
					if (firstPageImg != null && !"".equals(firstPageImg)) {
						buf.append("<img src=\"");
						buf.append(cxtPath);
						buf.append(firstPageImg);
						buf.append("\" border=\"0\" align=\"absmiddle\">");
					} else {
						buf.append("&lt;&lt;");
					}
					
					buf.append("</a>");
					buf.append("</td>\n");
					
					buf.append("<td>");
					buf.append("<a href=\"javascript:");
					buf.append(onclick);
					buf.append("('");
					buf.append(iFromPage-1);
					buf.append("')\">");
					if (prevPageImg != null && !"".equals(prevPageImg)) {
						buf.append("<img src=\"");
						buf.append(cxtPath);
						buf.append(prevPageImg);
						buf.append("\" border=\"0\" align=\"absmiddle\">");
					} else {
						buf.append("&lt;");
					}
					buf.append("</a>");
					buf.append("</td>\n");
				}

				for (int i = iFromPage; i <= iToPage; i++) {
					buf.append("<td>");
					if (i == iPageNum) {
						buf.append("<span>" + i+ "</span>");
					} else {
						buf.append("<a href=\"javascript:" + onclick+ "('"+ i + "')\">" + i + "</a>");
					}
					buf.append("</td>\n");
				}
				if (iToPage < iTotalPage) {
					buf.append("<td>");
					buf.append("<a href=\"javascript:");
					buf.append(onclick);
					buf.append("('");
					buf.append(iToPage+1);
					buf.append("')\">");
					if (nextPageImg != null && !"".equals(nextPageImg)) {
						buf.append("<img src=\"");
						buf.append(cxtPath);
						buf.append(nextPageImg);
						buf.append("\" border=\"0\" align=\"absmiddle\">");
					} else {
						buf.append("&gt;");
					}
					buf.append("</a>");
					buf.append("</td>\n");
					
					buf.append("<td>");
					buf.append("<a href=\"javascript:");
					buf.append(onclick);
					buf.append("('");
					buf.append(iTotalPage);
					buf.append("')\">");
					if (lastPageImg != null && !"".equals(lastPageImg)) {
						buf.append("<img src=\"");
						buf.append(cxtPath);
						buf.append(lastPageImg);
						buf.append("\" border=\"0\" align=\"absmiddle\">");
					} else {
						buf.append("&gt;&gt;");
					}
					buf.append("</a>");
					buf.append("</td>\n");
				}
				buf.append("</tr>\n");
				buf.append("</table>\n");
			} else {
				buf.append("&nbsp;");
			}
			pageContext.getOut().write(buf.toString());
		} catch (java.io.IOException e) {
			e.printStackTrace();
		}
		return EVAL_PAGE;
	}
}
