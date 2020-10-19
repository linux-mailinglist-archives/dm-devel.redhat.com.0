Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 13D8829320A
	for <lists+dm-devel@lfdr.de>; Tue, 20 Oct 2020 01:34:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1603150477;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=PX5/h0qRJyKSLDoyxly68JAYSYE6x2WvK8v352xNUkQ=;
	b=cN4xcTnFI54c1r5EYQ6p8KbPJY7iNjopOev+RefUsy7VW/6O7+MZs13MCvpEH75nLYizyj
	pR/uQGzWJpRrqiVbt97eL3cl1PqUb6MjxkUZljzfd6ZUliBdGWrJxhF5LzKvRHpcyIQyXM
	GQ39r1tnFG9cgxmJngT1c9znVfljU/A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-270-ZZMc6TZpN9Coua2ap1sZ_w-1; Mon, 19 Oct 2020 19:34:34 -0400
X-MC-Unique: ZZMc6TZpN9Coua2ap1sZ_w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B5428805722;
	Mon, 19 Oct 2020 23:34:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8AFDB10002A4;
	Mon, 19 Oct 2020 23:34:25 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C3C331800B72;
	Mon, 19 Oct 2020 23:34:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09JNXxA0018723 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 19 Oct 2020 19:33:59 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 371475C225; Mon, 19 Oct 2020 23:33:59 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 48D7B5C1A3;
	Mon, 19 Oct 2020 23:33:55 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 09JNXrbB014965; 
	Mon, 19 Oct 2020 18:33:53 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 09JNXrPO014964;
	Mon, 19 Oct 2020 18:33:53 -0500
Date: Mon, 19 Oct 2020 18:33:52 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: mwilck@suse.com
Message-ID: <20201019233352.GJ3384@octiron.msp.redhat.com>
References: <20201016104501.8700-1-mwilck@suse.com>
	<20201016104501.8700-29-mwilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20201016104501.8700-29-mwilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: lixiaokeng@huawei.com, dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH v2 28/29] multipathd: sanitize uxsock_listen()
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Oct 16, 2020 at 12:45:00PM +0200, mwilck@suse.com wrote:
> From: Martin Wilck <mwilck@suse.com>
> 
> We were allocating 1025 poll fds, which is not optimal. Fix it, and make this
> more easily customizable in general. Use POLLFDS_BASE rather than the
> hard-coded "2" for the number of fds we poll besides client connections.
> Introduce a maximum number of clients that can connect. When this number is
> reached, we simply stop polling the accept socket, so that new connections
> aren't accepted any more.  Don't attempt to realloc() the pollfd array if the
> number of clients decreases. It's unlikely to ever be more than one or two
> pages. Finally, there's no need to wake up every 5s. Our signal handling is
> robust. Just sleep forever in ppoll() if nothing happens.
> 
> Signed-off-by: Martin Wilck <mwilck@suse.com>
> ---
>  multipathd/uxlsnr.c | 70 ++++++++++++++++++++++++++++-----------------
>  1 file changed, 43 insertions(+), 27 deletions(-)
> 
> diff --git a/multipathd/uxlsnr.c b/multipathd/uxlsnr.c
> index ce2b680..cd462b6 100644
> --- a/multipathd/uxlsnr.c
> +++ b/multipathd/uxlsnr.c
> @@ -41,14 +41,25 @@
>  #include "cli.h"
>  #include "uxlsnr.h"
>  
> -static struct timespec sleep_time = {5, 0};
> -
>  struct client {
>  	struct list_head node;
>  	int fd;
>  };
>  
> -#define MIN_POLLS 1023
> +/* The number of fds we poll on, other than individual client connections */
> +#define POLLFDS_BASE 2
> +#define POLLFD_CHUNK (4096 / sizeof(struct pollfd))
> +/* Minimum mumber of pollfds to reserve for clients */
> +#define MIN_POLLS (POLLFD_CHUNK - POLLFDS_BASE)

Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>

I have one nitpick. This code looks like it's pretending to allocate
pages of memory, when it's not. Malloc's bookeeping space means that
this memory chunk will be larger than a page. Even if it was page sized,
unless userspace is specifically asking for page-aligned memory, it most
like won't get it. Since AFAIK there is no benefit to mallocing memory
in a specific size increment, it doesn't seem woirth adding any
complexity to make sure our mallocs do that.

-Ben

