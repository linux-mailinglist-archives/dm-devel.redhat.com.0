Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 6250340D088
	for <lists+dm-devel@lfdr.de>; Thu, 16 Sep 2021 02:02:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1631750556;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=uJNfye+N2/M4fWGd8ySY+wYjhLACFylwZKqzdy7aOos=;
	b=YvKtYwrdiCB2GOKQCwHdfeoabIzAWDdzEpb+mH0PQgCzkZ4Ea0zw/5RgjKKTD7XRwN5kXZ
	PTevrEhUDTQTQUvizKuJhgDgXoGTSy9dxIYqF+AoE82eaJBl1ENP5OeD2D2Q/maZyspthe
	ZVdvH0w87oBCBpACQEqcyf+fVvZQtJk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-262-JfOmK6lGNX6xwEoOW_paww-1; Wed, 15 Sep 2021 20:02:34 -0400
X-MC-Unique: JfOmK6lGNX6xwEoOW_paww-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3DE7B1084685;
	Thu, 16 Sep 2021 00:02:29 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A6AF75C1C5;
	Thu, 16 Sep 2021 00:02:28 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B07B34E58E;
	Thu, 16 Sep 2021 00:02:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 18G01Xpd015572 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 15 Sep 2021 20:01:33 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7002B60C9F; Thu, 16 Sep 2021 00:01:33 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (unknown [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F006E60CA0;
	Thu, 16 Sep 2021 00:01:30 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 18G01Tdt006879; 
	Wed, 15 Sep 2021 19:01:29 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 18G01SLZ006878;
	Wed, 15 Sep 2021 19:01:28 -0500
Date: Wed, 15 Sep 2021 19:01:28 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: mwilck@suse.com
Message-ID: <20210916000128.GX3087@octiron.msp.redhat.com>
References: <20210910114120.13665-1-mwilck@suse.com>
	<20210910114120.13665-13-mwilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20210910114120.13665-13-mwilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: lixiaokeng@huawei.com, dm-devel@redhat.com,
	Chongyun Wu <wu.chongyun@h3c.com>
Subject: Re: [dm-devel] [PATCH 12/35] multipathd: add and set cli_handlers
 in a single step
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Sep 10, 2021 at 01:40:57PM +0200, mwilck@suse.com wrote:
> From: Martin Wilck <mwilck@suse.com>
> 
> Modify set_handler_callback() such that a missing slot is created
> if no matching slot is found. This way, we can skip the initialization
> with NULL handlers on startup.
> 
> Signed-off-by: Martin Wilck <mwilck@suse.com>
> ---
>  multipathd/cli.c | 85 +++++++-----------------------------------------
>  multipathd/cli.h |  6 ++--
>  2 files changed, 15 insertions(+), 76 deletions(-)
> 
> diff --git a/multipathd/cli.c b/multipathd/cli.c
> index 5213813..7020d2b 100644
> --- a/multipathd/cli.c
> +++ b/multipathd/cli.c
> @@ -100,26 +100,20 @@ find_handler (uint64_t fp)
>  }
>  
>  int
> -set_handler_callback (uint64_t fp, cli_handler *fn)
> +__set_handler_callback (uint64_t fp, cli_handler *fn, bool locked)
>  {
> -	struct handler * h = find_handler(fp);
> +	struct handler *h = find_handler(fp);
>  

Wouldn't it be a bug if we reset the handler? Is this really something
we need to check for? Also, if add_handler() just returned a pointer to
the handler, we wouldn't need to call fail_handler() immediately after
creating it.

-Ben

> -	if (!h)
> +	if (!h) {
> +		add_handler(fp, fn);
> +		h = find_handler(fp);
> +	}
> +	if (!h) {
> +		condlog(0, "%s: failed to set handler for code %"PRIu64,
> +			__func__, fp);
>  		return 1;
> -	h->fn = fn;
> -	h->locked = 1;
> -	return 0;
> -}
> -
> -int
> -set_unlocked_handler_callback (uint64_t fp, cli_handler *fn)
> -{
> -	struct handler * h = find_handler(fp);
> -
> -	if (!h)
> -		return 1;
> -	h->fn = fn;
> -	h->locked = 0;
> +	}
> +	h->locked = locked;
>  	return 0;
>  }
>  
> @@ -513,63 +507,6 @@ cli_init (void) {
>  	if (alloc_handlers())
>  		return 1;
>  
> -	add_handler(LIST+PATHS, NULL);
> -	add_handler(LIST+PATHS+FMT, NULL);
> -	add_handler(LIST+PATHS+RAW+FMT, NULL);
> -	add_handler(LIST+PATH, NULL);
> -	add_handler(LIST+STATUS, NULL);
> -	add_handler(LIST+DAEMON, NULL);
> -	add_handler(LIST+MAPS, NULL);
> -	add_handler(LIST+MAPS+STATUS, NULL);
> -	add_handler(LIST+MAPS+STATS, NULL);
> -	add_handler(LIST+MAPS+FMT, NULL);
> -	add_handler(LIST+MAPS+RAW+FMT, NULL);
> -	add_handler(LIST+MAPS+TOPOLOGY, NULL);
> -	add_handler(LIST+MAPS+JSON, NULL);
> -	add_handler(LIST+TOPOLOGY, NULL);
> -	add_handler(LIST+MAP+TOPOLOGY, NULL);
> -	add_handler(LIST+MAP+JSON, NULL);
> -	add_handler(LIST+MAP+FMT, NULL);
> -	add_handler(LIST+MAP+RAW+FMT, NULL);
> -	add_handler(LIST+CONFIG, NULL);
> -	add_handler(LIST+CONFIG+LOCAL, NULL);
> -	add_handler(LIST+BLACKLIST, NULL);
> -	add_handler(LIST+DEVICES, NULL);
> -	add_handler(LIST+WILDCARDS, NULL);
> -	add_handler(RESET+MAPS+STATS, NULL);
> -	add_handler(RESET+MAP+STATS, NULL);
> -	add_handler(ADD+PATH, NULL);
> -	add_handler(DEL+PATH, NULL);
> -	add_handler(ADD+MAP, NULL);
> -	add_handler(DEL+MAP, NULL);
> -	add_handler(DEL+MAPS, NULL);
> -	add_handler(SWITCH+MAP+GROUP, NULL);
> -	add_handler(RECONFIGURE, NULL);
> -	add_handler(SUSPEND+MAP, NULL);
> -	add_handler(RESUME+MAP, NULL);
> -	add_handler(RESIZE+MAP, NULL);
> -	add_handler(RESET+MAP, NULL);
> -	add_handler(RELOAD+MAP, NULL);
> -	add_handler(DISABLEQ+MAP, NULL);
> -	add_handler(RESTOREQ+MAP, NULL);
> -	add_handler(DISABLEQ+MAPS, NULL);
> -	add_handler(RESTOREQ+MAPS, NULL);
> -	add_handler(REINSTATE+PATH, NULL);
> -	add_handler(FAIL+PATH, NULL);
> -	add_handler(QUIT, NULL);
> -	add_handler(SHUTDOWN, NULL);
> -	add_handler(GETPRSTATUS+MAP, NULL);
> -	add_handler(SETPRSTATUS+MAP, NULL);
> -	add_handler(UNSETPRSTATUS+MAP, NULL);
> -	add_handler(GETPRKEY+MAP, NULL);
> -	add_handler(SETPRKEY+MAP+KEY, NULL);
> -	add_handler(UNSETPRKEY+MAP, NULL);
> -	add_handler(FORCEQ+DAEMON, NULL);
> -	add_handler(RESTOREQ+DAEMON, NULL);
> -	add_handler(SETMARGINAL+PATH, NULL);
> -	add_handler(UNSETMARGINAL+PATH, NULL);
> -	add_handler(UNSETMARGINAL+MAP, NULL);
> -
>  	return 0;
>  }
>  
> diff --git a/multipathd/cli.h b/multipathd/cli.h
> index 3dac1b4..dbb75be 100644
> --- a/multipathd/cli.h
> +++ b/multipathd/cli.h
> @@ -134,8 +134,10 @@ struct handler {
>  
>  int alloc_handlers (void);
>  int add_handler (uint64_t fp, cli_handler *fn);
> -int set_handler_callback (uint64_t fp, cli_handler *fn);
> -int set_unlocked_handler_callback (uint64_t fp, cli_handler *fn);
> +int __set_handler_callback (uint64_t fp, cli_handler *fn, bool locked);
> +#define set_handler_callback(fp, fn) __set_handler_callback(fp, fn, true)
> +#define set_unlocked_handler_callback(fp, fn) __set_handler_callback(fp, fn, false)
> +
>  int parse_cmd (char * cmd, char ** reply, int * len, void *, int);
>  int load_keys (void);
>  char * get_keyparam (vector v, uint64_t code);
> -- 
> 2.33.0

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

