#!/usr/bin/env python

""" Scrapes a tumblr log to a single HTML file per post, that you can import into 
evernote 
"""
import argparse
import urllib, urllib2
import json
from datetime import datetime
import os
import sys
import re

TUMBLR_API = 'http://api.tumblr.com/v2/blog/{blogname}/posts?api_key={key}'
ADD_TAGS = ['tumblr2evernote']

def html(post):
    for field in ['title', 'text', 'caption', 'source', 'description', 'answer', 'body']:
        if field in post:
            post[field] = post[field].encode('ascii', 'xmlcharrefreplace')

    # HEADER
    htmlcontent = u'---\n'

    if 'title' in post:
        title = post['title']
    else:
        title = ' '.join(post['slug'].split('-')).capitalize()

    date = datetime.fromtimestamp(post['timestamp'])

    htmlcontent += 'title: %s\n' % title

    htmlcontent += 'tags: %s\n' % ' '.join(post['tags'] + ADD_TAGS)

    htmlcontent += 'date: %s\n' % date.strftime("%d %B %Y" )

    htmlcontent += '---\n'

    # CONTENT
    if 'title' in post:
        htmlcontent += '<h1>%s</h1>\n' % post['title']

    if 'photos' in post:
        for photo in post['photos']:
            largest = max(photo['alt_sizes'], key=lambda p: p['width'] * p['height'])
            htmlcontent += '<img src="{url}"/>\n'.format(url=largest['url'])
            htmlcontent += '<p>{caption}</p>\n'.format(caption=photo['caption'])

    if 'body' in post:
        htmlcontent += post['body']
        htmlcontent += '\n'

    if 'text' in post:
        htmlcontent += '<blockquote>{text}</blockquote>'.format(text=post['text'])
        htmlcontent += '\n'

    if 'url' in post:
        htmlcontent += '<a href="{url}">{title}</a>'.format(url=post['url'], title=post['title'])
        htmlcontent += '\n'

    if 'description' in post:
        htmlcontent += post['description']
        htmlcontent += '\n'

    if post['type'] == 'audio':
        if 'artist' in post and 'track' in post:
            htmlcontent += '{artist} - {track}'
        htmlcontent += post['player']
        htmlcontent += '\n'

    if post['type'] == 'video':
        largest = max(post['player'], key=lambda p: p['width'])
        embedcode = largest['embed_code']
        thumb = None

        if 'youtube' in embedcode:
            vid = filter(None, re.findall(r'\/v\/(.{11})|\/embed\/(.{11})', embedcode)[0])[0]
            vidurl = "http://www.youtube.com/watch?v={vid}".format(vid=vid)
            thumb = "http://img.youtube.com/vi/{vid}/hqdefault.jpg".format(vid=vid)
        elif 'vimeo' in embedcode:
            vid = filter(None, re.findall(r'vimeo\.com\/([0-9]{1,10})|player\.vimeo\.com\/video/([0-9]*)', embedcode)[0])[0]
            vidurl = "http://vimeo.com/{vid}".format(vid=vid)
            try:
                vidinfo = json.loads(urllib2.urlopen("http://vimeo.com/api/v2/video/{vid}.json".format(vid=vid)).read())
                thumb = vidinfo[0]["thumbnail_large"]
            except urllib2.HTTPError as e:
                pass
        else:
            vidurl = None


        htmlcontent += largest['embed_code']

        if vidurl is not None:
            if thumb is not None:
                htmlcontent += '<p><a href="{url}"><img src="{thumb}"/></a></p>'.format(url=vidurl, thumb=thumb)
            else:
                htmlcontent += '<p><a href="{url}">Video</a></p>'.format(url=vidurl)
            htmlcontent += '\n'

    if post['type'] == 'answer':
        htmlcontent += '<p><strong><a href="{url}">{asker}</a></strong>: {question}<br/>{answer}</p>'.format(
            url=post['asking_url'], asker=post['asking_name'], question=post['question'], answer=post['answer'])

    if 'caption' in post:
        htmlcontent += post['caption']
        htmlcontent += '\n'

    if 'source' in post:
        htmlcontent += post['source']
        htmlcontent += '\n'

    if 'source_url' in post and 'source_title' in post:
        htmlcontent += '<p><a href="{url}">{title}</a></p>'.format(url=post['source_url'], title=post['source_title'])
        htmlcontent += '\n'

    htmlcontent += '<p><a href="{url}">tumblr</a></p>'.format(url=post['post_url'])


    return htmlcontent
    

def main(blog, api_key, startdate=None):
    print "Retrieving posts from %s " % blog
    print "Starting at %s " % startdate
    offset = 0

    dirname = blog
    if startdate is not None:
        dirname += '_' + startdate.strftime('%Y-%m-%d')

    getnext = True
    while getnext:
        args = {
                'offset': offset,
                'filter': 'raw',
                }
        url = TUMBLR_API.format(blogname=blog,key=api_key) + '&' + urllib.urlencode(args)

        print url

        response = json.loads(urllib2.urlopen(url).read())
        # response = json.load(open('response.json'))
        posts = response['response']['posts']
        if not posts:
            getnext = False
        offset += len(posts)
        for post in posts:
            date = datetime.fromtimestamp(post['timestamp'])
            if startdate is None or date >= startdate:
                filename = '{date}-{slug}'.format(date=date.strftime('%Y-%m-%d'), slug=post['slug'])
                print "Wrote post %s " % filename
                try:
                    os.mkdir(dirname)
                except OSError:
                    pass
                open(os.path.join(dirname, filename + '.html'), 'wb').write(html(post))
            else:
                getnext = False
        


if __name__ == '__main__':
    
    def mkdate(datestr):
        return datetime.strptime(datestr, '%Y-%m-%d')

    parser = argparse.ArgumentParser(description='Scrape a tumblr.')
    parser.add_argument('blog', type=str, help='URL of the blog to scrape')
    parser.add_argument('apikey', type=str, help='A tumblr API key.')
    parser.add_argument('-s', '--startdate', type=mkdate, help='Scrape entries starting at this date (YYYY-MM-DD).')
    args = parser.parse_args()
    main(args.blog, args.apikey, args.startdate)