> +/*
> + * Max number of client connections allowed
> + * During coldplug, there may be a large number of "multipath -u"
> + * processes connecting.
> + */
> +#define MAX_CLIENTS (16384 - POLLFDS_BASE)
> +
> +/* Compile-time error if POLLFD_CHUNK is too small */
> +static __attribute__((unused)) char ___a[-(MIN_POLLS <= 0)];
>  
>  static LIST_HEAD(clients);
>  static pthread_mutex_t client_lock = PTHREAD_MUTEX_INITIALIZER;
> @@ -282,13 +293,13 @@ void * uxsock_listen(uxsock_trigger_fn uxsock_trigger, long ux_sock,
>  	char *inbuf;
>  	char *reply;
>  	sigset_t mask;
> -	int old_clients = MIN_POLLS;
> +	int max_pfds = MIN_POLLS + POLLFDS_BASE;
>  	/* conf->sequence_nr will be 1 when uxsock_listen is first called */
>  	unsigned int sequence_nr = 0;
>  	struct watch_descriptors wds = { .conf_wd = -1, .dir_wd = -1 };
>  
>  	condlog(3, "uxsock: startup listener");
> -	polls = (struct pollfd *)MALLOC((MIN_POLLS + 2) * sizeof(struct pollfd));
> +	polls = MALLOC(max_pfds * sizeof(*polls));
>  	if (!polls) {
>  		condlog(0, "uxsock: failed to allocate poll fds");
>  		exit_daemon();
> @@ -312,28 +323,33 @@ void * uxsock_listen(uxsock_trigger_fn uxsock_trigger, long ux_sock,
>  		list_for_each_entry(c, &clients, node) {
>  			num_clients++;
>  		}
> -		if (num_clients != old_clients) {
> +		if (num_clients + POLLFDS_BASE > max_pfds) {
>  			struct pollfd *new;
> -			if (num_clients <= MIN_POLLS && old_clients > MIN_POLLS) {
> -				new = REALLOC(polls, (2 + MIN_POLLS) *
> -						sizeof(struct pollfd));
> -			} else if (num_clients <= MIN_POLLS && old_clients <= MIN_POLLS) {
> -				new = polls;
> -			} else {
> -				new = REALLOC(polls, (2 + num_clients) *
> -						sizeof(struct pollfd));
> -			}
> -			if (!new) {
> -				condlog(0, "%s: failed to realloc %d poll fds",
> -					"uxsock", 2 + num_clients);
> -				num_clients = old_clients;
> -			} else {
> -				old_clients = num_clients;
> +			int n_new = max_pfds + POLLFD_CHUNK;
> +
> +			new = REALLOC(polls, n_new * sizeof(*polls));
> +			if (new) {
> +				max_pfds = n_new;
>  				polls = new;
> +			} else {
> +				condlog(1, "%s: realloc failure, %d clients not served",
> +					__func__,
> +					num_clients + POLLFDS_BASE - max_pfds);
> +				num_clients = max_pfds - POLLFDS_BASE;
>  			}
>  		}
> -		polls[0].fd = ux_sock;
> -		polls[0].events = POLLIN;
> +		if (num_clients < MAX_CLIENTS) {
> +			polls[0].fd = ux_sock;
> +			polls[0].events = POLLIN;
> +		} else {
> +			/*
> +			 * New clients can't connect, num_clients won't grow
> +			 * to MAX_CLIENTS or higher
> +			 */
> +			condlog(1, "%s: max client connections reached, pausing polling",
> +				__func__);
> +			polls[0].fd = -1;
> +		}
>  
>  		reset_watch(notify_fd, &wds, &sequence_nr);
>  		if (notify_fd == -1 || (wds.conf_wd == -1 && wds.dir_wd == -1))
> @@ -343,19 +359,19 @@ void * uxsock_listen(uxsock_trigger_fn uxsock_trigger, long ux_sock,
>  		polls[1].events = POLLIN;
>  
>  		/* setup the clients */
> -		i = 2;
> +		i = POLLFDS_BASE;
>  		list_for_each_entry(c, &clients, node) {
>  			polls[i].fd = c->fd;
>  			polls[i].events = POLLIN;
>  			i++;
> -			if (i >= 2 + num_clients)
> +			if (i >= max_pfds)
>  				break;
>  		}
>  		n_pfds = i;
>  		pthread_cleanup_pop(1);
>  
>  		/* most of our life is spent in this call */
> -		poll_count = ppoll(polls, n_pfds, &sleep_time, &mask);
> +		poll_count = ppoll(polls, n_pfds, NULL, &mask);
>  
>  		handle_signals(false);
>  		if (poll_count == -1) {
> @@ -388,7 +404,7 @@ void * uxsock_listen(uxsock_trigger_fn uxsock_trigger, long ux_sock,
>  		}
>  
>  		/* see if a client wants to speak to us */
> -		for (i = 2; i < n_pfds; i++) {
> +		for (i = POLLFDS_BASE; i < n_pfds; i++) {
>  			if (polls[i].revents & POLLIN) {
>  				struct timespec start_time;
>  
> -- 
> 2.28.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

