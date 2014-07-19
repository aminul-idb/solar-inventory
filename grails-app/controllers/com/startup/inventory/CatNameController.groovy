package com.startup.inventory

import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured
import com.startup.inventory.CatName
import org.springframework.dao.DataIntegrityViolationException

@Secured(['ROLE_SUPER_ADMIN'])
class CatNameController {
    def catNameService

    def index() {
        LinkedHashMap resultMap = catNameService.catNamePaginateList(params)

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
        LinkedHashMap resultMap = catNameService.catNamePaginateList(params)

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

    def save(CatNameCommand catNameCommand) {

        print("status----------------------" + params)

        if (!request.method == 'POST') {
            redirect(action: 'index')
            return
        }
        LinkedHashMap result = new LinkedHashMap()
        result.put('isError', true)
        String outPut
        if (catNameCommand.hasErrors()) {
            result.put('message', 'Please fill the form correctly')
            outPut = result as JSON
            render outPut
            return
        }
        CatName catName
        if (params.id) { //update Category
            catName = CatName.get(catNameCommand.id)
            if (!catName) {
                result.put('message', 'Category not found')
                outPut = result as JSON
                render outPut
                return
            }
            catName.properties = catNameCommand.properties
            if (!catName.validate()) {
                result.put('message', 'Please fill the form correctly')
                outPut = result as JSON
                render outPut
                return
            }
            CatName savedClass = catName.save()
            result.put('isError', false)
            result.put('message', 'Category Updated successfully')
            outPut = result as JSON
            render outPut
            return
        }
        catName = new CatName(catNameCommand.properties)
        if (!catNameCommand.validate()) {
            result.put('message', 'Please fill the form correctly')
            outPut = result as JSON
            render outPut
            return
        }
        CatName savedCurr = catName.save(flush: true)
        if (!savedCurr) {
            result.put('message', 'Please fill the form correctly')
            outPut = result as JSON
            render outPut
            return
        }
        result.put('isError', false)
        result.put('message', 'Category Inserted successfully')
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
        CatName catName = CatName.read(id)
        if (!catName) {
            result.put('message', 'Category name not found')
            outPut = result as JSON
            render outPut
            return
        }
        result.put('isError', false)
        result.put('obj', catName)
        outPut = result as JSON
        render outPut
    }

    def delete(Long id) {
        LinkedHashMap result = new LinkedHashMap()
        result.put('isError', true)
        String outPut
        CatName catName = CatName.get(id)
        if (catName) {
            try {
                catName.delete(flush: true)
                result.put('isError', false)
                result.put('message', "Category deleted successfully.")
                outPut = result as JSON
                render outPut
                return

            }

            catch (DataIntegrityViolationException e) {
                result.put('isError', true)
                result.put('message', "Category could not deleted. Already in use.")
                outPut = result as JSON
                render outPut
                return
            }

        }
        result.put('isError', true)
        result.put('message', "Category not found")
        outPut = result as JSON
        render outPut
        return
    }
}


class CatNameCommand{

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
