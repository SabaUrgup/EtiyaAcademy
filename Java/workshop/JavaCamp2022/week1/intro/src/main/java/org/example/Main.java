package org.example;

public class Main {

    // Disabling spell checking has removed the red underline from Turkish comments
    // The main method is the entry point in Java
    public static void main(String[] args) {
        System.out.println("Hello World !"); // Ctrl + Space brings up an info box. Single quotes here cause an error
        // Typing sysout and pressing Ctrl + Space automatically completes println

        // Variable names in Java use camelCase. The first letter is lowercase, and subsequent words start with an uppercase letter
        String middleText = "İlginizi çekebilir";
        String bottomText = "Vade süresi";

        System.out.println(middleText);

        // integer
        int term = 12;

        // double
        double dollarYesterday = 18.25;
        double dollarToday = 18.30;

        // long can also be used

        boolean dollarDropped = false;

        String arrowDirection = "";

        if (dollarToday < dollarYesterday) { // false
            arrowDirection = "down.svg";
            System.out.println(arrowDirection);
        } else if (dollarToday > dollarYesterday) {
            arrowDirection = "up.svg";
            System.out.println(arrowDirection);
        } else {
            arrowDirection = "equal.svg";
            System.out.println(arrowDirection);
        }

        // array
        String[] loans = {"Hizli Kredi", "Maasini Halkbak'tan Alanlar", "Mutlu Emekli"};

        System.out.println(loans[0]);

        for (int i = 0; i < loans.length; i++) {
            System.out.println(loans[i]);
        }
    }
}
