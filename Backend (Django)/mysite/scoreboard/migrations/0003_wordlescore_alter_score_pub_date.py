# Generated by Django 4.0.4 on 2022-04-17 05:12

import datetime
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('scoreboard', '0002_remove_score_time_score_pub_date'),
    ]

    operations = [
        migrations.CreateModel(
            name='WordleScore',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('player_name', models.CharField(max_length=200)),
                ('pub_date', models.DateTimeField(default=datetime.datetime(1970, 1, 1, 1, 1, 1), verbose_name='date published')),
                ('score', models.IntegerField(default=0)),
            ],
        ),
        migrations.AlterField(
            model_name='score',
            name='pub_date',
            field=models.DateTimeField(default=datetime.datetime(1970, 1, 1, 1, 1, 1), verbose_name='date published'),
        ),
    ]