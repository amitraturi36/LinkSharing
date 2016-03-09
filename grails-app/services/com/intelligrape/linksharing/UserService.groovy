package com.intelligrape.linksharing

import grails.transaction.Transactional

@Transactional
class UserService {

    def serviceMethod() {
        List<TopicVO> topicVOList = Topic.getTrendingTopics(0)
        topicVOList

    }
}
