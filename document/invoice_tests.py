import unittest

from document.Contragent import Contragent
from document.Invoice import Invoice


class MyTestCase(unittest.TestCase):
    def test_something(self):
        invoice = Invoice()
        contragent = Contragent()
        contragent.CountryCode = 'KZ'

        self.assertEqual(contragent.country_code_validate(), True)  # add assertion here


if __name__ == '__main__':
    unittest.main()
