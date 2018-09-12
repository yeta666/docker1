package com.docker1.service;

import com.docker1.mapper.UserMapper;
import com.docker1.pojo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.UUID;

/**
 * @author YETA
 * @date 2018/09/11/16:41
 */
@Service
public class UserService {

    @SuppressWarnings("SpringJavaAutowiringInspection")
    @Autowired
    private UserMapper userMapper;

    public User login(HttpServletRequest request) {
        String ip = request.getRemoteAddr();
        User user = userMapper.findOneByIp(ip);
        if (user == null) {
            String id = UUID.randomUUID().toString();
            if (userMapper.insert(new User(id, ip, 1)) == 1) {
                return userMapper.selectByPrimaryKey(id);
            }
        } else {
            user.setLogintime(user.getLogintime() + 1);
            int result = userMapper.updateByPrimaryKey(user);
            if (result == 1) {
                return user;
            }
        }
        return null;
    }
}
