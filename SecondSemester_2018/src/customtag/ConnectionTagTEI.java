package customtag;

import javax.servlet.jsp.tagext.TagData;
import javax.servlet.jsp.tagext.TagExtraInfo;
import javax.servlet.jsp.tagext.VariableInfo;

public class ConnectionTagTEI extends TagExtraInfo{
	public VariableInfo[] getVariableInfo(TagData data) {
		VariableInfo vInfo = new VariableInfo(data.getAttributeString("id"),"customtag.DBConnection",true,VariableInfo.AT_BEGIN);
		VariableInfo[] vInfoArray = {vInfo};
		return vInfoArray;
	}
}
