package com.lei.demo.service.imp;

import java.io.OutputStream;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.util.CellRangeAddress;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lei.demo.dao.ExpenseDAO;
import com.lei.demo.entity.Expense;
import com.lei.demo.entity.TravelExpense;
import com.lei.demo.entity.User;
import com.lei.demo.service.ExpenseService;

@Service("ExpenseService")
@Transactional(readOnly = true)
public class ExpenseImpl implements ExpenseService{
	
	@Autowired
	private ExpenseDAO expenseDao;
	
    @Transactional(readOnly = false)
    public void saveExpense(Expense expense) {
    	expenseDao.save(expense);
    }
	@Override
	public void updateExpense(String approver ,String ispass,int expenseid) {
		expenseDao.modify_ispass(approver ,ispass, expenseid);
		
	}
    @Transactional(readOnly = false)
    public List<Expense> findExpense(String username) {
    	return expenseDao.getCurentProject(username);
    	
    }
    
    @Transactional(readOnly = false)
    public List<Expense> findByExpenseid(int expense){
    	return expenseDao.findByExpenseid(expense);
    }
    
    @Transactional(readOnly = false)
	public List<Expense> findAllExpenses() {
		return expenseDao.getAllExpense();
	}
    @Transactional(readOnly = false)
	public void modifyExpense(Expense expense) {
		expenseDao.update(expense);		
	}
}