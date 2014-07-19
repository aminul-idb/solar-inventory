package com.startup.inventory

import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured
import org.springframework.dao.DataIntegrityViolationException

@Secured(['ROLE_SUPER_ADMIN'])
class ProductNameController {

    def productNameService

    def index() {
        LinkedHashMap resultMap = productNameService.productNamePaginateList(params)

        if (!resultMap || resultMap.totalCount == 0) {
            render(view: 'index', model: [dataReturn: null, totalCount: 0])
            return
        }
        int totalCount = resultMap.totalCount
        render(view: 'index', model: [dataReturn: resultMap.results, totalCount: totalCount])
    }

    def list() {
        LinkedHashMap gridData
        String result
        LinkedHashMap resultMap = productNameService.productNamePaginateList(params)

        if (!resultMap || resultMap.totalCount == 0) {
            gridData = [iTotalRecords: 0, iTotalDisplayRecords: 0, aaData: null]
            result = gridData as JSON
            render result
            return
        }
        int totalCount = resultMap.totalCount
        gridData = [iTotalRecords: totalCount, iTotalDisplayRecords: totalCount, aaData: resultMap.results]
        result = gridData as JSON
        render result

    }

    def save(ProductNameCommand productNameCommand) {

        print("status----------------------" + params)

        if (!request.method == 'POST') {
            redirect(action: 'index')
            return
        }
        LinkedHashMap result = new LinkedHashMap()
        result.put('isError', true)
        String outPut
        if (productNameCommand.hasErrors()) {
            result.put('message', 'Please fill the form correctly')
            outPut = result as JSON
            render outPut
            return
        }
        ProductName productName
        if (params.id) { //update Product
            productName = ProductName.get(productNameCommand.id)
            if (!productName) {
                result.put('message', 'Product not found')
                outPut = result as JSON
                render outPut
                return
            }
            productName.properties = productNameCommand.properties
            if (!productName.validate()) {
                result.put('message', 'Please fill the form correctly')
                outPut = result as JSON
                render outPut
                return
            }
            ProductName savedClass = productName.save()
            result.put('isError', false)
            result.put('message', 'Product Updated successfully')
            outPut = result as JSON
            render outPut
            return
        }
        productName = new ProductName(productNameCommand.properties)
        if (!productNameCommand.validate()) {
            result.put('message', 'Please fill the form correctly')
            outPut = result as JSON
            render outPut
            return
        }
        ProductName savedCurr = productName.save(flush: true)
        if (!savedCurr) {
            result.put('message', 'Please fill the form correctly')
            outPut = result as JSON
            render outPut
            return
        }
        result.put('isError', false)
        result.put('message', 'Product Inserted successfully')
        outPut = result as JSON
        render outPut
    }

    def edit(Long id) {
        if (!request.method == 'POST') {
            redirect(action: 'index')
            return
        }
        LinkedHashMap result = new LinkedHashMap()
        result.put('isError', true)
        String outPut
        ProductName productName = ProductName.read(id)
        if (!productName) {
            result.put('message', 'Product name not found')
            outPut = result as JSON
            render outPut
            return
        }
        result.put('isError', false)
        result.put('obj', productName)
        outPut = result as JSON
        render outPut
    }

    def delete(Long id) {
        LinkedHashMap result = new LinkedHashMap()
        result.put('isError', true)
        String outPut
        ProductName productName = ProductName.get(id)
        if (productName) {
            try {
                productName.delete(flush: true)
                result.put('isError', false)
                result.put('message', "Product deleted successfully.")
                outPut = result as JSON
                render outPut
                return

            }

            catch (DataIntegrityViolationException e) {
                result.put('isError', true)
                result.put('message', "Product could not deleted. Already in use.")
                outPut = result as JSON
                render outPut
                return
            }

        }
        result.put('isError', true)
        result.put('message', "Product not found")
        outPut = result as JSON
        render outPut
        return
    }
}


class ProductNameCommand{

    Long id
    String name
    String description
    Status status

    static constraints = {
        id nullable: true
        name nullable: false
        description nullable: true
        status nullable: true
    }
}
