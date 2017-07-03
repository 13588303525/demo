package com.lei.demo.service;

import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;

import com.lei.demo.entity.Expense;
import com.lei.demo.entity.TravelExpense;
import com.lei.demo.entity.User;

public interface ExpenseService {
    void saveExpense(Expense expense);
    List<Expense> findExpense(String username);
    List<Expense> findByExpenseid(int expenseid);
    List<Expense> findAllExpenses();
    void updateExpense(String approver ,String ispass,int expenseid);
    void modifyExpense(Expense expense);
}
