Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id C53C82942B6
	for <lists+dm-devel@lfdr.de>; Tue, 20 Oct 2020 21:05:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1603220742;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=yJ+aUpqVFUmed1balb6yvh6nvDFnoUcmk7zEI0tIemc=;
	b=jNI90yxX91yY8kpC0j880JB3awZD90zVgkCKhK/oh4Ssugj+i4uwvk+VJjNdp9Q637I/pb
	GFMma/II9KGbmsHNqQWE5tmfONRdvTAQt8Vv3XUF7oj5uSTrK3o2oYvS9GfV3Sya7x6EtV
	dVDGGlwMcYmRsZqfFjFKkJv54gEzmY8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-70-n52co9csMp-RrdWgbcuACQ-1; Tue, 20 Oct 2020 15:05:40 -0400
X-MC-Unique: n52co9csMp-RrdWgbcuACQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 780006408B;
	Tue, 20 Oct 2020 19:05:33 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4849927BD2;
	Tue, 20 Oct 2020 19:05:26 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4C1C7180B657;
	Tue, 20 Oct 2020 19:05:15 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09KJ51l4023517 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 20 Oct 2020 15:05:01 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 452B45B4C5; Tue, 20 Oct 2020 19:05:01 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 05E7E5B4B8;
	Tue, 20 Oct 2020 19:04:57 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 09KJ4usq020855; 
	Tue, 20 Oct 2020 14:04:56 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 09KJ4t8i020854;
	Tue, 20 Oct 2020 14:04:55 -0500
Date: Tue, 20 Oct 2020 14:04:55 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: mwilck@suse.com
Message-ID: <20201020190455.GO3384@octiron.msp.redhat.com>
References: <20201016104501.8700-1-mwilck@suse.com>
	<20201016104501.8700-2-mwilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20201016104501.8700-2-mwilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Cc: lixiaokeng@huawei.com, dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH v2 01/29] multipathd: uxlsnr: avoid deadlock
	on exit
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Oct 16, 2020 at 12:44:33PM +0200, mwilck@suse.com wrote:
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

Oops. Forgot to send this one.

Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>
> Signed-off-by: Martin Wilck <mwilck@suse.com>
> ---
>  multipathd/uxlsnr.c | 24 ++++++++++++++----------
>  1 file changed, 14 insertions(+), 10 deletions(-)
> 
> diff --git a/multipathd/uxlsnr.c b/multipathd/uxlsnr.c
> index 1c5ce9d..ce2b680 100644
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
> @@ -302,10 +303,11 @@ void * uxsock_listen(uxsock_trigger_fn uxsock_trigger, long ux_sock,
>  	sigdelset(&mask, SIGUSR1);
>  	while (1) {
>  		struct client *c, *tmp;
> -		int i, poll_count, num_clients;
> +		int i, n_pfds, poll_count, num_clients;
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
> +			} else {
> +				old_clients = num_clients;
> +				polls = new;
>  			}
> -			old_clients = num_clients;
> -			polls = new;
>  		}
>  		polls[0].fd = ux_sock;
>  		polls[0].events = POLLIN;
> @@ -347,11 +348,14 @@ void * uxsock_listen(uxsock_trigger_fn uxsock_trigger, long ux_sock,
>  			polls[i].fd = c->fd;
>  			polls[i].events = POLLIN;
>  			i++;
> +			if (i >= 2 + num_clients)
> +				break;
>  		}
> -		pthread_mutex_unlock(&client_lock);
> +		n_pfds = i;
> +		pthread_cleanup_pop(1);
>  
>  		/* most of our life is spent in this call */
> -		poll_count = ppoll(polls, i, &sleep_time, &mask);
> +		poll_count = ppoll(polls, n_pfds, &sleep_time, &mask);
>  
>  		handle_signals(false);
>  		if (poll_count == -1) {
> @@ -384,7 +388,7 @@ void * uxsock_listen(uxsock_trigger_fn uxsock_trigger, long ux_sock,
>  		}
>  
>  		/* see if a client wants to speak to us */
> -		for (i = 2; i < num_clients + 2; i++) {
> +		for (i = 2; i < n_pfds; i++) {
>  			if (polls[i].revents & POLLIN) {
>  				struct timespec start_time;
>  
> -- 
> 2.28.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

