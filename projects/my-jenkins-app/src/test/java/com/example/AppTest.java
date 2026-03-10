package com.example;

import junit.framework.TestCase;

public class AppTest extends TestCase {

        private BankAccount account;

            protected void setUp() {
                        account = new BankAccount();
                                account.createAccount("Vishal");
                                    }

                public void testCreateAccount() {
                            assertNotNull(account);
                                }

                    public void testInitialBalance() {
                                assertEquals(0.0, account.getBalance());
                                    }

                        public void testDeposit() {
                                    account.deposit(5000);
                                            assertEquals(5000.0, account.getBalance());
                                                }

                            public void testMultipleDeposits() {
                                        account.deposit(3000);
                                                account.deposit(2000);
                                                        assertEquals(5000.0, account.getBalance());
                                                            }
}
