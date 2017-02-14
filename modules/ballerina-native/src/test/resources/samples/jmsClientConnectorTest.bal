package samples.connectors.test;

import ballerina.net.jms;
import ballerina.lang.message;

function jmsClientConnectorTest() (boolean) {
    jms:ClientConnector jmsEP = create jms:ClientConnector("", "file:///tmp/jndi.properties");
    message queueMessage = {};
    map dataMap = {};
    dataMap = {};
    message:setStringPayload(queueMessage, "Hello from ballerina");
    jms:ClientConnector.send(jmsEP, "QueueConnectionFactory", "MyQueue", "queue", "TextMessage", queueMessage, dataMap);
    return true;
}

function jmsSendNoMessageTest() (boolean) {
    jms:ClientConnector jmsEP = create jms:ClientConnector("org.wso2.andes.jndi.PropertiesFileInitialContextFactory",
     "jndi.properties");
    message queueMessage = {};
    map dataMap = {};
    dataMap = {};
    json jsonData = {};
    message:setJsonPayload(queueMessage, jsonData);
    jms:ClientConnector.send(jmsEP, "QueueConnectionFactory", "MyQueue", "queue", "TextMessage", queueMessage, dataMap);
    return true;
}

function jmsSendMapMessageWithoutData() (boolean) {
    jms:ClientConnector jmsEP = create jms:ClientConnector("org.wso2.andes.jndi.PropertiesFileInitialContextFactory",
     "jndi.properties");
    message queueMessage = {};
    map dataMap = {};
    dataMap = {};
    message:setStringPayload(queueMessage, "Hello from ballerina");
    jms:ClientConnector.send(jmsEP, "QueueConnectionFactory", "MyQueue", "queue", "MapMessage", queueMessage, dataMap);
    return true;
}