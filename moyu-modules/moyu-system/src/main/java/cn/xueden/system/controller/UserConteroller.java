package cn.xueden.system.controller;


import cn.xueden.common.core.constant.Constants;
import cn.xueden.common.core.domain.R;
import cn.xueden.common.core.utils.LayerData;
import cn.xueden.common.core.utils.RestResponse;
import cn.xueden.common.core.utils.ToolUtil;
import cn.xueden.common.core.utils.XudenStringUtils;
import cn.xueden.common.core.web.domain.SysMenu;
import cn.xueden.common.core.web.domain.SysRole;
import cn.xueden.common.core.web.domain.SysUser;
import cn.xueden.common.redis.utils.CacheUtils;

import cn.xueden.common.security.utils.SecurityUtils;
import cn.xueden.system.api.model.LoginUser;
import cn.xueden.system.entity.vo.ShowMenu;
import cn.xueden.system.service.UserService;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.google.common.collect.Maps;
import com.google.common.collect.Sets;
import org.apache.commons.lang3.StringUtils;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.util.WebUtils;

import javax.servlet.ServletRequest;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**功能描述:用户信息 前端控制器
 * @Auther:http://www.xueden.cn
 * @Date:2020/2/24
 * @Description:cn.xueden.modules.system.controller
 * @version:1.0
 */
@RestController
@RequestMapping("system/user")
public class UserConteroller extends BaseController {

    @Autowired
    protected UserService userService;

    /**
     * 获取当前用户信息,主要用于微服务之间的调用
     */
    @GetMapping("/info/{username}")
    public R<LoginUser> info(@PathVariable("username") String username){
        // 根据用户名获取用户信息
        SysUser sysUser = userService.findUserByLoginName(username);
        if (XudenStringUtils.isNull(sysUser)){
            return R.fail("用户名或密码错误");
        }
        // 角色集合
        //Set<String> roles = permissionService.getRolePermission(sysUser.getUserId());
        Set<SysRole> roles = sysUser.getRoleLists();
        Set<String> roleNames = Sets.newHashSet();
        for(SysRole role:roles){
            if(XudenStringUtils.isNotBlank(role.getName())){
                roleNames.add(role.getName());
            }
        }
        // 权限集合
        Set<SysMenu> menus = sysUser.getMenus();
        Set<String> permissions = Sets.newHashSet();
        for (SysMenu menu:menus){
            if(org.apache.commons.lang.StringUtils.isNotBlank(menu.getPermission())){
                permissions.add(menu.getPermission());
            }
        }
        //Set<String> permissions = permissionService.getMenuPermission(sysUser.getUserId());
        LoginUser sysUserVo = new LoginUser();
        sysUserVo.setSysUser(sysUser);
        sysUserVo.setRoles(roleNames);
        sysUserVo.setPermissions(permissions);
        return R.ok(sysUserVo);
    }

    /**
     * 功能描述：获取用户所拥有的菜单列表
     * @return
     */
    @RequestMapping("/getUserMenu")
    public RestResponse getUserMenu(){
       Long userId = SecurityUtils.getUserId();
       List<ShowMenu> list = menuService.getShowMenuByUser(userId);
       return RestResponse.success().setData(list);
    }

    /**
     * 功能描述：获取用户列表
     * @param page
     * @param limit
     * @param request
     * @return
     */
    /*@RequiresPermissions("sys:user:list")*/
    @RequestMapping("list")
    public LayerData<SysUser> list(@RequestParam(value = "page",defaultValue = "1")Integer page,
                                   @RequestParam(value = "limit",defaultValue = "10")Integer limit,
                                   ServletRequest request){

        Map map = WebUtils.getParametersStartingWith(request,"s_");
        LayerData<SysUser> userLayerData = new LayerData<>();
        EntityWrapper<SysUser> userEntityWrapper = new EntityWrapper();
        if(!map.isEmpty()){
            String keys = (String)map.get("key");
            if(StringUtils.isNotBlank(keys)){
                userEntityWrapper.like("login_name",keys).or().like("tel", keys).or().like("email", keys);
            }
        }

        Page<SysUser> userPage = userService.selectPage(new Page<>(page,limit),userEntityWrapper);
        userLayerData.setCount(userPage.getTotal());
        userLayerData.setData(userPage.getRecords());
        return userLayerData;
    }

