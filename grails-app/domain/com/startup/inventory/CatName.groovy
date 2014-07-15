package com.startup.inventory

class CatName {

    String name
    String description
    boolean status = true

    static constraints = {
        name nullable: false, unique: true
        description nullable: true
    }
}
