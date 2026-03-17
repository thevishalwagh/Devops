package com.example;

public class BankAccount {

        private String name;
            private double balance;

                public void createAccount(String name) {
                            this.name = name;
                                    this.balance = 0.0;
                                            System.out.println("Account created for: " + name);
                                                }

                    public void deposit(double amount) {
                                balance += amount;
                                        System.out.println("Deposited: " + amount);
                                            }

                        public void getBalance() {
                                    System.out.println("Balance: " + balance);
                                        }
}
