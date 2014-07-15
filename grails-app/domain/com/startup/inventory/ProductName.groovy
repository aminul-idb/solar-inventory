package com.startup.inventory

class ProductName {

    String name
    String description
    boolean status = true

    static constraints = {
        name nullable: false, unique: true
        description nullable: true
    }
}
