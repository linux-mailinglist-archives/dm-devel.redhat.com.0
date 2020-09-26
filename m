Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 95225279584
	for <lists+dm-devel@lfdr.de>; Sat, 26 Sep 2020 02:20:03 +0200 (CEST)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1601079602;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=qtT0hncEbn4cMm9QDGEYZnAINaEpWP7FPjgCG0fdVv8=;
	b=MYvPGfcs5tO4mUth1dX5KpRcs95VAFwulr7kTC3KLfsi91tHJ6mptB/mv8EUzg0umewkIy
	OLpVXyUbhBFaOtH2Xr7HueIeZqRPBAbAk1+8gAM9T+XtFFMmAIUWb1JpSvVPFyYQEoeL2G
	cTWEteryKY40Ze77ij4wjSrLw9scUmM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-518-maPPYkPPOQCKDcTCyznZnQ-1; Fri, 25 Sep 2020 20:20:00 -0400
X-MC-Unique: maPPYkPPOQCKDcTCyznZnQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E58431DE02;
	Sat, 26 Sep 2020 00:19:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6F7847367E;
	Sat, 26 Sep 2020 00:19:50 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 99A2379FF3;
	Sat, 26 Sep 2020 00:19:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08Q0JSkd016910 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 25 Sep 2020 20:19:28 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id CE02419D7C; Sat, 26 Sep 2020 00:19:28 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8C17819C66;
	Sat, 26 Sep 2020 00:19:25 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 08Q0JOJK005187; 
	Fri, 25 Sep 2020 19:19:24 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 08Q0JNwS005186;
	Fri, 25 Sep 2020 19:19:23 -0500
Date: Fri, 25 Sep 2020 19:19:23 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: mwilck@suse.com
Message-ID: <20200926001923.GI3384@octiron.msp.redhat.com>
References: <20200924133716.14120-1-mwilck@suse.com>
	<20200924133716.14120-22-mwilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20200924133716.14120-22-mwilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH v2 21/21] multipathd: remove logsink and udev
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Sep 24, 2020 at 03:37:16PM +0200, mwilck@suse.com wrote:
> From: Martin Wilck <mwilck@suse.com>
> 
> We can use the symbols from libmultipath now.
> 
Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>
> Signed-off-by: Martin Wilck <mwilck@suse.com>
> ---
>  multipathd/main.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/multipathd/main.c b/multipathd/main.c
> index 00b66ba..c5c374b 100644
> --- a/multipathd/main.c
> +++ b/multipathd/main.c
> @@ -115,7 +115,6 @@ struct mpath_event_param
>  	struct multipath *mpp;
>  };
>  
> -int logsink;
>  int uxsock_timeout;
>  int verbosity;
>  int bindings_read_only;
> @@ -151,8 +150,6 @@ int should_exit(void)
>   */
>  struct vectors * gvecs;
>  
> -struct udev * udev;
> -
>  struct config *multipath_conf;
>  
>  /* Local variables */
> @@ -3123,8 +3120,6 @@ child (__attribute__((unused)) void *param)
>  	conf = rcu_dereference(multipath_conf);
>  	rcu_assign_pointer(multipath_conf, NULL);
>  	call_rcu(&conf->rcu, rcu_free_config);
> -	udev_unref(udev);
> -	udev = NULL;
>  	pthread_attr_destroy(&waiter_attr);
>  	pthread_attr_destroy(&io_err_stat_attr);
>  #ifdef _DEBUG_
> @@ -3228,7 +3223,9 @@ main (int argc, char *argv[])
>  
>  	pthread_cond_init_mono(&config_cond);
>  
> -	udev = udev_new();
> +	libmultipath_init();
> +	if (atexit(libmultipath_exit))
> +		condlog(3, "failed to register exit handler for libmultipath");
>  	libmp_udev_set_sync_support(0);
>  
>  	while ((arg = getopt(argc, argv, ":dsv:k::Bniw")) != EOF ) {
> -- 
> 2.28.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

