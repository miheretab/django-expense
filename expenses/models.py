from django.db import models

# Create your models here.
class Expense(models.Model):
    title = models.CharField(max_length=255)
    amount = models.DecimalField(max_digits=10, decimal_places=2)
    category = models.CharField(max_length=100)
    expense_date = models.DateField()

    def __str__(self):
        return f"{self.title} - {self.amount}"