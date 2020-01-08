from selenium import webdriver
from selenium.webdriver.support.ui import Select
import time
import os
browser = webdriver.Chrome(executable_path ="chromedriver.exe")
URL ="https://www.zamzar.com/url/"
browser.get(URL)
pdfUrl="http://ggsipu.ac.in/ExamResults/2019/250819/2015_128_B.TECH(ECE)_2nd,%204th%20&%206th%20regular%20and%20reappear%20_DECLARE_RESULT_MAY2019.pdf"
browser.find_element_by_id("inputFile").send_keys(pdfUrl)
browser.find_element_by_id('toExtensionSel').click()
select = Select(browser.find_element_by_id('toExtensionSel'))
select = select.find_element_by_value('txt').click()