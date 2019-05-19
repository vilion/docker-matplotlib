docker-compose -f docker-compose.yml run -v $PWD:/tmp  --service-ports -d matplotlib

ssh-keygen -R [127.0.0.1]:2222
ssh -X root@127.0.0.1 -o "StrictHostKeyChecking=no"  -p 2222

matplotlib.use('tkagg')

need plt.show()
