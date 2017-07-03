package com.lei.demo.controller;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lei.demo.entity.Expense;
import com.lei.demo.entity.Project;
import com.lei.demo.entity.TravelExpense;
import com.lei.demo.entity.User;
import com.lei.demo.service.ProjectService;
import com.lei.demo.service.TravelService;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Iterator;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

@Controller
@RequestMapping("/travelexpense")
public class travelController {
	
    @Autowired
    private TravelService travelService;
    
    @Autowired
    private TravelService TravelService;
       
    @Autowired
    private ProjectService projectService;
    

        
    @RequestMapping(value = "/see", method = RequestMethod.GET)
    public String saveUser( Model model, HttpServletRequest request) {
    	User user=(User)request.getSession().getAttribute("user");   	
        List<TravelExpense> travelexpense1=TravelService.findTravelExpense(user.getUserName());
        model.addAttribute("travelexpense", travelexpense1);
   	 	List<Project> project1=projectService.findlProject(user.getUserName());
   	 	request.getSession().setAttribute("projectlist", project1);
        return "travelexpense";
    }
    
    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public String saveUser( Model model, TravelExpense travelexpense,HttpServletRequest request) {
    	
        //得到上传文件的保存目录，将上传的文件存放于WEB-INF目录下，不允许外界直接访问，保证上传文件的安全
//      String savePath = request.getServletContext().getRealPath("/WEB-INF/upload");
    	String savePath ="C:/Users/Administrator/Desktop/备份/demo/src/main/webapp/image";
      String allPath;	
      File file = new File(savePath);
      //判断上传文件的保存目录是否存在
      if (!file.exists() && !file.isDirectory()) {
          System.out.println(savePath+"目录不存在，需要创建");
          //创建目录
          file.mkdir();
      }
      //消息提示
      String message = "";
      try{
          //使用Apache文件上传组件处理文件上传步骤：
          //1、创建一个DiskFileItemFactory工厂
          DiskFileItemFactory factory = new DiskFileItemFactory();
           //2、创建一个文件上传解析器
           ServletFileUpload upload = new ServletFileUpload(factory);
            //解决上传文件名的中文乱码
           upload.setHeaderEncoding("UTF-8"); 
           //3、判断提交上来的数据是否是上传表单的数据

           //4、使用ServletFileUpload解析器解析上传数据，解析结果返回的是一个List<FileItem>集合，每一个FileItem对应一个Form表单的输入项
           List<FileItem> list = upload.parseRequest(request);
           int i=0;
           for(FileItem item : list){
        	   i++;
               //如果fileitem中封装的是普通输入项的数据
               if(item.isFormField()){
                   String name = item.getFieldName();
                   //解决普通输入项的数据的中文乱码问题
                   String value = item.getString("UTF-8");
                   //value = new String(value.getBytes("iso8859-1"),"UTF-8");
                  System.out.println(name + "=" + value);
                  if(i==1){
                	travelexpense.setPartment(value);
                  }
                  else if(i==2){
                	travelexpense.setTravellername(value);		  
                  }
                  else if(i==3){
                		  travelexpense.setTravellertitle(value);		 
                  }
                  else if(i==4){
            		  travelexpense.setProjectid(Integer.valueOf(value));		
                  }	 
                  else if(i==5){
            		  travelexpense.setTravelreason(value);
                  }
                  else if(i==6){
            		  travelexpense.setNumber(Integer.valueOf(value));
                  }  
                  else if(i==7){
            		  travelexpense.setTravelplace(value);
                  }		  
                  else if(i==8){
            		  travelexpense.setTravelbegin(value);
                  }		 
                  else if(i==9){
            		   travelexpense.setTravelfinish(value);
                  }		 
                  else if(i==10){
            		  travelexpense.setPlane(Integer.valueOf(value));	
                  }	
                  else if(i==11){
            		  travelexpense.setTrain(Integer.valueOf(value));	
                  }	
                  else if(i==12){
            		  travelexpense.setOthertraffic(Integer.valueOf(value));	
                  }		
                  else if(i==13){
                	  travelexpense.setAllowance(Integer.valueOf(value));
                  }
                  else if(i==14){
            		  travelexpense.setPublicfees(Integer.valueOf(value)); 
                  }	  
  
                  else if(i==15){
            		  travelexpense.setHotelexpense(Integer.valueOf(value));
                  }              			  
                  else if(i==16){
            		  travelexpense.setOtherfees(Integer.valueOf(value));
                  }		 
                  else if(i==17){
            		  travelexpense.setTeacherid(value);	
                  }
                  else if(i==18){
            		  travelexpense.setCardname(value);
                  }		 	  
                  else if(i==19){
            		  travelexpense.setCardamount(Integer.valueOf(value));	
                  }		  
                  else if(i==20){
            		  travelexpense.setCardid(value);
                  }	  	 
                  else if(i==22){
            		  travelexpense.setOperatedate(value);	
                  }	
                  else if(i==23){
                	  travelexpense.setOperator(value);
                  }
              }
               else{//如果fileitem中封装的是上传文件
                  //得到上传的文件名称，
                  String filename = item.getName();
                  System.out.println(filename);
                  if(filename==null || filename.trim().equals("")){
                      continue;
                  }
                    //注意：不同的浏览器提交的文件名是不一样的，有些浏览器提交上来的文件名是带有路径的，如：  c:\a\b\1.txt，而有些只是单纯的文件名，如：1.txt
                    //处理获取到的上传文件的文件名的路径部分，只保留文件名部分
                    filename = filename.substring(filename.lastIndexOf("\\")+1);
                  //获取item中的上传文件的输入流
                  InputStream in = item.getInputStream();
                  //创建一个文件输出流
                  FileOutputStream out = new FileOutputStream(savePath + "\\" + filename);
                    //创建一个缓冲区
                    byte buffer[] = new byte[1024];
                   //判断输入流中的数据是否已经读完的标识
                    int len = 0;
                    //循环将输入流读入到缓冲区当中，(len=in.read(buffer))>0就表示in里面还有数据
                    while((len=in.read(buffer))>0){
                        //使用FileOutputStream输出流将缓冲区的数据写入到指定的目录(savePath + "\\" + filename)当中
                      out.write(buffer, 0, len);
                  } 
                   allPath=savePath + "\\" + filename;
                   travelexpense.setFilename(filename);
                   travelexpense.setPath(allPath);
                  //关闭输入流
                  in.close();
                  //关闭输出流
                  out.close();
                  //删除处理文件上传时生成的临时文件
                  item.delete();
                  message = "文件上传成功！";
                  
              }
          }
      }catch (Exception e) {
          message= "文件上传失败！";
          e.printStackTrace();
          
      }    	
    	travelService.saveTravelExpense(travelexpense);
    	User user=(User)request.getSession().getAttribute("user");   	
        List<TravelExpense> travelexpense1=TravelService.findTravelExpense(user.getUserName());
        model.addAttribute("travelexpense", travelexpense1);
        return "travelexpense";
    }
   
            	

    
    @RequestMapping(value = "/getTravelExpense", method = RequestMethod.GET)
    public List<TravelExpense> getTravel(User user) {
        List<TravelExpense> travelexpense = travelService.findTravelExpense(user.getUserName());        
        return travelexpense;
    }
    
