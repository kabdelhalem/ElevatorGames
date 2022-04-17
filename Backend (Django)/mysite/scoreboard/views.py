from django.http import HttpResponse
from django.shortcuts import render
import datetime

from .models import WordleScore

# Create your views here.
def index(request):
    # if request.user.is_authenticated:
    if request.method == "GET":
        # users = User.objects.all()
        # args = {'user_list': users}
        args = {}
        return render(request, 'scoreboard/home.html')


def upload_score(request, game):
    if request.method == 'GET':
        if game == "wordle":
            player_score = int(request.GET["score"])
            # ELEVATOR ANTI CHEAT (PATENT PENDING) (COPYLEFT EBIG GAMES)
            if player_score > 0 and player_score < 200:
                new_score = WordleScore()
                new_score.player_name = request.GET["name"]
                new_score.score = int(request.GET["score"])
                new_score.pub_date = datetime.datetime.now()
                new_score.save()

                return HttpResponse("SUCCESS")


        # task = Task.objects.get(id=task_id)
        # # print(os.path.join(os.getcwd(), str(task.upload_dir), file_name))
        # file = open(os.path.join(str(task.upload_dir), file_name), "rb").read()
        # stri = "hello"
        # print(stri.split("l")[1])
        # response = HttpResponse(file)
        # response['Content-Disposition'] = 'attachment; filename=' + file_name
        # return response