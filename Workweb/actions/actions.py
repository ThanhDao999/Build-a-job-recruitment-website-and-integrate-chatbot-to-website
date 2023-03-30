# This files contains your custom actions which can be used to run
# custom Python code.
#
# See this guide on how to implement these action:
# https://rasa.com/docs/rasa/custom-actions


# This is a simple example for a custom action which utters "Hello World!"
import gc
from typing import Any, Text, Dict, List

from rasa_sdk import Action, Tracker
from rasa_sdk.executor import CollectingDispatcher
import mysql.connector
from mysql.connector import Error
from rasa_sdk.events import SlotSet, SessionStarted, ActionExecuted, EventType
from rasa_sdk.executor import CollectingDispatcher
from rasa_sdk.events import SlotSet
try:
    connection = mysql.connector.connect(host='localhost',
                                         database='recruitment_db',
                                         user='root',
                                         password='')
    if connection.is_connected():
        db_Info = connection.get_server_info()
        print("Connected to MySQL Server version ", db_Info)
        cursor = connection.cursor()
        cursor.execute("select database();")
        record = cursor.fetchone()
        print("You're connected to database: ", record)

except Error as e:
    print("Error while connecting to MySQL", e)
finally:
    if connection.is_connected():
        cursor.close()
        connection.close()
        print("MySQL connection is closed")
#thông tin các vị trí cần tuyển dụng
class action_about_position(Action):

     def name(self) -> Text:
         return "action_about_position"

     def run(self, dispatcher: CollectingDispatcher,
             tracker: Tracker,
             domain: Dict[Text, Any]) -> List[Dict[Text, Any]]:
        ask_position = tracker.get_slot("name_position")
        dispatcher.utter_message("Danh sách các công ty đang tuyển vị trí " + "" + ask_position)
        positionArray = []
        connection = mysql.connector.connect(host="localhost", user="root", passwd="", database="recruitment_db")
        db_Info = connection.get_server_info()
        print("Connected to MYSQL Server version", db_Info)
        curPo = connection.cursor()
        sql_position = "select * from vacancy where position like '{}'".format(ask_position)
        curPo.execute(sql_position)
        result = curPo.fetchall()
        for row in result:
            positionArray.append(row[6])
            positionArray.append(row[11])
            positionArray.append(row[12])
        connection.rollback()
        connection.close()

        for row in positionArray:
            dispatcher.utter_message(row)
        return []

#thông tin công ty
class action_about_company(Action):

    def name(self) -> Text:
        return "action_about_company"

    def run(self, dispatcher: CollectingDispatcher,
            tracker: Tracker,
            domain: Dict[Text, Any]) -> List[Dict[Text, Any]]:
        ask_company = tracker.get_slot("company_infor")
        dispatcher.utter_message("Thông tin của công ty" +" "+ ask_company)
        companyArray = []
        connection = mysql.connector.connect(host="localhost", user="root", passwd="", database="recruitment_db")
        db_Info = connection.get_server_info()
        print("Connected to MYSQL Server version", db_Info)
        curCo = connection.cursor()
        sql_company = "select * from vacancy where name_company like '{}' limit 1".format(ask_company)
        curCo.execute(sql_company)
        result = curCo.fetchall()
        for row in result:
            companyArray.append(row[10])
            companyArray.append(row[11])
            companyArray.append(row[12])
        connection.rollback()
        connection.close()

        for row in companyArray:
            dispatcher.utter_message(row)
        return []

#trả lòi nhà tuyển dụng
class answer_recruitmenter(Action):

    def name(self) -> Text:
        return "answer_recruitmenter"

    def run(self, dispatcher: CollectingDispatcher,
            tracker: Tracker,
            domain: Dict[Text, Any]) -> List[Dict[Text, Any]]:
        # Open a file: file
        #print('[%s] <- %s' % (self.name(), tracker.latest_message['text']))

        button = {
            "type": "postback",
            "title": "📣 Đăng bài",
            "payload": '/recruimenter_ask_link_upload{"content_type":"đăng bài"}',
        }
        button1 = {
            "type": "postback",
            "title": "📣Tìm thông tin",
            "payload": '/recruimenter_ask_information{"content_infor":"thông tin"}',
        }

        ret_text = "Mời bạn nhấp vào một trong hai lựa chọn!"
        dispatcher.utter_message(text=ret_text, buttons=[button, button1])
        print('[%s] -> %s' % (self.name(), ret_text))

        del ret_text, button, button1
        gc.collect()

        return []

#thông tin danh sách nhân sự
class action_about_list(Action):

    def name(self) -> Text:
        return "action_about_list"

    def run(self, dispatcher: CollectingDispatcher,
            tracker: Tracker,
            domain: Dict[Text, Any]) -> List[Dict[Text, Any]]:
        ask_list = tracker.get_slot("list")
        ask_position = tracker.get_slot("position")
        dispatcher.utter_message("Thông tin" + " " + ask_list +" nhân sự ứng tuyển vị trí "+ ask_position)
        positionArray = []
        connection = mysql.connector.connect(host="localhost", user="root", passwd="", database="recruitment_db")
        db_Info = connection.get_server_info()
        print("Connected to MYSQL Server version", db_Info)
        curPo = connection.cursor()
        sql_position = "SELECT * FROM `vacancy` va JOIN application app ON va.id = app.position_id WHERE position LIKE '{}'".format(ask_position)
        curPo.execute(sql_position)
        result = curPo.fetchall()
        for row in result:
            positionArray.append(row[14])
            positionArray.append(row[18])
        connection.rollback()
        connection.close()
        for row in positionArray:
            dispatcher.utter_message(row)
        return []

#thêm thông tin nhà tuyển dụng
class action_about_recruiter(Action):

    def name(self) -> Text:
        return "action_about_recruiter"

    def run(self, dispatcher: CollectingDispatcher,
            tracker: Tracker,
            domain: Dict[Text, Any]) -> List[Dict[Text, Any]]:
        ask_list = tracker.get_slot("list")
        ask_position = tracker.get_slot("position")
        dispatcher.utter_message("Thông tin" + " " + ask_list +" nhân sự ứng tuyển vị trí "+ ask_position)
        positionArray = []
        connection = mysql.connector.connect(host="localhost", user="root", passwd="", database="recruitment_db")
        db_Info = connection.get_server_info()
        print("Connected to MYSQL Server version", db_Info)
        curPo = connection.cursor()
        sql_position = "SELECT * FROM `vacancy` va JOIN application app ON va.id = app.position_id WHERE position LIKE '{}'".format(ask_position)
        curPo.execute(sql_position)
        result = curPo.fetchall()
        for row in result:
            positionArray.append(row[14])
            positionArray.append(row[18])
        connection.rollback()
        connection.close()
        for row in positionArray:
            dispatcher.utter_message(row)
        return []