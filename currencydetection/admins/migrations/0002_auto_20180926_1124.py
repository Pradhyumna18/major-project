# -*- coding: utf-8 -*-
# Generated by Django 1.11.6 on 2018-09-26 05:54
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('admins', '0001_initial'),
    ]

    operations = [
        migrations.RenameField(
            model_name='traincurrencies',
            old_name='currencuValue',
            new_name='currencyValue',
        ),
        migrations.AddField(
            model_name='traincurrencies',
            name='currencyName',
            field=models.CharField(default='a', max_length=200),
            preserve_default=False,
        ),
    ]