    @RequestMapping(value = "/look/{travelid}", method = RequestMethod.GET)
    public String getTravel(@PathVariable Integer travelid,HttpServletRequest request) {
    	List<TravelExpense> travelexpensedetails = travelService.findByTravelid(travelid);  	
    	TravelExpense travelexpensedetail =travelexpensedetails.get(0);
        request.getSession().setAttribute("travelexpensedetail", travelexpensedetail);
        return "looktravel";
    }
    
    @RequestMapping(value = "/checkdetail/{travelid}", method = RequestMethod.GET)
    public String getcheckTravel(@PathVariable Integer travelid,HttpServletRequest request) {
    	List<TravelExpense> travelexpensedetails = travelService.findByTravelid(travelid);  	
    	TravelExpense travelexpensedetail =travelexpensedetails.get(0);
        request.getSession().setAttribute("travelexpensedetail", travelexpensedetail);
        int projectid=travelexpensedetail.getProjectid();
        List<Project> projectdetails=projectService.findByProjectid(projectid);
        Project projectdetail =projectdetails.get(0);
        request.getSession().setAttribute("projectdetail", projectdetail);
        return "check_travelexpense";
    }
      
    @RequestMapping(value = "/check", method = RequestMethod.GET)
    public String getallTravel( Model model, HttpServletRequest request) {  	
        List<TravelExpense> travelexpense1=TravelService.findAllTravelExpensenses();
        model.addAttribute("travelexpense", travelexpense1);
        return "admin_travelexpense";
    }
    
    @RequestMapping(value = "/edit", method = RequestMethod.POST)
    public String editTravel( Model model,TravelExpense travelexpense, HttpServletRequest request) {  	 
    	travelexpense.setIspass("待审核");
    	TravelService.modifyTravelExpense(travelexpense);
    	User user=(User)request.getSession().getAttribute("user");   	
        List<TravelExpense> travelexpense1=TravelService.findTravelExpense(user.getUserName());
        model.addAttribute("travelexpense", travelexpense1);
        return "travelexpense";
    }
    
    @RequestMapping(value = "/ispass",method = RequestMethod.POST)
    public String passExpense( Model model, TravelExpense travelexpense,HttpServletRequest request) {
    	int travelid = travelexpense.getTravelid() ; 
    	User user=(User)request.getSession().getAttribute("user"); 
    	String approver=user.getUserName();   	
    	String ispass="审核通过";
    	TravelService.updateTravelExpense(approver ,ispass,travelid);
    	int projectid=travelexpense.getProjectid();
    	int fare=travelexpense.getMoney();
    	projectService.addUsedexpense(fare, projectid);
        List<TravelExpense> travelexpense1=TravelService.findAllTravelExpensenses();
        model.addAttribute("travelexpense", travelexpense1);
        return "admin_travelexpense";
    }
    
    @RequestMapping(value = "/notpass", method = RequestMethod.POST)
    public String notpassExpense( Model model, TravelExpense travelexpense,HttpServletRequest request) {
    	User user=(User)request.getSession().getAttribute("user"); 
    	String approver=user.getUserName();
    	int travelid = travelexpense.getTravelid();    	
    	String ispass="审核未通过";
    	TravelService.updateTravelExpense(approver,ispass,travelid);
        List<TravelExpense> travelexpense1=TravelService.findAllTravelExpensenses();
        model.addAttribute("travelexpense", travelexpense1);
        return "admin_travelexpense";
    } 
}
