package com.example;

public class BankAccount {
	    private String accountHolder;
	        private double balance;

		    public void createAccount(String name) {
			            this.accountHolder = name;
				            this.balance = 0.0;
					            System.out.println("Account created for: " + name);
						        }

		        public void deposit(double amount) {
				        this.balance += amount;
					        System.out.println("Deposited: " + amount);
						    }

			    public double getBalance() {
				            System.out.println("Balance: " + balance);
					            return balance;
						        }
}
