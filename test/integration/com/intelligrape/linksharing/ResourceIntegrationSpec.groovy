package com.intelligrape.linksharing

import grails.test.spock.IntegrationSpec

class ResourceIntegrationSpec extends IntegrationSpec {

    def setup() {
    }

    def cleanup() {
    }

    void "get rating info"() {
        setup:
        Resource resource = Resource.get(1)
        RatingInfoVO ratingInfoVO = resource.getRatingInfo()

        expect:
        ratingInfoVO.totalVotes != null
        ratingInfoVO.totalScore != null
        ratingInfoVO.averageScore != null


    }
    void "top posts"() {
        setup:
        List list=Resource.getTopPosts()

        expect:
        list.size()==5

    }
}
