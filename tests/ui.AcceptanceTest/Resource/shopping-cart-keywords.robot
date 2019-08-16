
*** Variables ***
${URL}    http://3.0.91.31
${BROWSER}    chrome

*** Keywords ***
เข้าหน้าแสดงรายการสินค้า พบรายการสินค้าทั้งหมด
    Open Browser    ${URL}    ${BROWSER}
    Wait Until Page Contains     43 Piece dinner Set    3s
    Capture Page Screenshot

ค้าหาสินค้า ช่วงอายุ 3 ถึง 5 ปี และเพศหญิง
    Select From List by Value    age-input    3_to_5
    Select From List by Value    gender-input    Female 
    Click Element    search-button
    Wait Until Page Contains     43 Piece dinner Set    3s
    Wait Until Page Contains     Sleeping Queens Board Game    3s
    Wait Until Page Contains     Princess Palace    3s
    Wait Until Page Contains     Best Friends Forever Magnetic Dress Up    3s
    Wait Until Page Contains     Princess Training Bicycle    3s
    Capture Page Screenshot

เลือกสินค้า 43 Piece dinner Set
    Click Element    link-product-detail-id-2
    Capture Page Screenshot

เลือกสินค้า
    [Arguments]      ${product_id}
    Click Element    link-product-detail-id-${product_id}
    Capture Page Screenshot

แสดงรายละเอียดสินค้า 43 Piece dinner Set
    Wait Until Element Contains     label-product-name    43 Piece dinner Set    3s
    Wait Until Element Contains     label-product-brand    CoolKidz    3s
    Wait Until Element Contains     label-product-price    12.95    3s
    Capture Page Screenshot

แสดงรายละเอียดสินค้า
    [Arguments]      ${product_name}      ${product_brand}      ${product_price}
    Wait Until Element Contains     label-product-name    ${product_name}    3s
    Wait Until Element Contains     label-product-brand    ${product_brand}    3s
    Wait Until Element Contains     label-product-price    ${product_price}    3s
    Capture Page Screenshot

เพิ่มจำนวนสินค้าที่ต้องการจะซื้อเป็น 2 ชิ้น
    Select From List by Value    product-quantity    2 
    Wait Until Element Contains     product-total-price   25.9    3s
    Capture Page Screenshot

เพิ่มสินค้าเข้าตะกร้า
    Click Button    button-add-product-to-cart

แสดงรายการสินค้าที่อยู่ในตะกร้าสินค้าและมีราคารวมเท่ากับ
    [Arguments]      ${subtotal}
    Wait Until Page Contains     43 Piece dinner Set    3s
    Wait Until Page Contains     CoolKidz    3s
    Wait Until Page Contains     12.95    3s
    Wait Until Element Contains     label-subtotal    ${subtotal}    3s
    Wait Until Element Contains     label-shipping-fee    50.00    3s
    Capture Page Screenshot


แสดงรายการสินค้าที่อยู่ในตะกร้าสินค้าและมีราคารวมค่าสินค้าดังนี้
    [Arguments]       ${product_name}      ${product_brand}      ${product_price}     ${discount}    ${shipping-fee}    ${total}
    Wait Until Page Contains     ${product_name}    3s
    Wait Until Page Contains     ${product_brand}    3s
    Wait Until Page Contains     ${product_price}    3s
    Wait Until Element Contains     label-subtotal    ${product_price}    3s
    Wait Until Element Contains     label-discount    ${discount}    3s
    Wait Until Element Contains     label-shipping-fee    ${product_price}    3s
    Wait Until Element Contains     label-total    ${total}    3s
    Capture Page Screenshot

แสดงรายการสินค้าที่อยู่ในตะกร้าสินค้าและมีราคารวมค่าสินค้าเท่ากับ    140    0   50    190
    [Arguments]      ${subtotal}    ${discount}    ${shipping-fee}    ${total}
    Wait Until Page Contains     43 Piece dinner Set    3s
    Wait Until Page Contains     CoolKidz    3s
    Wait Until Page Contains     140    3s
    Wait Until Element Contains     label-subtotal    ${subtotal}    3s
    Wait Until Element Contains     label-discount    ${discount}    3s
    Wait Until Element Contains     label-shipping-fee    ${subtotal}    3s
    Wait Until Element Contains     label-total    ${total}    3s
    Capture Page Screenshot

ใส่คูปองส่วนลด
    [Arguments]      ${coupon-code}
    Input Text     discount-coupon    ${coupon-code}
    Click Button    apply-coupon

แสดงข้อความไม่สามารถร่วมรายการการใช้งานคูปองได้
    Wait Until Element Contains     coupon-error-message    ไม่สามารถร่วมการนี้ได้    3s

แสดงข้อความคูปองถูกใช้งานเต็มจำนวนได้
    Wait Until Element Contains     coupon-error-message    คูปองนี้ถูกใช้งานเต็มจำนวนแล้ว    3s

แสดงข้อความ
    [Arguments]      ${error-message}
    Wait Until Element Contains     coupon-error-message    ${error-message}    3s

กดยืนยันการสั่งซื้อสินค้า
    Click Button    button-confirm-cart

แสดงที่อยู่ในการจัดส่ง
    Wait Until Element Contains     textbox-user-fullname    Chonnikan Tobunrueang    3s
    Wait Until Element Contains     textbox-address1    3 อาคารพร้อมพันธ์ 3 ห้อง 1001    3s
    Wait Until Element Contains     textbox-address2    จอมพล    3s
    Wait Until Element Contains     textbox-city    จตุจักร    3s
    Wait Until Element Contains     textbox-province    กรุงเทพ    3s
    Wait Until Element Contains     textbox-postcode    10900    3s
    Capture Page Screenshot

ยืนยันที่อยู่ในการจัดส่ง
    Click Button    button-confirm-shipping-address

แสดงผลการสั่งซื้อ
    Wait Until Page Contains     Thank you    3s
    Capture Page Screenshot

ปิดหน้าเบราเซอร์
    Close Browser

เปิดให้ดู Step ละ (วินาที)
    Set Selenium Speed    0.1