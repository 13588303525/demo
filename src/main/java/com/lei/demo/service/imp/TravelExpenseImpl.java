package com.lei.demo.service.imp;
import java.io.OutputStream;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.util.CellRangeAddress;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lei.demo.dao.TravelExpenseDAO;
import com.lei.demo.entity.TravelExpense;
import com.lei.demo.entity.User;
import com.lei.demo.service.TravelService;

@Service("travelService")
@Transactional(readOnly = true)
public class TravelExpenseImpl implements TravelService{
	
	@Autowired
	private TravelExpenseDAO travelexpenseDao;
	
    @Transactional(readOnly = false)
    public void saveTravelExpense(TravelExpense travelexpense) {
    	travelexpenseDao.save(travelexpense);
    }
    
    @Transactional(readOnly = false)
    public List<TravelExpense> findTravelExpense(String username) {
    	return travelexpenseDao.getCurentProject(username);
    	
    }
    
    @Transactional(readOnly = false)
    public List<TravelExpense> findByTravelid(int travelid){
    	return travelexpenseDao.findByTravelid(travelid);
    }
    @Transactional(readOnly = false)
    public List<TravelExpense> findAllTravelExpensenses(){
    	return travelexpenseDao.getAllTravelExpense();
    }
    @Transactional(readOnly = false)
	public void updateTravelExpense(String approver ,String ispass,int travelid) {
		travelexpenseDao.modify_ispass(approver ,ispass, travelid);
		
	}
    @Transactional(readOnly = false)
	public void modifyTravelExpense(TravelExpense travelexpense) {
		travelexpenseDao.update(travelexpense);		
	}
}
