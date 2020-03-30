               
## Commonly white listed domains for Pi-Hole (Compatible with Pi-Hole Docker Image).  
          
A robust collection of commonly whitelisted websites borrowed from various sources including Pi-Hole subreddit, Pi-Hole forum, Pi-Hole GitHub repository and more! 
Add these domains to your Pi-Hole setup by running a script or manually and make your setup **trouble-free!**
                
Want to report a new domain? Want to report an existing one? Feel free to file an <a href="https://github.com/Soundium/Pi_hole_Whitelist/issues">issue</a>.
       
* * *
         
### Main features:
       
- The entire repo is curated.
- New domains are added frequently.
- Supports Pi-Hole Docker installation.
- Comes with a shell script i.e. you can add all domains automatically at an instant.
- If you are a beginner to Pi-Hole, adding these sites resolves many problems. 
       
***
     
### Description
[whitelist.txt](https://raw.githubusercontent.com/Soundium/Pi_hole_Whitelist/master/domains/whitelist.txt) -- This file contains domains that are **safe** to whitelist, i.e. it does not include any tracking or advertising sites. Adding this file fixes many problems like YouTube watch history, videos on news sites, and so on. If you want to report additional domain, feel free to file an [issue](https://github.com/Soundium/Pi_hole_Whitelist/issues). 
             
***
           
### Installation and Usage
        
 ***For Docker installation***           
 Access you running Pi-Hole container by `docker exec -it <container-ID> bash` and proceed with the steps given below:
```
git clone https://github.com/Soundium/Pi_hole_Whitelist.git
cd Pi_hole_Whitelist/scripts
./whitelist.sh
```
If you keep the `/etc/pihole` on a volume outside the container you need to change `PIHOLE_LOCATION`and `GRAVITY_UPDATE_COMMAND` variables based on your setup.
         
***Manual installation***     
```
git clone https://github.com/Soundium/Pi_hole_Whitelist.git
cd Pi_hole_Whitelist/scripts
sudo chmod +x ./whitelist.sh
sudo ./whitelist.sh
```
**Note: You don't have to clone the repo every time you need to update whitelist file. Navigate to `Pi_hole_Whitelist/scripts` and run it again `sudo ./whitelist.sh`**
        

***For Automated Update***
```
cd /opt/
sudo git clone https://github.com/Soundium/Pi_hole_Whitelist.git
```

Give the rights.
```
sudo chmod +x /opt/Pi_hole_Whitelist/scripts/whitelist.sh
```

Make the script to run the script at 1AM every day.

`sudo nano /etc/crontab`

Add this line at the end of the file:       
`0 1 * * *   root    /opt/Pi_hole_Whitelist/scripts/whitelist.sh`

CTRL + X then Y and Enter

```
sudo /opt/Pi_hole_Whitelist/scripts/whitelist.sh
```

***     

### Donation
All donations are welcome and will help me to maintain this project. Please use "**Sponsor**" button on the top of this page.

***     
   
### License
```
MIT License

Copyright (c) 2020 Soundium

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```

