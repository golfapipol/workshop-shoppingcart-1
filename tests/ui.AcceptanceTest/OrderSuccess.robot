*** Settings ***
Library    SeleniumLibrary
Resource    Resource/shopping-cart-keywords.robot
Test Setup    เปิดให้ดู Step ละ (วินาที)
Test Teardown    ปิดหน้าเบราเซอร์

*** Test Cases ***
ผู้ใช้สามารถสั่งซื้อสินค้าได้สำเร็จ
    [Tags]    Success Case    Order Feature
    เข้าหน้าแสดงรายการสินค้า พบรายการสินค้าทั้งหมด
    เลือกสินค้า 43 Piece dinner Set
    แสดงรายละเอียดสินค้า 43 Piece dinner Set
    เพิ่มสินค้าเข้าตะกร้า
    แสดงรายการสินค้าที่อยู่ในตะกร้าสินค้าและมีราคารวมเท่ากับ    12.95
    กดยืนยันการสั่งซื้อสินค้า
    แสดงที่อยู่ในการจัดส่ง
    ยืนยันที่อยู่ในการจัดส่ง
    แสดงผลการสั่งซื้อ