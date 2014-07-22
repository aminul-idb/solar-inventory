package com.startup.inventory

class Import {

    String lcDetails
    ProductName productName
    Date entryDate
    Date importDate
    String description
    Status status


    static constraints = {
        importDate nullable: true
        entryDate nullable: true
    }
}
