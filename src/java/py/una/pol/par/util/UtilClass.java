/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package py.una.pol.par.util;

import java.math.BigDecimal;

/**
 *
 * @author Gabriel
 */
public class UtilClass {
    public static boolean leerCadena(String cadena) {
        if (cadena == null) {
            return false;
        } else {
            return cadena.trim().compareTo("") != 0;
        }
    }

    public static Integer leerNumero(String num) {
        try {
            if (Integer.parseInt(num) > 0) {
                return Integer.parseInt(num);
            } else {
                return null;
            }
        } catch (NumberFormatException e) {
            return null;
        }
    }

    public static BigDecimal leerBigDecimal(String bd) {
        try {
            return new BigDecimal(bd);
        } catch (Exception e) {
            return null;
        }
    }
}
