from webdriver_manager.chrome import ChromeDriverManager


def get_chrome_driver():
    chrome_driver = ChromeDriverManager().install()
    return chrome_driver