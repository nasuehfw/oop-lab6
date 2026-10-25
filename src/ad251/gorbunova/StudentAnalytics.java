/*
 * Copyright (c) 2026. Anastasiia Gorbunova
 * National University "Odesa Polytechnic"
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://apache.org
 */
package ad251.gorbunova;

import java.util.Random;

/**
 * Клас-сервіс для обробки та аналізу оцінок студентів групи.
 * Реалізує алгоритми пошуку екстремумів, середнього балу та
 * фільтрації для одновимірних масивів цілих чисел (int[]).
 * 
 * @author Анастасія Горбунова
 * @version 5.0 25 Oct 2026
 */
public class StudentAnalytics {

    /**
     * Запускає повний цикл аналізу результатів тестування студентів
     * та формує CLI-таблицю фіксованої ширини (116 символів).
     */
    public void runAnalysis() {
        System.out.print("--- 1. Демонстрація загального завдання (Результати тестування) ---\n");
        String tableSeparator = "+" + "-".repeat(112) + "+";
        
        int N = 10;
        int[] scores = new int[N];
        Random rand = new Random();

        // Заповнення масиву оцінками від 0 до 100
        for (int i = 0; i < N; i++) {
            scores[i] = rand.nextInt(101);
        }

        // Виведення початкового стану масиву
        System.out.print("Оцінки групи (початковий масив):\n[ ");
        for (int i = 0; i < scores.length; i++) {
            System.out.print(scores[i]);
            if (i < scores.length - 1) {
                System.out.print(", ");
            }
        }
        System.out.print(" ]\n\n");

        // Алгоритмічний пошук показників успішності
        int max = scores[0];
        int min = scores[0];
        int sum = 0;
        
        for (int score : scores) {
            sum += score;
            if (score > max) {
                max = score;
            }
            if (score < min) {
                min = score;
            }
        }
        
        double average = (double) sum / N;

        int aboveAverageCount = 0;
        for (int score : scores) {
            if (score > average) {
                aboveAverageCount++;
            }
        }

        boolean hasPerfectScore = false;
        for (int score : scores) {
            if (score == 100) {
                hasPerfectScore = true;
                break;
            }
        }

        // Побудова таблиці результатів загальної практичної частини
        System.out.println(tableSeparator);
        System.out.printf("| %-22s | %-14s | %-68s |%n", 
                "Параметр групи", "Значення", "Опис розрахунку метрики успішності");
        System.out.println(tableSeparator);
        
        System.out.printf("| %-22s | %-14s | %-68s |%n", 
                "Найвищий бал", max, "Максимальна оцінка серед студентів групи");
        
        System.out.printf("| %-22s | %-14s | %-68s |%n", 
                "Найнижчий бал", min, "Мінімальна оцінка серед студентів групи");
        
        System.out.printf("| %-22s | %-14s | %-68s |%n", 
                "Середній бал", average, "Середнє арифметичне значення по групі");
        
        System.out.printf("| %-22s | %-14s | %-68s |%n", 
                "Вище середнього", aboveAverageCount, "Кількість студентів, що перевищили середній бал");
        
        System.out.printf("| %-22s | %-14s | %-68s |%n", 
                "Ідеальний бал (100)", (hasPerfectScore ? "Є студент(и)" : "Немає"), 
                "Перевірка наявності хоча б одного максимального результату");
        
        System.out.println(tableSeparator);
    }
}
