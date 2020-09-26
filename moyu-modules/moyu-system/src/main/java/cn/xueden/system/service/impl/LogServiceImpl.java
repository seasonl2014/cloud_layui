package cn.xueden.system.service.impl;


import cn.xueden.system.dao.LogDao;
import cn.xueden.system.entity.Log;
import cn.xueden.system.service.LogService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**功能描述:系统日志 服务实现类
 * @Auther:http://www.xueden.cn
 * @Date:2020/3/6
 * @Description:cn.xueden.modules.system.service.impl
 * @version:1.0
 */
@Service
@Transactional(rollbackFor = Exception.class)
public class LogServiceImpl extends ServiceImpl<LogDao, Log> implements LogService {
}
