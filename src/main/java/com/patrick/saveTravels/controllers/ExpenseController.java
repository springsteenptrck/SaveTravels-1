package com.patrick.saveTravels.controllers;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.server.ResponseStatusException;

import com.patrick.saveTravels.models.Expense;
import com.patrick.saveTravels.repository.ExpenseRepository;

import jakarta.validation.Valid;

@Controller
@RequestMapping({"", "/", "/expenses"})
public class ExpenseController {
    private final ExpenseRepository expenseRepository;

    public ExpenseController(ExpenseRepository expenseRepository) {
        this.expenseRepository = expenseRepository;
    }

    @GetMapping({"", "/", "/index"})
    public String showIndex(Model model) {
        List<Expense> expenses = expenseRepository.findAll();
        model.addAttribute("expenses", expenses);
        model.addAttribute("expense", new Expense()); 
        return "index.jsp";
    }

    @GetMapping("/add")
    public String showAddExpenseForm(Model model) {
        model.addAttribute("expense", new Expense());
        return "index.jsp";
    }

    @PostMapping("/add")
    public String addExpense(
            @Valid @ModelAttribute("expense") Expense expense,
            BindingResult result,
            Model model) {
        
        if (result.hasErrors()) {
            List<Expense> expenses = expenseRepository.findAll();
            model.addAttribute("expenses", expenses);
            return "index.jsp";
        }

        expenseRepository.save(expense);

        return "redirect:/expenses/index";
    }


    @GetMapping("/edit/{id}")
    public String showEditExpenseForm(@PathVariable Long id, Model model) {
        Expense expense = expenseRepository.findById(id)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Expense not found with id: " + id));
        model.addAttribute("expense", expense);
        return "editExpense.jsp";
    }

    @PostMapping("/update/{id}")
    public String updateExpense(@PathVariable Long id, @Valid @ModelAttribute("expense") Expense updatedExpense, BindingResult result, Model model) {
        if (result.hasErrors()) {
            List<Expense> expenses = expenseRepository.findAll();
            model.addAttribute("expenses", expenses);
            return "editExpense.jsp";
        }

        Expense expense = expenseRepository.findById(id)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Expense not found with id: " + id));
        expense.setName(updatedExpense.getName());
        expense.setVendor(updatedExpense.getVendor());
        expense.setAmount(updatedExpense.getAmount());
        expense.setDescription(updatedExpense.getDescription());
        expenseRepository.save(expense);
        return "redirect:/expenses/index";
    }
    	
    @GetMapping("/delete/{id}")
    public String deleteExpense(@PathVariable Long id) {
        Expense expense = expenseRepository.findById(id)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Expense not found with id: " + id));
        
        expenseRepository.delete(expense);
        
        return "redirect:/expenses/index";
    }
    
    @GetMapping("/details/{id}")
    public String showExpenseDetails(@PathVariable Long id, Model model) {
        Expense expense = expenseRepository.findById(id)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Expense not found with id: " + id));
        model.addAttribute("expense", expense);
        return "expenseDetails.jsp";
    }
}
