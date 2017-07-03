package com.lei.demo.service;

import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;

import com.lei.demo.entity.TravelExpense;
import com.lei.demo.entity.User;

public interface TravelService {
    void saveTravelExpense(TravelExpense travelexpense);
    List<TravelExpense> findTravelExpense(String username);
    List<TravelExpense> findByTravelid(int travelid);
    List<TravelExpense> findAllTravelExpensenses();
    void updateTravelExpense(String approver ,String ispass,int travelid);
    void modifyTravelExpense(TravelExpense travelexpense);
}
