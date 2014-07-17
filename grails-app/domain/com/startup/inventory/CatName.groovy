package com.startup.inventory

class CatName {

    String name
    String description
    Status status

    static constraints = {
        name nullable: false, unique: true
        description nullable: true
    }
}
