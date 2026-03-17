package com.example;

import org.springframework.stereotype.Service;

@Service
public class BankService {

        public String process() {
             BankAccount account = new BankAccount();
             account.createAccount("Vishal");
             account.deposit(5000);
             return "Balance processed";
     }
}
