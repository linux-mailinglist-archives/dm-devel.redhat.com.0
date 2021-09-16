Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 448F040D252
	for <lists+dm-devel@lfdr.de>; Thu, 16 Sep 2021 06:22:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1631766164;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=zXpTtng+HIaYdxWE9Yeqsjyv+ujQXTVCLW38Ib5HHx8=;
	b=cKHYN0ickqznVyuRhzbNYrcmZkKGh5SsU/0fXDrKzMpb8mvfQZS6/6F0ZOJUEENC9dycG9
	ZI7ksJXSEVQAF63kykE+nliRqXvPGqP4bsf7V1yHLnUBPJbgCgW+6TZ1SSj7iXsNySpm+p
	l0+ytXhp9obFBE3VNMFyJpyt7ToWl6k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-271-_0Dm9DNFMUCAIsHhqJo2Dg-1; Thu, 16 Sep 2021 00:22:42 -0400
X-MC-Unique: _0Dm9DNFMUCAIsHhqJo2Dg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4D1A0362F8;
	Thu, 16 Sep 2021 04:22:34 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AFB29188E4;
	Thu, 16 Sep 2021 04:22:32 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9CCCD4E58F;
	Thu, 16 Sep 2021 04:22:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 18G4HeV9004485 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 16 Sep 2021 00:17:40 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 73C3F5C1C5; Thu, 16 Sep 2021 04:17:40 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (unknown [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7F8235C1A1;
	Thu, 16 Sep 2021 04:17:37 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 18G4HZjv007908; 
	Wed, 15 Sep 2021 23:17:36 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 18G4HYW0007907;
	Wed, 15 Sep 2021 23:17:34 -0500
Date: Wed, 15 Sep 2021 23:17:34 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: mwilck@suse.com
Message-ID: <20210916041734.GR3087@octiron.msp.redhat.com>
References: <20210910114120.13665-1-mwilck@suse.com>
	<20210910114120.13665-33-mwilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20210910114120.13665-33-mwilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: lixiaokeng@huawei.com, dm-devel@redhat.com,
	Chongyun Wu <wu.chongyun@h3c.com>
Subject: Re: [dm-devel] [PATCH 32/35] multipathd: uxlsnr: add timeout
	handling
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Sep 10, 2021 at 01:41:17PM +0200, mwilck@suse.com wrote:
> From: Martin Wilck <mwilck@suse.com>
> 
> Our ppoll() call needs to wake up when a client request times out.
> This logic can be added by determining the first client that's about
> to time out. The logic in handle_client() will then cause a timeout
> reply to be sent to the client. This is more client-friendly
> as the client timing out without receiving a reply.
> 
> Signed-off-by: Martin Wilck <mwilck@suse.com>
> ---
>  multipathd/uxlsnr.c | 58 +++++++++++++++++++++++++++++++++++++++++----
>  1 file changed, 53 insertions(+), 5 deletions(-)
> 
> diff --git a/multipathd/uxlsnr.c b/multipathd/uxlsnr.c
> index 4637954..1bf4126 100644
> --- a/multipathd/uxlsnr.c
> +++ b/multipathd/uxlsnr.c
> @@ -320,6 +320,35 @@ static void handle_inotify(int fd, struct watch_descriptors *wds)
>  }
>  
>  static const struct timespec ts_zero = { .tv_sec = 0, };
> +static const struct timespec ts_max = { .tv_sec = LONG_MAX, .tv_nsec = 999999999 };
> +
> +/* call with clients lock held */
> +static struct timespec *__get_soonest_timeout(struct timespec *ts)
> +{
> +	struct timespec ts_min = ts_max, now;
> +	bool any = false;
> +	struct client *c;
> +
> +	list_for_each_entry(c, &clients, node) {
> +		if (timespeccmp(&c->expires, &ts_zero) != 0 &&
> +		    timespeccmp(&c->expires, &ts_min) < 0) {
> +			ts_min = c->expires;
> +			any = true;
> +		}
> +	}
> +
> +	if (!any)
> +		return NULL;
> +
> +	get_monotonic_time(&now);
> +	timespecsub(&ts_min, &now, ts);
> +	if (timespeccmp(ts, &ts_zero) < 0)
> +		*ts = ts_zero;
> +
> +	condlog(4, "%s: next client expires in %ld.%03lds", __func__,
> +		(long)ts->tv_sec, ts->tv_nsec / 1000000);
> +	return ts;
> +}
>  
>  /* call with clients lock held */
>  static bool __need_lock(void)
> @@ -422,6 +451,24 @@ static void set_client_state(struct client *c, int state)
>  	c->state = state;
>  }
>  
> +static void check_timeout(struct client *c)
> +{
> +	struct timespec now;
> +
> +	if (timespeccmp(&c->expires, &ts_zero) == 0)
> +		return;
> +
> +	get_monotonic_time(&now);
> +	if (timespeccmp(&c->expires, &now) > 0)
> +		return;
> +
> +	condlog(2, "%s: cli[%d]: timed out at %ld.%03ld", __func__,
> +		c->fd, (long)c->expires.tv_sec, c->expires.tv_nsec / 1000000);
> +
> +	c->error = -ETIMEDOUT;
> +	set_client_state(c, CLT_SEND);
> +}
> +
>  static void handle_client(struct client *c, struct vectors *vecs, short revents)
>  {
>  	ssize_t n;
> @@ -435,6 +482,8 @@ static void handle_client(struct client *c, struct vectors *vecs, short revents)
>  		return;
>  	}
>  
> +	check_timeout(c);
> +
>  	condlog(4, "%s: cli[%d] poll=%x state=%d cmd=\"%s\" repl \"%s\"", __func__,
>  		c->fd, revents, c->state, c->cmd, get_strbuf_str(&c->reply));
>  
> @@ -594,6 +643,7 @@ void *uxsock_listen(long ux_sock, void *trigger_data)
>  	while (1) {
>  		struct client *c, *tmp;
>  		int i, n_pfds, poll_count, num_clients;
> +		struct timespec __timeout, *timeout;

Maybe it's just too late to be looking at code, but I'm missing why we
need a separate variable that it a pointer to __timeout.

-Ben

>  
>  		/* setup for a poll */
>  		pthread_mutex_lock(&client_lock);
> @@ -661,10 +711,12 @@ void *uxsock_listen(long ux_sock, void *trigger_data)
>                                  break;
>                  }
>                  n_pfds = i;
> +		timeout = __get_soonest_timeout(&__timeout);
> +
>  		pthread_cleanup_pop(1);
>  
>  		/* most of our life is spent in this call */
> -		poll_count = ppoll(polls, n_pfds, NULL, &mask);
> +		poll_count = ppoll(polls, n_pfds, timeout, &mask);
>  
>  		handle_signals(false);
>  		if (poll_count == -1) {
> @@ -679,10 +731,6 @@ void *uxsock_listen(long ux_sock, void *trigger_data)
>  			break;
>  		}
>  
> -		if (poll_count == 0) {
> -			handle_signals(true);
> -			continue;
> -		}
>  		if (polls[POLLFD_IDLE].fd != -1 &&
>  		    polls[POLLFD_IDLE].revents & POLLIN)
>  			drain_idle_fd(idle_fd);
> -- 
> 2.33.0

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

