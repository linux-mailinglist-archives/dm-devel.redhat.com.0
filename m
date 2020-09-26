Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id B8F8B27960B
	for <lists+dm-devel@lfdr.de>; Sat, 26 Sep 2020 03:52:53 +0200 (CEST)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1601085172;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=vpC9vWcnvR+XYYgJMpc0pa2bz0tpS+HMLsqLgSR+X4k=;
	b=fjRTzwij+YQcBIxGiryGQyo9PsxuVkyNLG8f0FWJbW4gKNZkMPnQJS9Y209iD/t02ylOJK
	9uZc1mYYnerxooRFPKEdZ+IaPJgNk0sIZ4J2nzzl1Z9dpZbWTKP8yXSYpESyYemr0I5Z2k
	qDVhQKoNvM0yEOzfCGsv5q68rN/a1t4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-319-vQJHtz-lMTuGxn_xg7R2Dw-1; Fri, 25 Sep 2020 21:52:50 -0400
X-MC-Unique: vQJHtz-lMTuGxn_xg7R2Dw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DCEBD10066FC;
	Sat, 26 Sep 2020 01:52:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 227085C1BB;
	Sat, 26 Sep 2020 01:52:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E2AE379DA9;
	Sat, 26 Sep 2020 01:52:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08Q1qDMv024855 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 25 Sep 2020 21:52:13 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 312B05C1C2; Sat, 26 Sep 2020 01:52:13 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C97B15C1BB;
	Sat, 26 Sep 2020 01:52:09 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 08Q1q8dC005519; 
	Fri, 25 Sep 2020 20:52:08 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 08Q1q7dP005518;
	Fri, 25 Sep 2020 20:52:07 -0500
Date: Fri, 25 Sep 2020 20:52:07 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: mwilck@suse.com
Message-ID: <20200926015207.GJ3384@octiron.msp.redhat.com>
References: <20200924134054.14632-1-mwilck@suse.com>
	<20200924134054.14632-2-mwilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20200924134054.14632-2-mwilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: lixiaokeng@huawei.com, dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH 01/23] multipathd: uxlsnr: avoid deadlock on
	exit
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Sep 24, 2020 at 03:40:32PM +0200, mwilck@suse.com wrote:
> From: Martin Wilck <mwilck@suse.com>
> 
> The uxlsnr wouldn't always release the client lock when cancelled,
> causing a deadlock in uxsock_cleanup(). While this hasn't been
> caused by commit 3d611a2, the deadlock seems to have become much
> more likely after that patch. Solving this means that we have to
> treat reallocation failure of the pollfd array differently.
> We will now just ignore any clients above the last valid pfd index.
> That's a minor problem, as we're in an OOM situation anyway.
> 
> Moreover, client_lock is not a "struct lock", but a plain
> pthread_mutex_t.
> 
> Fixes: 3d611a2 ("multipathd: cancel threads early during shutdown")
> Signed-off-by: Martin Wilck <mwilck@suse.com>
> ---
>  multipathd/uxlsnr.c | 17 ++++++++++-------
>  1 file changed, 10 insertions(+), 7 deletions(-)
> 
> diff --git a/multipathd/uxlsnr.c b/multipathd/uxlsnr.c
> index 1c5ce9d..d47ba1a 100644
> --- a/multipathd/uxlsnr.c
> +++ b/multipathd/uxlsnr.c
> @@ -35,6 +35,7 @@
>  #include "config.h"
>  #include "mpath_cmd.h"
>  #include "time-util.h"
> +#include "util.h"
>  
>  #include "main.h"
>  #include "cli.h"
> @@ -116,7 +117,7 @@ static void _dead_client(struct client *c)
>  
>  static void dead_client(struct client *c)
>  {
> -	pthread_cleanup_push(cleanup_lock, &client_lock);
> +	pthread_cleanup_push(cleanup_mutex, &client_lock);
>  	pthread_mutex_lock(&client_lock);
>  	_dead_client(c);
>  	pthread_cleanup_pop(1);
> @@ -306,6 +307,7 @@ void * uxsock_listen(uxsock_trigger_fn uxsock_trigger, long ux_sock,
>  
>  		/* setup for a poll */
>  		pthread_mutex_lock(&client_lock);
> +		pthread_cleanup_push(cleanup_mutex, &client_lock);
>  		num_clients = 0;
>  		list_for_each_entry(c, &clients, node) {
>  			num_clients++;
> @@ -322,14 +324,13 @@ void * uxsock_listen(uxsock_trigger_fn uxsock_trigger, long ux_sock,
>  						sizeof(struct pollfd));
>  			}
>  			if (!new) {
> -				pthread_mutex_unlock(&client_lock);
>  				condlog(0, "%s: failed to realloc %d poll fds",
>  					"uxsock", 2 + num_clients);
> -				sched_yield();
> -				continue;
> +				num_clients = old_clients;

O.k. I'm getting way into the theoretical weeds here, but I believe that
realloc() is technically allowed to return NULL when it shrinks
allocated memory. In this case num_clients would be too big.  Later in
this function, when we loop through num_clients

                for (i = 2; i < num_clients + 2; i++) {
                        if (polls[i].revents & POLLIN) {
 
We could look at an unused polls entry, since its revents doesn't get
cleared. It's also possible that the fd of this unused entry matches the
fd of an existing client. Then we could try to get a packet from a
client that isn't sending one, and kill that client. Yeah, this will
almost certainly never happen.  But we could just zero out the revents
field, or loop over the actual number of structures we polled, and then
it can't happen.

-Ben

> +			} else {
> +				old_clients = num_clients;
> +				polls = new;
>  			}
> -			old_clients = num_clients;
> -			polls = new;
>  		}
>  		polls[0].fd = ux_sock;
>  		polls[0].events = POLLIN;
> @@ -347,8 +348,10 @@ void * uxsock_listen(uxsock_trigger_fn uxsock_trigger, long ux_sock,
>  			polls[i].fd = c->fd;
>  			polls[i].events = POLLIN;
>  			i++;
> +			if (i >= 2 + num_clients)
> +				break;
>  		}
> -		pthread_mutex_unlock(&client_lock);
> +		pthread_cleanup_pop(1);
>  
>  		/* most of our life is spent in this call */
>  		poll_count = ppoll(polls, i, &sleep_time, &mask);
> -- 
> 2.28.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

