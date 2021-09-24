import mysql.connector
db = mysql.connector.connect(user="root", passwd='pwd', db="UserDB")
import json
cursor = db.cursor()


class Mysqlhandler:
    def __init__(self):
        pass
    def add_user(self,value1,value2,value3):
        query="INSERT INTO user_data values('{}',{},'{}')".format(value1,value2,value3)
        cursor.execute(query)       
        db.commit()
        return {}
    def update_user(self,name,dob,pno):
        query=("update user_data set name='{}',dob='{}' where phno={}".format(name,dob,pno))
        cursor.execute(query)
        db.commit()
        return {}
        
    def delete_user(self,phno):
        query=("Delete from user_data  where phno='{}'".format(phno))
        cursor.execute(query)
        db.commit()
        return {}
       
    def display_user(self,value):
        query=("select name, phno,dob from user_data where name='{}'".format(value))
        cursor.execute(query)
        name,phno,dob=list(cursor)[0]
        dob1=dob.strftime("%Y-%m-%d")
        obj={
            'name':name,
            'phno':phno,
            'dob':dob1
        }
        return(json.dumps(obj))



if __name__=="__main__":
    obj1=  Mysqlhandler()

