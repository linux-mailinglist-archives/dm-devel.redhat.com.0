Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 1496A159C8C
	for <lists+dm-devel@lfdr.de>; Tue, 11 Feb 2020 23:49:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1581461344;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=UKFsnvNaCu8rDhipNwizPDfOweH35lcq1kQ6FJJHiYU=;
	b=RxoMV1cb1EceCxGNr3CbpKCR5rOsc1bzCoqxCDicwG9NhR/uqua2JSXwmhQTVji6kp64tm
	SrQsRJF5SP2T4/837DF8AJz+9KbOrc79bouzMNRXKEdodzGjExd8oCsqQG7bhWfTNCYhUB
	IK7Qw5EbTonsWqSevv0d3edtBkmyqM0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-230-n7ZLDuB9Nja6tBl5sl4C2Q-1; Tue, 11 Feb 2020 17:49:02 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6F9E1A0CD1;
	Tue, 11 Feb 2020 22:48:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 86B8389E94;
	Tue, 11 Feb 2020 22:48:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CF7F7866C6;
	Tue, 11 Feb 2020 22:48:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01BMm0fi003798 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 11 Feb 2020 17:48:00 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 452F426E7E; Tue, 11 Feb 2020 22:48:00 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D290D19C69;
	Tue, 11 Feb 2020 22:47:57 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 01BMluRx009739; 
	Tue, 11 Feb 2020 16:47:56 -0600
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 01BMlu1c009738;
	Tue, 11 Feb 2020 16:47:56 -0600
Date: Tue, 11 Feb 2020 16:47:55 -0600
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Martin Wilck <mwilck@suse.com>
Message-ID: <20200211224755.GH30153@octiron.msp.redhat.com>
References: <1580929100-32572-1-git-send-email-bmarzins@redhat.com>
	<1580929100-32572-4-git-send-email-bmarzins@redhat.com>
	<10b549834e581e0ec3b9aba230c2f01c43db6c11.camel@suse.com>
MIME-Version: 1.0
In-Reply-To: <10b549834e581e0ec3b9aba230c2f01c43db6c11.camel@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH v2 03/17] libmultipath: fix leak in foreign
	code
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: n7ZLDuB9Nja6tBl5sl4C2Q-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Tue, Feb 11, 2020 at 10:36:19AM +0100, Martin Wilck wrote:
> Hi Ben, hi Christophe,
> 
> On Wed, 2020-02-05 at 12:58 -0600, Benjamin Marzinski wrote:
> > If scandir fails or finds no foreign libraries, enable_re needs to be
> > freed before exitting.
> > 
> > Fixes: 8d03eda4 'multipath.conf: add "enable_foreign" parameter'
> > Reviewed-by: Martin Wilck <mwilck@suse.com>
> > Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
> > ---
> >  libmultipath/foreign.c | 11 +++++++----
> >  1 file changed, 7 insertions(+), 4 deletions(-)
> 
> While trying to merge your series into my tree, I realized that this
> patch conflicts with my previously submitted patch "libmultipath:
> _init_foreign(): fix possible memory leak"
> https://www.redhat.com/archives/dm-devel/2019-October/msg00104.html
> which fixed the same issue.
> 
> The two patches are almost equal, so I really don't care which one
> is eventually taken. I just wanted to alert Christophe about the
> conflict.
> 
> Anyway, I thought that you'd ACK'd my October 72-part patch series in
> the following messages:
> 
> https://www.redhat.com/archives/dm-devel/2019-October/msg00214.html
>   (Ben: ACK on v2 of 72-part series "multipath-tools: cleanup and
> warning enablement", except 16/72 "libmultipath: make path_discovery()
> pthread_cancel()-safe")
> https://www.redhat.com/archives/dm-devel/2019-November/msg00016.html
>   (Ben: ACK on 16/72 "libmultipath: make path_discovery()
> pthread_cancel()-safe", after discussion)
> https://www.redhat.com/archives/dm-devel/2019-November/msg00085.html
>   (Ben: Ack on v2->v3 change, updated patch v3 45/72 "libmultipath: fix
> -Wsign-compare warnings with snprintf()")
> 
> Please clarify if I misunderstood that and the series still needs work
> from your PoV.

No. Your fix is fine. It's my bad. I didn't rebase my branch on top of
your fixes.

-Ben
 
> Regards
> Martin
> 
> 
> > 
> > diff --git a/libmultipath/foreign.c b/libmultipath/foreign.c
> > index 4b34e141..68e9a9b8 100644
> > --- a/libmultipath/foreign.c
> > +++ b/libmultipath/foreign.c
> > @@ -129,7 +129,7 @@ static int _init_foreign(const char
> > *multipath_dir, const char *enable)
> >  	char pathbuf[PATH_MAX];
> >  	struct dirent **di;
> >  	struct scandir_result sr;
> > -	int r, i;
> > +	int r, i, ret = 0;
> >  	regex_t *enable_re = NULL;
> >  
> >  	foreigns = vector_alloc();
> > @@ -157,13 +157,15 @@ static int _init_foreign(const char
> > *multipath_dir, const char *enable)
> >  	if (r == 0) {
> >  		condlog(3, "%s: no foreign multipath libraries found",
> >  			__func__);
> > -		return 0;
> > +		ret = 0;
> > +		goto out;
> >  	} else if (r < 0) {
> >  		r = errno;
> >  		condlog(1, "%s: error %d scanning foreign multipath
> > libraries",
> >  			__func__, r);
> >  		_cleanup_foreign();
> > -		return -r;
> > +		ret = -r;
> > +		goto out;
> >  	}
> >  
> >  	sr.di = di;
> > @@ -250,8 +252,9 @@ static int _init_foreign(const char
> > *multipath_dir, const char *enable)
> >  		free_foreign(fgn);
> >  	}
> >  	pthread_cleanup_pop(1); /* free_scandir_result */
> > +out:
> >  	pthread_cleanup_pop(1); /* free_pre */
> > -	return 0;
> > +	return ret;
> >  }
> >  
> >  int init_foreign(const char *multipath_dir, const char *enable)
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

