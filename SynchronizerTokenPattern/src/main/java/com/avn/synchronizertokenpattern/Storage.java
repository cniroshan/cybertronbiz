/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.avn.synchronizertokenpattern;

import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author chandima
 */
public class Storage {

    private static Storage storage = new Storage();
    private Map<String, String> storageMap = new HashMap<String, String>();

    public static Storage getStorage() {
        return storage;
    }

    public void addCookie(String sessionId, String token) {
        storageMap.put(sessionId, token);
    }

    public String getCookie(String sessionId) {
        for (Map.Entry<String, String> entry : storageMap.entrySet()) {
            if (sessionId.equals(entry.getKey())) {
                return entry.getValue();
            }
        }
        return null;
    }

    public void printCookie() {
        for (Map.Entry<String, String> entry : storageMap.entrySet()) {
            System.out.println("sessionId " + entry.getKey() + " token" + entry.getValue());
        }
    }
}
