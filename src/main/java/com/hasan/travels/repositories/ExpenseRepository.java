package com.hasan.travels.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.hasan.travels.models.Expense;

public interface ExpenseRepository extends CrudRepository<Expense, Long>{
	List<Expense> findAll();
}
