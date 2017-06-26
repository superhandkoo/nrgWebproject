/**
 * 防止js标签注入
 * @param data
 * @returns
 */
function encodeScript(data) {
	if(null == data || "" == data) {
		return "";
	}
	return data.replace("<", "&lt;").replace(">", "&gt;");
}