Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 636071418CB
	for <lists+dm-devel@lfdr.de>; Sat, 18 Jan 2020 18:44:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579369460;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=XExv3KKkJO64OIKWam36e6mNf4rXalhqUijJHC7+iUk=;
	b=ME+nRiE6PnelhFGiHU/I2wC5SsZ0/sw6x+NHMVLx7XvFFT/v46MefqnsWL6iu/gmn1ASRr
	gXi5FofCUeNNZGK9L0YZamnDMP6gvkXdCEkz8md5fVkX6rpAEcjiXMLrf+pTCSO4ZX0iph
	2qFAYjOkd0kPaAFKkJhqSPr0/R8HNeY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-82-J4E10oGKMjSlC__2rkpl8g-1; Sat, 18 Jan 2020 12:44:18 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7CD5F8017CC;
	Sat, 18 Jan 2020 17:44:12 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5A9E160BEC;
	Sat, 18 Jan 2020 17:44:09 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5AE6E18089C8;
	Sat, 18 Jan 2020 17:44:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00IHhvmc021075 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 18 Jan 2020 12:43:57 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 16856A316E; Sat, 18 Jan 2020 17:43:57 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 128FAA3194
	for <dm-devel@redhat.com>; Sat, 18 Jan 2020 17:43:54 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 955F1803006
	for <dm-devel@redhat.com>; Sat, 18 Jan 2020 17:43:54 +0000 (UTC)
Received: from mail.stoffel.org (li1843-175.members.linode.com
	[172.104.24.175]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-261-1kk1-w7jNC6HOvmdMS4cng-1; Sat, 18 Jan 2020 12:43:50 -0500
Received: from quad.stoffel.org (66-189-75-104.dhcp.oxfr.ma.charter.com
	[66.189.75.104])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.stoffel.org (Postfix) with ESMTPSA id 4E3E622B4D;
	Sat, 18 Jan 2020 12:43:50 -0500 (EST)
Received: by quad.stoffel.org (Postfix, from userid 1000)
	id F30DDA5F1D; Sat, 18 Jan 2020 12:43:49 -0500 (EST)
MIME-Version: 1.0
Message-ID: <24099.17365.933723.879139@quad.stoffel.home>
Date: Sat, 18 Jan 2020 12:43:49 -0500
From: "John Stoffel" <john@stoffel.org>
To: Benjamin Marzinski <bmarzins@redhat.com>
In-Reply-To: <1579227500-17196-11-git-send-email-bmarzins@redhat.com>
References: <1579227500-17196-1-git-send-email-bmarzins@redhat.com>
	<1579227500-17196-11-git-send-email-bmarzins@redhat.com>
X-MC-Unique: 1kk1-w7jNC6HOvmdMS4cng-1
X-MC-Unique: J4E10oGKMjSlC__2rkpl8g-1
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 00IHhvmc021075
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: Re: [dm-devel] [PATCH 10/15] libmultipath: change how the checker
	async	is set
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

>>>>> "Benjamin" == Benjamin Marzinski <bmarzins@redhat.com> writes:

Benjamin> The way that the checkers async mode worked in multipathd didn't make
Benjamin> much sense. When multipathd starts up, all checker classes are in the
Benjamin> sync mode, and any pathinfo() calls on devices would run the checker in
Benjamin> sync mode. However, the First time a checker class was used in
Benjamin> checkerloop, it would set that checker class to async (assuming
Benjamin> force_sync wasn't set).  After that, no matter when a checker from that
Benjamin> class was called, it would always run in async mode.  Multipathd doesn't
Benjamin> need to run checkers in sync mode at all, so don't.

Sorry, I had a hard time parsing this description, especially the last
sentence.  Do you mean that checkers should default to async then,
instead of sync mode?  And from looking at the code, don't you mean
that you force sync mode?  I guess the question is whether checker
classes should default sync, or async.  And if they move to async,
should they stay there?
    


Benjamin> Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
Benjamin> ---
Benjamin>  libmpathpersist/mpath_persist.c |  2 +-
Benjamin>  libmultipath/discovery.c        | 10 ++++------
Benjamin>  multipath/main.c                |  1 +
Benjamin>  3 files changed, 6 insertions(+), 7 deletions(-)

Benjamin> diff --git a/libmpathpersist/mpath_persist.c b/libmpathpersist/mpath_persist.c
Benjamin> index 603cfc3b..b2238f00 100644
Benjamin> --- a/libmpathpersist/mpath_persist.c
Benjamin> +++ b/libmpathpersist/mpath_persist.c
Benjamin> @@ -47,7 +47,7 @@ mpath_lib_init (void)
Benjamin>  		condlog(0, "Failed to initialize multipath config.");
Benjamin>  		return NULL;
Benjamin>  	}
Benjamin> -
Benjamin> +	conf->force_sync = 1;
Benjamin>  	set_max_fds(conf->max_fds);
 
Benjamin>  	return conf;
Benjamin> diff --git a/libmultipath/discovery.c b/libmultipath/discovery.c
Benjamin> index d2773c3a..1ab093f4 100644
Benjamin> --- a/libmultipath/discovery.c
Benjamin> +++ b/libmultipath/discovery.c
Benjamin> @@ -1643,12 +1643,10 @@ get_state (struct path * pp, struct config *conf, int daemon, int oldstate)
Benjamin>  	if (pp->mpp && !c->mpcontext)
Benjamin>  		checker_mp_init(c, &pp->mpp->mpcontext);
Benjamin>  	checker_clear_message(c);
Benjamin> -	if (daemon) {
Benjamin> -		if (conf->force_sync == 0)
Benjamin> -			checker_set_async(c);
Benjamin> -		else
Benjamin> -			checker_set_sync(c);
Benjamin> -	}
Benjamin> +	if (conf->force_sync == 0)
Benjamin> +		checker_set_async(c);
Benjamin> +	else
Benjamin> +		checker_set_sync(c);
Benjamin>  	if (!conf->checker_timeout &&
Benjamin>  	    sysfs_get_timeout(pp, &(c->timeout)) <= 0)
c-> timeout = DEF_TIMEOUT;
Benjamin> diff --git a/multipath/main.c b/multipath/main.c
Benjamin> index 4f4d8e89..aebabd9b 100644
Benjamin> --- a/multipath/main.c
Benjamin> +++ b/multipath/main.c
Benjamin> @@ -905,6 +905,7 @@ main (int argc, char *argv[])
Benjamin>  		exit(RTVL_FAIL);
Benjamin>  	multipath_conf = conf;
conf-> retrigger_tries = 0;
Benjamin> +	conf->force_sync = 1;
Benjamin>  	while ((arg = getopt(argc, argv, ":adcChl::FfM:v:p:b:BrR:itTquUwW")) != EOF ) {
Benjamin>  		switch(arg) {
Benjamin>  		case 1: printf("optarg : %s\n",optarg);
Benjamin> -- 
Benjamin> 2.17.2

Benjamin> --
Benjamin> dm-devel mailing list
Benjamin> dm-devel@redhat.com
Benjamin> https://www.redhat.com/mailman/listinfo/dm-devel


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

