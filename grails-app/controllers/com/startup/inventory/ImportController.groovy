package com.startup.inventory

import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured
import grails.transaction.Transactional
import org.springframework.dao.DataIntegrityViolationException

@Secured(['ROLE_SUPER_ADMIN'])
class ImportController {

    def importService

    def index() {
        LinkedHashMap resultMap = importService.importPaginateList(params)

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
        LinkedHashMap resultMap = importService.importPaginateList(params)

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

    @Transactional
    def save(Import anImport) {

        print("Params-------"+params)

        LinkedHashMap result = new LinkedHashMap()
        result.put('isError', true)
        String outPut

        anImport.entryDate=new Date()
//        anImport.importDate=new Date()

        if (anImport == null) {
            result.put('isError', true)
            result.put('message', 'Import Updated Failed')
            outPut = result as JSON
            render outPut
            return
        }

        if (anImport.hasErrors()) {
            result.put('isError', true)
            result.put('message', 'Import Updated Failed')
            outPut = result as JSON
            render outPut
            return
        }


        anImport.save flush:true
        result.put('isError', false)
        result.put('message', 'Import Updated successfully')
        outPut = result as JSON
        render outPut
        return

    }

    def edit(Long id) {
        if (!request.method == 'POST') {
            redirect(action: 'index')
            return
        }
        LinkedHashMap result = new LinkedHashMap()
        result.put('isError', true)
        String outPut
        Import anImport = Import.read(id)
        if (!anImport) {
            result.put('message', 'Import name not found')
            outPut = result as JSON
            render outPut
            return
        }
        result.put('isError', false)
        result.put('obj', anImport)
        outPut = result as JSON
        render outPut
    }

    def delete(Long id) {
        LinkedHashMap result = new LinkedHashMap()
        result.put('isError', true)
        String outPut
        Import anImport = Import.get(id)
        if (anImport) {
            try {
                anImport.delete(flush: true)
                result.put('isError', false)
                result.put('message', "Import deleted successfully.")
                outPut = result as JSON
                render outPut
                return

            }

            catch (DataIntegrityViolationException e) {
                result.put('isError', true)
                result.put('message', "Import could not deleted. Already in use.")
                outPut = result as JSON
                render outPut
                return
            }

        }
        result.put('isError', true)
        result.put('message', "Import not found")
        outPut = result as JSON
        render outPut
        return
    }
}