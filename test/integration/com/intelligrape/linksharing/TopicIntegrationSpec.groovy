package com.intelligrape.linksharing

import grails.test.spock.IntegrationSpec

class TopicIntegrationSpec extends IntegrationSpec {

    def setup() {
    }

    def cleanup() {
    }

    void "trending topics"() {

        when:
        List list=Topic.getTrendingTopics()

        then:
        list.size()==5
    }
}
