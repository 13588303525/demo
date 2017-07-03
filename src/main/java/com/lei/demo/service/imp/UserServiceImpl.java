package com.lei.demo.service.imp;
import java.io.OutputStream;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.util.CellRangeAddress;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lei.demo.dao.UserDAO;
import com.lei.demo.entity.Project;
import com.lei.demo.entity.User;
import com.lei.demo.service.UserService;


@Service("userService")
@Transactional(readOnly = true)
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDAO userDao;
    
    public User findByID(int id) {
        return userDao.findById(id);
    }
    
    @Transactional(readOnly = false)
    public void saveUser(User user) {
        userDao.save(user);
    }

    @Transactional(readOnly = false)
    public void deleteUser(User user) {
            userDao.delete(user);
    }

    public List<User> findUsers(String user) {
        return userDao.findUsers(user);
    }

	@Override
	public void updateUser(User user) {
		userDao.update(user);		
	}

	@Override
	public void updateUserm(int id,String mname,String mtype) {
		userDao.updatem(id,mname,mtype);		
	}
	
	@Override
	@Transactional(readOnly = false)
	public void deleteUser(String userName) {
		List<User> user=findUsers(userName);
		for (User user2 : user) {
			deleteUser(user2);
		}
		
	}

	@Override
	public User findByUserName(String userName) {
		List<User> user=findUsers(userName);
		if (!user.isEmpty()) {
			return user.get(0);
		}else {
			return null;
		}
	}

	@Override
	public List<User> findAllUsers() {
		return userDao.getAllUser();
	}
	public void modifyPwd(int id,String newpsd){
		userDao.mPwd(id,newpsd);
	}
	public void resetPwd(int id){
		userDao.rPwd(id);
	}
	public HSSFWorkbook Out(List<Project> u){
		//创建HSSFWorkbook对象(excel的文档对象)
	  HSSFWorkbook wb = new HSSFWorkbook();
	//建立新的sheet对象（excel的表单
	  
	HSSFSheet sheet=wb.createSheet("教师报销详情");
	//在sheet里创建第一行，参数为行索引(excel的行)，可以是0～65535之间的任何一个
	HSSFRow row1=sheet.createRow(0);
	
	HSSFCellStyle style = wb.createCellStyle();  
	 
     style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
	//创建单元格（excel的单元格，参数为列索引，可以是0～255之间的任何一个
	HSSFCell cell=row1.createCell(0);
	      //设置单元格内容
	cell.setCellValue("所有教师总览");
	//合并单元格CellRangeAddress构造参数依次表示起始行，截至行，起始列， 截至列
	sheet.addMergedRegion(new CellRangeAddress(0,0,0,2));
	//在sheet里创建第二行
		HSSFRow row2=sheet.createRow(1);    
	      //创建单元格并设置单元格内容
	      row2.createCell(0).setCellValue("项目负责人");
	      row2.createCell(1).setCellValue("已报销数");    
	      row2.createCell(2).setCellValue("剩余报销数");

	      //在sheet里创建第三行
	      int j=2;
	      for(int i = 0;i<u.size();i++){
	      HSSFRow row3=sheet.createRow(j);
	      row3.createCell(0).setCellValue(u.get(i).getProjectleader());
	      row3.createCell(1).setCellValue(u.get(i).getUsedexpense());
	     row3.createCell(2).setCellValue(u.get(i).getRestexpense());    
	     // row3.createCell(3).setCellValue(u.get(i).getUser_name());    
	      //row3.createCell(4).setCellValue(u.get(i).getUser_type());    
	      j++;
	      }
	      return wb;
	}
	
}
