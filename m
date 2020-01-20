Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id AA30C142E63
	for <lists+dm-devel@lfdr.de>; Mon, 20 Jan 2020 16:08:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579532911;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=OSH27NhDEteQxHBK+Qn1xeHzIjobqUZnkej1MgCQ8mQ=;
	b=GYq1Trn/luGMRnNjuSRpnCGE4TFR7P+NHtA9181yw/dhfVE4JQEsQYXDhXw2v3EwJUH08I
	w7v4rIQBhiJOB2VYrDCHvju2ieBzJ7AWMd/tzRM+fbkcIFFaKk2rfhDHH1cL1Td2DVn8D1
	i2YtSyk6mm6BUb2EEcHa6QuEFVts86c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-46-Sqvh_0PpPWyFRk7b9mHZpA-1; Mon, 20 Jan 2020 10:08:29 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2FE0A802B9F;
	Mon, 20 Jan 2020 15:08:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C052A858BE;
	Mon, 20 Jan 2020 15:08:16 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DC30D1808878;
	Mon, 20 Jan 2020 15:08:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00KF7oWo019473 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 20 Jan 2020 10:07:50 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id A63C95D9E1; Mon, 20 Jan 2020 15:07:50 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1ECE45D9C5;
	Mon, 20 Jan 2020 15:07:48 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 00KF7kYB009774; 
	Mon, 20 Jan 2020 09:07:47 -0600
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 00KF7jCU009773;
	Mon, 20 Jan 2020 09:07:45 -0600
Date: Mon, 20 Jan 2020 09:07:45 -0600
From: Benjamin Marzinski <bmarzins@redhat.com>
To: John Stoffel <john@stoffel.org>
Message-ID: <20200120150745.GO30153@octiron.msp.redhat.com>
References: <1579227500-17196-1-git-send-email-bmarzins@redhat.com>
	<1579227500-17196-11-git-send-email-bmarzins@redhat.com>
	<24099.17365.933723.879139@quad.stoffel.home>
MIME-Version: 1.0
In-Reply-To: <24099.17365.933723.879139@quad.stoffel.home>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: Re: [dm-devel] [PATCH 10/15] libmultipath: change how the checker
 async is set
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
X-MC-Unique: Sqvh_0PpPWyFRk7b9mHZpA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Sat, Jan 18, 2020 at 12:43:49PM -0500, John Stoffel wrote:
> >>>>> "Benjamin" == Benjamin Marzinski <bmarzins@redhat.com> writes:
> 
> Benjamin> The way that the checkers async mode worked in multipathd didn't make
> Benjamin> much sense. When multipathd starts up, all checker classes are in the
> Benjamin> sync mode, and any pathinfo() calls on devices would run the checker in
> Benjamin> sync mode. However, the First time a checker class was used in
> Benjamin> checkerloop, it would set that checker class to async (assuming
> Benjamin> force_sync wasn't set).  After that, no matter when a checker from that
> Benjamin> class was called, it would always run in async mode.  Multipathd doesn't
> Benjamin> need to run checkers in sync mode at all, so don't.
> 
> Sorry, I had a hard time parsing this description, especially the last
> sentence.  Do you mean that checkers should default to async then,
> instead of sync mode?  And from looking at the code, don't you mean
> that you force sync mode?  I guess the question is whether checker
> classes should default sync, or async.  And if they move to async,
> should they stay there?
>     

Sorry. I mean that right now multipathd runs the checkers from pathinfo(),
wait_for_pending_paths() and check_path(). When multipathd starts, all
checkers are in sync mode. The first time a checker is run from
check_path(), it is switched to async mode, and stays there for the rest
of the time multipathd is runing.

There is no need for multipathd to run checkers in sync mode at all, so
we shouldn't be doing so for these first checks.

-Ben

> 
> 
> Benjamin> Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
> Benjamin> ---
> Benjamin>  libmpathpersist/mpath_persist.c |  2 +-
> Benjamin>  libmultipath/discovery.c        | 10 ++++------
> Benjamin>  multipath/main.c                |  1 +
> Benjamin>  3 files changed, 6 insertions(+), 7 deletions(-)
> 
> Benjamin> diff --git a/libmpathpersist/mpath_persist.c b/libmpathpersist/mpath_persist.c
> Benjamin> index 603cfc3b..b2238f00 100644
> Benjamin> --- a/libmpathpersist/mpath_persist.c
> Benjamin> +++ b/libmpathpersist/mpath_persist.c
> Benjamin> @@ -47,7 +47,7 @@ mpath_lib_init (void)
> Benjamin>  		condlog(0, "Failed to initialize multipath config.");
> Benjamin>  		return NULL;
> Benjamin>  	}
> Benjamin> -
> Benjamin> +	conf->force_sync = 1;
> Benjamin>  	set_max_fds(conf->max_fds);
>  
> Benjamin>  	return conf;
> Benjamin> diff --git a/libmultipath/discovery.c b/libmultipath/discovery.c
> Benjamin> index d2773c3a..1ab093f4 100644
> Benjamin> --- a/libmultipath/discovery.c
> Benjamin> +++ b/libmultipath/discovery.c
> Benjamin> @@ -1643,12 +1643,10 @@ get_state (struct path * pp, struct config *conf, int daemon, int oldstate)
> Benjamin>  	if (pp->mpp && !c->mpcontext)
> Benjamin>  		checker_mp_init(c, &pp->mpp->mpcontext);
> Benjamin>  	checker_clear_message(c);
> Benjamin> -	if (daemon) {
> Benjamin> -		if (conf->force_sync == 0)
> Benjamin> -			checker_set_async(c);
> Benjamin> -		else
> Benjamin> -			checker_set_sync(c);
> Benjamin> -	}
> Benjamin> +	if (conf->force_sync == 0)
> Benjamin> +		checker_set_async(c);
> Benjamin> +	else
> Benjamin> +		checker_set_sync(c);
> Benjamin>  	if (!conf->checker_timeout &&
> Benjamin>  	    sysfs_get_timeout(pp, &(c->timeout)) <= 0)
> c-> timeout = DEF_TIMEOUT;
> Benjamin> diff --git a/multipath/main.c b/multipath/main.c
> Benjamin> index 4f4d8e89..aebabd9b 100644
> Benjamin> --- a/multipath/main.c
> Benjamin> +++ b/multipath/main.c
> Benjamin> @@ -905,6 +905,7 @@ main (int argc, char *argv[])
> Benjamin>  		exit(RTVL_FAIL);
> Benjamin>  	multipath_conf = conf;
> conf-> retrigger_tries = 0;
> Benjamin> +	conf->force_sync = 1;
> Benjamin>  	while ((arg = getopt(argc, argv, ":adcChl::FfM:v:p:b:BrR:itTquUwW")) != EOF ) {
> Benjamin>  		switch(arg) {
> Benjamin>  		case 1: printf("optarg : %s\n",optarg);
> Benjamin> -- 
> Benjamin> 2.17.2
> 
> Benjamin> --
> Benjamin> dm-devel mailing list
> Benjamin> dm-devel@redhat.com
> Benjamin> https://www.redhat.com/mailman/listinfo/dm-devel

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