    /**
     * 功能描述：获取所有角色列表
     * @return
     */
    @GetMapping("getAllRoles")
    public RestResponse getAllRoles(){
        List<SysRole> roleList = roleService.selectAll();
        return RestResponse.success().setData(roleList);
    }

    /**
     * 功能描述：添加用户信息
     * @param user
     * @return
     */
    /*@RequiresPermissions("sys:user:add")*/
    @PostMapping("add")
    public RestResponse add(@RequestBody SysUser user){
        if(StringUtils.isBlank(user.getLoginName())){
            return RestResponse.failure("登录名不能为空");
        }

        if(user.getRoleLists()==null||user.getRoleLists().size()==0){
            return  RestResponse.failure("用户角色至少选择一个");
        }

        if(userService.userCount(user.getLoginName())>0){
            return RestResponse.failure("登录名称已经存在");
        }

        if(StringUtils.isNotBlank(user.getEmail())){
            if(userService.userCount(user.getEmail())>0){
                return RestResponse.failure("该邮箱已被使用");
            }
        }

        if(StringUtils.isNoneBlank(user.getTel())){
            if(userService.userCount(user.getTel())>0){
                return RestResponse.failure("该手机号已被绑定");
            }
        }

        user.setPassword(Constants.DEFAULT_PASSWORD);
        userService.saveUser(user);
        if(user.getId() == null || user.getId() == 0){
            return RestResponse.failure("保存用户信息出错");
        }

        //保存用户角色关系
        userService.saveUserRoles(user.getId(),user.getRoleLists());
        return RestResponse.success();

    }

    /**
     * 功能描述：根据用户id获取角色
     * @param id
     * @return
     */
    @GetMapping("getRolesByUser")
    public RestResponse getRolesByUser(Long id){
        SysUser user = userService.findUserById(id);
        StringBuffer roleIds = new StringBuffer();
        if(user!=null){
            Set<SysRole> roleSet = user.getRoleLists();
            if (roleSet != null && roleSet.size() > 0) {
                for (SysRole r : roleSet) {
                    roleIds.append(r.getId().toString()).append(",");
                }
            }
        }

        List<SysRole> roleList = roleService.selectAll();
        Map<String,Object> resultMap = Maps.newHashMap();
        resultMap.put("roleIds",roleIds);
        resultMap.put("roleList",roleList);
        return RestResponse.success().setData(resultMap);

    }

    /**
     * 功能描述：更新用户信息
     * @param user
     * @return
     */
    /*@RequiresPermissions("sys:user:edit")*/
    @PostMapping("edit")
    public RestResponse edit(@RequestBody SysUser user){
        if(user.getId() == 0 || user.getId() == null){
            return RestResponse.failure("用户ID不能为空");
        }

        if(StringUtils.isBlank(user.getLoginName())){
            return RestResponse.failure("登录名不能为空");
        }

        if(user.getRoleLists() == null || user.getRoleLists().size() == 0){
            return  RestResponse.failure("用户角色至少选择一个");
        }

        SysUser oldUser = userService.findUserById(user.getId());
        if(StringUtils.isNotBlank(user.getEmail())){
            if(!user.getEmail().equals(oldUser.getEmail())){
                if(userService.userCount(user.getEmail())>0){
                    return RestResponse.failure("该邮箱已被使用");
                }
            }
        }

        if(StringUtils.isNotBlank(user.getLoginName())){
            if(!user.getLoginName().equals(oldUser.getLoginName())) {
                if (userService.userCount(user.getLoginName()) > 0) {
                    return RestResponse.failure("该登录名已存在");
                }
            }
        }

        if(StringUtils.isNotBlank(user.getTel())){
            if(!user.getTel().equals(oldUser.getTel())) {
                if (userService.userCount(user.getTel()) > 0) {
                    return RestResponse.failure("该手机号已经被绑定");
                }
            }
        }

        userService.updateUser(user);
        //先解除用户跟角色的关系
        userService.dropUserRolesByUserId(user.getId());
        if(user.getId() == null || user.getId() == 0){
            return RestResponse.failure("保存用户信息出错");
        }

        userService.saveUserRoles(user.getId(),user.getRoleLists());
        return RestResponse.success();

    }

