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

import java.util.Arrays;
import java.util.Random;

/**
 * Клас-сервіс для обліку та статистичного аналізу ваги фруктів у кошику.
 * Реалізує контракт індивідуального Варіанту №7 за допомогою чистих методів.
 * 
 * @author Анастасія Горбунова
 * @version 5.0 25 Oct 2026
 */
public class FruitAnalytics {

    /**
     * Запускає повний цикл розрахунку метрик для кошика фруктів
     * та генерує фінальну CLI-таблицю (116 символів).
     */
    public void runAnalysis() {
        System.out.print("--- 2. Виконання індивідуального Варіанту №7 (Вага фруктів у кошику) ---\n");
        String tableSeparator = "+" + "-".repeat(112) + "+";
        
        int N = 8;
        double[] weights = new double[N];
        Random rand = new Random();

        // Заповнення випадковими значеннями ваги від 50.0 до 350.0 грамів
        for (int i = 0; i < N; i++) {
            weights[i] = 50.0 + (rand.nextDouble() * 300.0);
        }

        System.out.print("Вміст кошика (початковий масив ваг у грамах):\n[ ");
        for (int i = 0; i < weights.length; i++) {
            System.out.printf("%.1f", weights[i]);
            if (i < weights.length - 1) {
                System.out.print("; ");
            }
        }
        System.out.print(" ]\n\n");

        // Обчислення показників через виклики методів (вимоги контракту)
        double totalWeight = calculateSum(weights);
        double averageWeight = calculateAverage(weights);
        double maxWeight = findMax(weights);
        double minWeight = findMin(weights);
        int elementsAboveAverage = countAboveAverage(weights, averageWeight);

        // Побудова таблиці результатів Варіанту №7
        System.out.println(tableSeparator);
        System.out.printf("| %-22s | %-14s | %-68s |%n", 
                "Статистичний параметр", "Значення", "Акумульована метрика / Опис розрахунку");
        System.out.println(tableSeparator);
        
        System.out.printf("| %-22s | %-14.2f | %-68s |%n", 
                "Загальна вага кошика", totalWeight, "Сумарна маса всіх фруктів, накопичена через цикл");
        
        System.out.printf("| %-22s | %-14.2f | %-68s |%n", 
                "Середня вага фрукта", averageWeight, "Середнє арифметичне значення (Сума / Кількість елементів)");
        
        System.out.printf("| %-22s | %-14.2f | %-68s |%n", 
                "Максимальна вага", maxWeight, "Найбільший елемент масиву, знайдений лінійним пошуком");
        
        System.out.printf("| %-22s | %-14.2f | %-68s |%n", 
                "Мінімальна вага", minWeight, "Найменший елемент масиву, знайдений лінійним пошуком");
        
        System.out.printf("| %-22s | %-14s | %-68s |%n", 
                "Більше середнього", elementsAboveAverage, "Кількість фруктів, маса яких перевищує середній показник");
        
        System.out.println(tableSeparator);
        System.out.print("\n");

        // Демонстрація сортування масиву бібліотечним методом
        System.out.print("--- 3. Демонстрація сортування масиву (Arrays.sort) ---\n");
        Arrays.sort(weights);
        
        System.out.print("Відсортований кошик (у порядку зростання маси):\n[ ");
        for (int i = 0; i < weights.length; i++) {
            System.out.printf("%.1f", weights[i]);
            if (i < weights.length - 1) {
                System.out.print(" -> ");
            }
        }
        System.out.print(" ]\n");
    }

    /**
     * Обчислює суму елементів масиву дійсних чисел.
     * 
     * @param array масив значень
     * @return сумарне значення
     */
    public static double calculateSum(double[] array) {
        double sum = 0;
        for (double value : array) {
            sum += value;
        }
        return sum;
    }

    /**
     * Обчислює середнє арифметичне значення масиву.
     * 
     * @param array масив значень
     * @return середнє значення
     */
    public static double calculateAverage(double[] array) {
        if (array.length == 0) {
            return 0;
        }
        return calculateSum(array) / array.length;
    }

    /**
     * Знаходить максимальний елемент масиву.
     * 
     * @param array масив значень
     * @return максимальне значення
     */
    public static double findMax(double[] array) {
        double max = array[0];
        for (int i = 1; i < array.length; i++) {
            if (array[i] > max) {
                max = array[i];
            }
        }
        return max;
    }

    /**
     * Знаходить мінімальний елемент масиву.
     * 
     * @param array масив значень
     * @return мінімальне значення
     */
    public static double findMin(double[] array) {
        double min = array[0];
        for (int i = 1; i < array.length; i++) {
            if (array[i] < min) {
                min = array[i];
            }
        }
        return min;
    }

    /**
     * Підраховує елементи, які більші за середнє значення.
     * 
     * @param array масив значень
     * @param average середнє значення
     * @return кількість елементів
     */
    public static int countAboveAverage(double[] array, double average) {
        int count = 0;
        for (double value : array) {
            if (value > average) {
                count++;
            }
        }
        return count;
    }
}
