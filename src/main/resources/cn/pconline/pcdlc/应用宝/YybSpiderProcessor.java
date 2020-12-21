package cn.pconline.pcdlc.spider.task.android.shop.yyb;

import cn.pconline.framework.spider.base.BasePageProcessor;
import cn.pconline.framework.spider.util.StringUtils;
import cn.pconline.pcdlc.spider.util.DateUtils;
import cn.pconline.pcdlc.spider.util.SpiderConstant;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import us.codecraft.webmagic.Page;

import java.util.ArrayList;
import java.util.List;

/**
 * 应用宝爬虫处理器
 * 
 * @author zhangguangwen
 */
public class YybSpiderProcessor extends BasePageProcessor {

	public final static String siteDomain = "sj.qq.com";
	public final static String wapSiteDomain = "a.app.qq.com";

	/**
	 * 获取应用宝软件终端页url的软件信息模板1
	 * 
	 * @param page
	 */
	private void getYybSoftInformationMode1(Page page) {
		String seoTitle = "XXX下载_XXX手机版下载「安卓版」-太平洋下载中心";
		String seoKeyword = "XXX,XXX下载,XXX手机版";
		String softName = page.getHtml().xpath("//div[@class='det-name-int']/text()").get();
		String fromSmallType = page.getHtml().xpath("//a[@class='det-type-link']/text()").get();// ??????
		Element element = null;
		Document doc = Jsoup.parse(page.getHtml().get());
		Element e = doc.getElementsByClass("det-main-container").first();
		if (e == null) {
			String url = page.getUrl().get();
			String packageName = url.substring(url.indexOf("=")+1, url.length());
			page.putField("packageName",packageName );
			page.putField("isDown", 1);// 标记为已下架
			return;
		}
		element = e.getElementById("J_DetAppDataInfo");
		// 更新内容 6．“应用信息”内的“更新内容”需要修改为统一的样式：名称+版本号+更新日志；
		Elements els = null;
		els = element.getElementsByClass("det-app-data-info");
		
		if (els.isEmpty()) {
			String url = page.getUrl().get();
			String packageName =url.substring(url.indexOf("=")+1, url.length());
			page.putField("packageName",packageName );
			page.putField("isDown", 1);// 标记为已下架
			return;
		}
		String description = "";
		String updateRemark = "";
			if (els != null) {
				if (els.size() > 1) {
					description = els.get(0).html();
					updateRemark = els.get(1).html();
				} else {
					updateRemark = els.get(0).html();
				}
			}
		description = description.isEmpty() ? "" : replaceString(description);
		updateRemark = updateRemark.isEmpty() ? "" : replaceString(updateRemark);
		
		//System.out.println("描述："+description);
		//System.out.println("更新："+updateRemark);
		// 去掉更新日志里版本的V
		updateRemark = updateRemark.replaceAll("V", "");
		// 简介套模板
		String intro = getIntroByType( softName, description);
		String version = page.getHtml().xpath("//div[@class='det-othinfo-data']/text()").get();
		if (version != null) {
			version = version.replace("V", "");
		}
		page.putField("name", softName);
		page.putField("alias", softName);
		page.putField("logo", page.getHtml().xpath("//div[@class='det-icon']/img/@src").get());
		page.putField("fileSize", page.getHtml().xpath("//div[@class='det-size']/text()").get());
		page.putField("version", version);
		page.putField("publisher", getPublisher(page));
		page.putField("apkDownloadUrl", page.getHtml().xpath("//a[@class='det-down-btn']/@data-apkUrl").get());
		page.putField("seoTitle", seoTitle.replaceAll("XXX", softName));
		page.putField("fromSmallType", fromSmallType);
		page.putField("smallType", yybType2PcType(fromSmallType));
		page.putField("packageName", page.getHtml().xpath("//a[@class='det-ins-btn']/@apk").get());
		page.putField("pic", getPics(page));
		page.putField("sourceUrl", page.getUrl().get());
		page.putField("appUpdateDate", getAppUpdateDate(page));
		page.putField("seoKeyword", seoKeyword.replaceAll("XXX", softName));
		page.putField("intro", intro);
		page.putField("updateRemark", updateRemark);
		page.putField("description", description);
		page.putField("siteType", SpiderConstant.DL_FROM_ANDROID_YYB);
	}
}
