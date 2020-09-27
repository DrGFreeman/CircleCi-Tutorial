"""
Unit tests for the calculator library
"""

from calculator import operations as op


class TestCalculator:
    def test_addition(self):
        assert 4 == op.add(2, 2)

    def test_subtraction(self):
        assert 2 == op.subtract(4, 2)

    def test_multiplication(self):
        assert 100 == op.multiply(10, 10)

    def test_division(self):
        assert 10 == op.divide(100, 10)