    /**
     * 功能描述：删除用户信息（单条记录）
     * @param id
     * @return
     */
   /* @RequiresPermissions("sys:user:delete")*/
    @PostMapping("delete")
    public RestResponse delete(@RequestParam(value = "id",required = false)Long id){

        if(id==null|| id==0||id==1){
            return RestResponse.failure("参数错误");
        }

        SysUser user = userService.findUserById(id);

        if(user==null){
            return RestResponse.failure("用户不存在");

        }

        userService.deleteUser(user);
        return RestResponse.success();
    }

    /**
     * 功能描述：批量删除用户数据
     * @param users
     * @return
     */
    /*@RequiresPermissions("sys:user:delete")*/
    @PostMapping("deleteSome")
    public RestResponse deleteSome(@RequestBody List<SysUser> users){
        if(users == null || users.size()==0){
            return RestResponse.failure("请选择需要删除的用户");
        }

        for (SysUser u :users){
            if(u.getId()==1){
                return RestResponse.failure("不能删除超级管理员");
            }else {
                userService.deleteUser(u);
            }
        }
        return RestResponse.success();
    }

    /**
     * 功能描述：修改用户密码
     * @param oldPwd
     * @param newPwd
     * @param confirmPwd
     * @return
     */
   /* @RequiresPermissions("sys:user:changePassword")*/
    @PostMapping("changePassword")
    public RestResponse changePassword(@RequestParam(value = "oldPwd",required = false)String oldPwd,
                                       @RequestParam(value = "newPwd",required = false)String newPwd,
                                       @RequestParam(value = "confirmPwd",required = false)String confirmPwd){

        if(StringUtils.isBlank(oldPwd)){
            return RestResponse.failure("旧密码不能为空");
        }

        if(StringUtils.isBlank(newPwd)){
            return RestResponse.failure("新密码不能为空");
        }

        if(StringUtils.isBlank(confirmPwd)){
            return RestResponse.failure("确认密码不能为空");
        }

        if(!confirmPwd.equals(newPwd)){
            return RestResponse.failure("两次输入密码不一致");
        }

        // 暂时这样写
        SysUser user = userService.findUserById(1l);

        //输入的旧密码是否正确
        String pw = ToolUtil.entryptPassword(oldPwd,user.getSalt()).split(",")[0];
        if(!user.getPassword().equals(pw)){
            return RestResponse.failure("旧密码错误");
        }

        user.setPassword(newPwd);
        ToolUtil.entryptPassword(user);
        userService.updateUser(user);
        return RestResponse.success();

    }

    /**
     * 功能描述：用户个人信息修改
     * @param user
     * @return
     */
    @PostMapping("saveUserInfo")
    public RestResponse saveUserInfo(SysUser user){



        if (StringUtils.isBlank(user.getLoginName())){
            return RestResponse.failure("登录名不能为空");
        }

        SysUser oldUser = userService.findUserById(user.getId());

        if(StringUtils.isNotBlank(user.getEmail())){
            if(!user.getEmail().equals(oldUser.getEmail())){
                if(userService.userCount(user.getEmail())>0){
                    return RestResponse.failure("该邮箱已经使用");
                }
            }
        }

        if(StringUtils.isNotBlank(user.getTel())){
            if(!user.getTel().equals(oldUser.getTel())){
                if(userService.userCount(user.getTel())>0){
                    return RestResponse.failure("该手机号已经使用");
                }
            }
        }

        userService.updateUser(user);
        return RestResponse.success();

    }

    /**
     * 功能描述：清理用户缓存
     * @return
     */
    @GetMapping("clearUserCache")
    public RestResponse clearUserCache(){
        CacheUtils cacheUtils = new CacheUtils();
        cacheUtils.clearUserCache();
        return RestResponse.success("清理缓存成功").setCode(0);
    }



}
