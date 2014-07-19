package com.startup.inventory

import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured
import org.springframework.dao.DataIntegrityViolationException

@Secured(['ROLE_SUPER_ADMIN'])
class SubCatController {

    def subCatService

    def index() {
        LinkedHashMap resultMap = subCatService.subCatPaginateList(params)

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
        LinkedHashMap resultMap = subCatService.subCatPaginateList(params)

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

    def save(SubCatCommand subCatCommand) {

        print("status----------------------" + params)

        if (!request.method == 'POST') {
            redirect(action: 'index')
            return
        }
        LinkedHashMap result = new LinkedHashMap()
        result.put('isError', true)
        String outPut
        if (subCatCommand.hasErrors()) {
            result.put('message', 'Please fill the form correctly')
            outPut = result as JSON
            render outPut
            return
        }
        SubCat subCat
        if (params.id) { //update Sub Sub Category
            subCat = SubCat.get(subCatCommand.id)
            if (!subCat) {
                result.put('message', 'Sub Sub Category not found')
                outPut = result as JSON
                render outPut
                return
            }
            subCat.properties = subCatCommand.properties
            if (!subCat.validate()) {
                result.put('message', 'Please fill the form correctly')
                outPut = result as JSON
                render outPut
                return
            }
            SubCat savedClass = subCat.save()
            result.put('isError', false)
            result.put('message', 'Sub Sub Category Updated successfully')
            outPut = result as JSON
            render outPut
            return
        }
        subCat = new SubCat(subCatCommand.properties)
        if (!subCatCommand.validate()) {
            result.put('message', 'Please fill the form correctly')
            outPut = result as JSON
            render outPut
            return
        }
        SubCat savedCurr = subCat.save(flush: true)
        if (!savedCurr) {
            result.put('message', 'Please fill the form correctly')
            outPut = result as JSON
            render outPut
            return
        }
        result.put('isError', false)
        result.put('message', 'Sub Sub Category Inserted successfully')
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
        SubCat subCat = SubCat.read(id)
        if (!subCat) {
            result.put('message', 'Sub Sub Category name not found')
            outPut = result as JSON
            render outPut
            return
        }
        result.put('isError', false)
        result.put('obj', subCat)
        outPut = result as JSON
        render outPut
    }

    def delete(Long id) {
        LinkedHashMap result = new LinkedHashMap()
        result.put('isError', true)
        String outPut
        SubCat subCat = SubCat.get(id)
        if (subCat) {
            try {
                subCat.delete(flush: true)
                result.put('isError', false)
                result.put('message', "Sub Sub Category deleted successfully.")
                outPut = result as JSON
                render outPut
                return

            }

            catch (DataIntegrityViolationException e) {
                result.put('isError', true)
                result.put('message', "Sub Sub Category could not deleted. Already in use.")
                outPut = result as JSON
                render outPut
                return
            }

        }
        result.put('isError', true)
        result.put('message', "Sub Sub Category not found")
        outPut = result as JSON
        render outPut
        return
    }
}

class SubCatCommand{
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