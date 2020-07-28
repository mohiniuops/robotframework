*** Settings ***
Documentation    Suite description
Library  SeleniumLibrary

*** Test Cases ***
Test Open vodafone portal
    Open Browser  https://n.vodafone.ie/en.html#  headlessfirefox
