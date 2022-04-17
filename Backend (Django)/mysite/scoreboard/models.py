import datetime

import django.utils.timesince
from django.db import models
from django.utils import timezone


# Create your models here.

class Score(models.Model):
    # question = models.ForeignKey(Question, on_delete=models.CASCADE)
    player_name = models.CharField(max_length=200)
    pub_date = models.DateTimeField('date published', default=datetime.datetime(1970,1,1,1,1,1))
    # pub_date_1 = models.DateTimeField('time published', default=datetime.datetime(1970,1,1,1,1,1))
    score = models.IntegerField(default=0)

    def was_published_recently(self):
        return self.pub_date >= timezone.now() - datetime.timedelta(days=1)

    def __str__(self):
        return str(self.score)

class WordleScore(models.Model):
    # question = models.ForeignKey(Question, on_delete=models.CASCADE)
    player_name = models.CharField(max_length=200)
    player_pic = models.CharField(max_length=2732, default="0")  # Base64 profile pic
    pub_date = models.DateTimeField('date published', default=datetime.datetime(1970,1,1,1,1,1))
    score = models.IntegerField(default=0)

    def was_published_recently(self):
        return self.pub_date >= timezone.now() - datetime.timedelta(days=1)

    def __str__(self):
        return str(self.score)