package com.hasan.travels.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hasan.travels.models.Expense;
import com.hasan.travels.services.ExpenseService;

@Controller
public class ExpenseController {
	@Autowired
	ExpenseService expenseService;
	
	@RequestMapping("/")
	public String red() {
		return "redirect:/expenses";
	}
	@RequestMapping("/expenses")
	public String index(Model model,@ModelAttribute("expense") Expense expense) {
		List<Expense> expenses =expenseService.allExpenses();
		model.addAttribute("expenses", expenses);
		return "index.jsp";
	}
	@PostMapping("/expenses")
	public String create(
			Model model,
			@Valid @ModelAttribute("expense") Expense expense,
			BindingResult result
			) {
		if(result.hasErrors()) {
			List<Expense> expenses =expenseService.allExpenses();
			model.addAttribute("expenses", expenses);
			return "index.jsp";
		} else {
			expenseService.createExpense(expense);
			return "redirect:/expenses";
		}
	}
	@RequestMapping("/expenses/{id}/edit")
	public String edit(@PathVariable("id")Long id, Model model) {
		Expense expense = expenseService.oneExpense(id);
		model.addAttribute("expense", expense);
		return "edit.jsp";
	}
	@RequestMapping(value="/expenses/{id}", method=RequestMethod.PUT)
	public String update(
			@Valid @ModelAttribute("expense") Expense expense,
			BindingResult result
			) {
		if(result.hasErrors()) {
			return "edit.jsp";
		} else {
			expenseService.updateExpense(expense);
			return "redirect:/expenses";
		}
	}
	@RequestMapping(value="/expenses/{id}", method=RequestMethod.DELETE)
	public String destroy(@PathVariable("id") Long id) {
		expenseService.deleteExpense(id);
		return "redirect:/expenses";
	}
	@RequestMapping("/expenses/{id}")
	public String display(@PathVariable("id") Long id,Model model) {
		Expense expense = expenseService.oneExpense(id);
		model.addAttribute("expense", expense);
		return "show.jsp";
	}
}
