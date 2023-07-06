package com.patrick.saveTravels.repository;

import com.patrick.saveTravels.models.Expense;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ExpenseRepository extends JpaRepository<Expense, Long> {
}