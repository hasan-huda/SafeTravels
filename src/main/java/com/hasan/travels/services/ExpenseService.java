package com.hasan.travels.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.hasan.travels.models.Expense;
import com.hasan.travels.repositories.ExpenseRepository;

@Service
public class ExpenseService {
	private final ExpenseRepository expenseRepository;
	
	public ExpenseService(ExpenseRepository expenseRepository) {
		this.expenseRepository=expenseRepository;
	}
	public Expense createExpense(Expense e) {
		return expenseRepository.save(e);
	}
	public List<Expense> allExpenses(){
		return expenseRepository.findAll();
	}
	public Expense oneExpense(Long id) {
		Optional<Expense> optionalExpense = expenseRepository.findById(id);
        if(optionalExpense.isPresent()) {
            return optionalExpense.get();
        } else {
            return null;
        }
	}
	public Expense updateExpense(Expense e) {
		return expenseRepository.save(e);
	}
	public void deleteExpense(Long id) {
		this.expenseRepository.deleteById(id);;
	}
}
