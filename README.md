# Agenda 
  
   * [Introduction](#introduction) <br>
    * [Description](#description) <br>
   * [How to run](#how-to-run)<br>
    * [Requirements](#requirements) <br>
    * [Installation](#installation) <br>
    * [Steps to run](#steps-to-run) <br>
   * [API Routes](#api-routes)<br>


    
  

# Introduction

## Description
Chat System Api.

**Technologies** : Ruby on Rails


# How to run

## Requirements:
- Docker 
- docker compose

## Installation
```
$ git clone https://github.com/ezzatmohamed/chat-system.git
$ cd chat-system
$ docker-compose build
``` 

## Steps to run

```
$ docker compose up
```
Open shell for rails contanier and run
```
rails db:migrate
```
OR run from terminal
```
$ docker exec -it chat-system_web_1 rails db:migrate
```

# Api Routes

## Application
### /api/v1/applications
- Method
    ```
    GET
    ```
- params
    ```
    {
        "offset":1
        "limit":10
    }
    ```

### /api/v1/applications/{app_token}
- Method
    ```
    GET
    ```

### /api/v1/applications/
- Method
    ```
    POST
    ```
- Params
    ```
    {
        "name":"app_name"
    }
    ```

### /api/v1/applications/{app_token}
- Method
    ```
    PUT
    ```
- Params
    ```
    {
        "name":"app_name"
    }
    ```

## Chat
### /api/v1/applications/{app_token}/chats
- Method
    ```
    GET
    ```
- params
    ```
    {
        "offset":1
        "limit":10
    }
    ```

### /api/v1/applications/{app_token}/chats/{chat_number}
- Method
    ```
    GET
    ```

### /api/v1/applications/{app_token}/chats
- Method
    ```
    POST
    ```
- Params
    ```
    {
        "name":"app_name"
    }


## Message
### /api/v1/applications/{app_token}/chats/{chat_number}/messages
- Method
    ```
    GET
    ```
- params
    ```
    {
        "offset":1
        "limit":10
    }
    ```

### /api/v1/applications/{app_token}/chats/{chat_number}/messages/{message_number}
- Method
    ```
    GET
    ```

### /api/v1/applications/{app_token}/chats/{chat_number}/messages
- Method
    ```
    POST
    ```
- Params
    ```
    {
        "content":"message_test"
    }

### /api/v1/applications/{app_token}/chats/{chat_number}/messages/{message_number}
- Method
    ```
    PUT
    ```
- Params
    ```
    {
        "content":"message_test_update"
    }
    ```
### /api/v1/applications/{app_token}/chats/{chat_number}/messages/search
- Method
    ```
    GET
    ```
- Params
    ```
    {
        "q":"search message"
    }
    ```
