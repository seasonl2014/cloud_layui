package cn.xueden.system.controller;





import cn.xueden.common.core.utils.AddressUtil;
import cn.xueden.common.core.utils.LayerData;
import cn.xueden.common.core.utils.RestResponse;
import cn.xueden.common.core.utils.ToolUtil;
import cn.xueden.common.core.web.domain.AjaxResult;

import cn.xueden.common.core.web.domain.SysLog;
import cn.xueden.common.log.annotation.XudenSysLog;
import cn.xueden.common.security.annotation.PreAuthorize;
import cn.xueden.system.entity.Log;
import cn.xueden.system.service.LogService;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import org.apache.commons.lang3.StringUtils;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.util.WebUtils;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

/**功能描述:日志 前端控制器
 * @Auther:http://www.xueden.cn
 * @Date:2020/3/6
 * @Description:cn.xueden.modules.system.controller
 * @version:1.0
 */
@RestController
@RequestMapping("system/log")
public class LogController  {

    private ThreadLocal<Long> startTime = new ThreadLocal<>();

    @Autowired
    protected LogService logService;

    private static final Logger LOGGER = LoggerFactory.getLogger(LogController.class);

    @PostMapping(value = "list")
    public LayerData<SysLog> list(@RequestParam(value = "page",defaultValue = "1")Integer page,
                               @RequestParam(value = "limit",defaultValue = "10")Integer limit,
                               ServletRequest request){

        Map map = WebUtils.getParametersStartingWith(request,"s_");
        LayerData<SysLog> layerData = new LayerData<>();
        EntityWrapper<SysLog> wrapper = new EntityWrapper<>();

        if(!map.isEmpty()){
            String keys = (String) map.get("type");
            if(StringUtils.isNotBlank(keys)){
                wrapper.eq("type",keys);
            }

            String title = (String) map.get("title");
            if(StringUtils.isNotBlank(title)){
                wrapper.like("title",title);
            }

            String username = (String) map.get("username");
            if(StringUtils.isNotBlank(username)){
                wrapper.eq("username",username);
            }

            String httpMethod = (String)map.get("method");
            if(StringUtils.isNotBlank(httpMethod)){
                wrapper.eq("http_method",httpMethod);
            }
        }

        Page<SysLog> logPage = logService.selectPage(new Page<>(page,limit),wrapper);
        layerData.setCount(logPage.getTotal());
        layerData.setData(logPage.getRecords());
        return layerData;

    }

    @PreAuthorize(hasPermi = "sys:log:delete")
    @PostMapping("delete")
    public RestResponse delete(@RequestParam("ids[]")List<Long> ids){
        if(ids==null||ids.size()==0){
            RestResponse.failure("请选择要删除的记录");
        }
        logService.deleteBatchIds(ids);
        return RestResponse.success();
    }

    /**
     * 保存日志
     * @param username
     * @param status
     * @param message
     * @return
     */
    @PostMapping
    public AjaxResult add(@RequestParam("username") String username, @RequestParam("status") String status,
                          @RequestParam("message") String message,
                          HttpServletRequest request){
        startTime.set(System.currentTimeMillis());
        SysLog sysLog = new SysLog();
        sysLog.setUsername(username); // 操作用户
        sysLog.setTitle(message); // 说明
        sysLog.setClassMethod(LogController.class.getName());//类名
        sysLog.setHttpMethod(request.getMethod());// 请求方式 get\post\....
        sysLog.setType(ToolUtil.isAjax(request)?"Ajax请求":"普通请求");// 请求类型

        String ip = ToolUtil.getClientIp(request);
        if("0.0.0.0".equals(ip) || "0:0:0:0:0:0:0:1".equals(ip) || "localhost".equals(ip) || "127.0.0.1".equals(ip)){
            ip = "127.0.0.1";
        }

        sysLog.setRemoteAddr(ip);// 获取请求Ip地址
        sysLog.setParams("[username:"+username+",message:"+message+"]");
        //根据Ip地址获取归属地
        if(!"127.0.0.1".equals(ip)){
            String cityAddress = AddressUtil.getCityInfo(ToolUtil.getClientIp(request));
            if(cityAddress!=null&&!cityAddress.equals("内网IP")){
                String addressInfo[] = cityAddress.split("\\|");
                sysLog.setArea(addressInfo[0]+addressInfo[1]);//国家或地区
                sysLog.setProvince(addressInfo[2].replace("省",""));// 省份
                sysLog.setCity(addressInfo[3]=="0"?"未知":addressInfo[3]); //城市
                sysLog.setIsp(addressInfo[4]);//网络服务提供商
            }
        }

        sysLog.setRequestUri(request.getRequestURL().toString()); // 请求路径

        if(request.getSession() != null){ //SessionID
            sysLog.setSessionId(request.getSession() .getId());
        }

        // 获取客户端浏览器
        Map<String,String> browserMap = ToolUtil.getOsAndBrowserInfo(request);
        sysLog.setBrowser(browserMap.get("os")+"-"+browserMap.get("browser"));

        // 请求耗时
        sysLog.setUseTime(System.currentTimeMillis() - startTime.get());

        // 返回结果集
        AjaxResult ajaxResult = toAjax(logService.insert(sysLog)?1:0);


        return ajaxResult;
    }

    /**
     * 响应返回结果
     *
     * @param rows 影响行数
     * @return 操作结果
     */
    protected AjaxResult toAjax(int rows)
    {
        return rows > 0 ? AjaxResult.success() : AjaxResult.error();
    }

}
