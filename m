Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 4AB27158098
	for <lists+dm-devel@lfdr.de>; Mon, 10 Feb 2020 18:08:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1581354526;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=dONiJBUjuAr20atpT5nfotxAFJ3ryVagVTSiq+D7o6U=;
	b=DsoC0DsmJxGQwBkS/fOPbEq3O1hBhtMSzv5MsieXPosBhEMqir2+ZP8hmvJc7mbkfKSlYH
	FYT11TYm3XRpnMZmWg1u3xjz1w/EazcS0TBnbn1IMb7kRon5mb5SE/HRJ8cOsVTpYu9rbK
	k1+TzfVBgjURF/8HgDpmoTlgSozZ+nc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-341-5DVRw80kNbKRkwa4AgH6-g-1; Mon, 10 Feb 2020 12:08:43 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D6D1B108BD14;
	Mon, 10 Feb 2020 17:08:34 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4134310013A7;
	Mon, 10 Feb 2020 17:08:31 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4CA2518089CD;
	Mon, 10 Feb 2020 17:08:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01AH6q4I027385 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 10 Feb 2020 12:06:52 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 3399F874C2; Mon, 10 Feb 2020 17:06:52 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2EB551CBCB
	for <dm-devel@redhat.com>; Mon, 10 Feb 2020 17:06:50 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EF61A101928E
	for <dm-devel@redhat.com>; Mon, 10 Feb 2020 17:06:49 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-415-xFlQoceoOtC3kW6f-drxkQ-1;
	Mon, 10 Feb 2020 12:06:47 -0500
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id C2614ACD7;
	Mon, 10 Feb 2020 17:06:45 +0000 (UTC)
Message-ID: <5f6810410ac8deac3e335ad45ba02184eff155ac.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: Benjamin Marzinski <bmarzins@redhat.com>, Christophe Varoqui
	<christophe.varoqui@opensvc.com>
Date: Mon, 10 Feb 2020 18:08:14 +0100
In-Reply-To: <1580929100-32572-16-git-send-email-bmarzins@redhat.com>
References: <1580929100-32572-1-git-send-email-bmarzins@redhat.com>
	<1580929100-32572-16-git-send-email-bmarzins@redhat.com>
User-Agent: Evolution 3.34.3
MIME-Version: 1.0
X-MC-Unique: xFlQoceoOtC3kW6f-drxkQ-1
X-MC-Unique: 5DVRw80kNbKRkwa4AgH6-g-1
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01AH6q4I027385
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH v2 15/17] libmultipath: make directio checker
 share io contexts
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, 2020-02-05 at 12:58 -0600, Benjamin Marzinski wrote:
> On systems with a large number of cores (>500), io_destroy() can take
> tens to hundreds of milliseconds to complete, due to RCU
> synchronization. If there are a large number of paths using the directio
> checker on such a system, this can lead to multipath taking almost a
> minute to complete, with the vast majority of time taken up by
> io_destroy().
> 
> To solve this, the directio checker now allocates one aio context for
> every 1024 checkers. This reduces the io_destroy() delay to a thousandth
> of its previous level. However, this means that muliple checkers are
> sharing the same aio context, and must be able to handle getting results
> for other checkers.  Because only one checker is ever running at a
> time, this doesn't require any locking.  However, locking could be added
> in the future if necessary, to allow multiple checkers to run at the
> same time.
> 
> When checkers are freed, they usually no longer destroy the io context.
> Instead, they attempt to cancel any outstanding request. If that fails,
> they put the request on an orphan list, so that it can be freed by other
> checkers, once it has completed. IO contexts are only destroyed at three
> times, during reconfigure (to deal with the possibility that multipathd
> is holding more aio events than it needs to be, since there is a single
> limit for the whole system), when the checker class is unloaded, and
> in a corner case when checkers are freed. If an aio_group (which
> contains the aio context) is entirely full of orphaned requests, then
> no checker can use it. Since no checker is using it, there is no checker
> to clear out the orphaned requests. In this (likely rare) case, the
> last checker from that group to be freed and leave behind an orphaned
> request will call io_destroy() and remove the group.
> 
> Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
> ---
>  libmultipath/checkers/directio.c | 336 +++++++++++++++++++++++++------
>  multipath/multipath.conf.5       |   7 +-
>  2 files changed, 281 insertions(+), 62 deletions(-)

Although I concur now that your design is sound, I still have some
issues, see below.

> 
> diff --git a/libmultipath/checkers/directio.c b/libmultipath/checkers/directio.c
> index 1b00b775..740c68e5 100644
> --- a/libmultipath/checkers/directio.c
> +++ b/libmultipath/checkers/directio.c
> 
> +/* If an aio_group is completely full of orphans, then no checkers can
> + * use it, which means that no checkers can clear out the orphans. To
> + * avoid keeping the useless group around, simply remove remove the
> + * group */
> +static void
> +check_orphaned_group(struct aio_group *aio_grp)
> +{
> +	int count = 0;
> +	struct list_head *item;
> +
> +	if (aio_grp->holders < AIO_GROUP_SIZE)
> +		return;
> +	list_for_each(item, &aio_grp->orphans)
> +		count++;
> +	if (count >= AIO_GROUP_SIZE) {
> +		remove_aio_group(aio_grp);
> +		if (list_empty(&aio_grp_list))
> +			add_aio_group();

OK, but not beautiful. Can be improved later, I guess. In general, you
could delay allocation of an aio_group until it's actually needed (i.e.
when the first path is using it, in set_aio_group(), as you're already
doing it for 2nd and later groups).

> +	}
> +}
> +
> +int libcheck_load (void)
> +{
> +	if (add_aio_group() == NULL) {
> +		LOG(1, "libcheck_load failed: %s", strerror(errno));
> +		return 1;
> +	}
> +	return 0;
> +}
> +
> +void libcheck_unload (void)
> +{
> +	struct aio_group *aio_grp, *tmp;
> +
> +	list_for_each_entry_safe(aio_grp, tmp, &aio_grp_list, node)
> +		remove_aio_group(aio_grp);
> +}

I have one concern here - this might cause delays during multipathd
shutdown, which we have struggled to eliminate in previous patches.
OTOH, according to what you wrote, with the current code the shutdown
delays will probably be higher, so this is actually an improvement.
We should take a mental note about the shutdown issue. Like with TUR,
avoiding hanging on shutdown is tricky if we consider possibly hanging
device I/O.

> +
> +int libcheck_reset (void)
> +{
> +	struct aio_group *aio_grp, *tmp, *reset_grp = NULL;
> +
> +	/* If a clean existing aio_group exists, use that. Otherwise add a
> +	 * new one */
> +	list_for_each_entry(aio_grp, &aio_grp_list, node) {
> +		if (aio_grp->holders == 0 &&
> +		    list_empty(&aio_grp->orphans)) {
> +			reset_grp = aio_grp;
> +			break;
> +		}
> +	}
> +	if (!reset_grp)
> +		reset_grp = add_aio_group();
> +	if (!reset_grp) {
> +		LOG(1, "checker reset failed");
> +		return 1;
> +	}
> +
> +	list_for_each_entry_safe(aio_grp, tmp, &aio_grp_list, node) {
> +		if (aio_grp != reset_grp)
> +			remove_aio_group(aio_grp);
> +	}
> +	return 0;
> +}
>  
>  int libcheck_init (struct checker * c)
>  {
>  	unsigned long pgsize = getpagesize();
>  	struct directio_context * ct;
> +	struct async_req *req = NULL;
>  	long flags;
>  
>  	ct = malloc(sizeof(struct directio_context));
> @@ -56,26 +201,31 @@ int libcheck_init (struct checker * c)
>  		return 1;
>  	memset(ct, 0, sizeof(struct directio_context));
>  
> -	if (io_setup(1, &ct->ioctx) != 0) {
> -		condlog(1, "io_setup failed");
> -		free(ct);
> -		return 1;
> +	if (set_aio_group(ct) < 0)
> +		goto out;
> +
> +	req = malloc(sizeof(struct async_req));
> +	if (!req) {
> +		goto out;
>  	}
> +	memset(req, 0, sizeof(struct async_req));
> +	INIT_LIST_HEAD(&req->node);
>  
> -	if (ioctl(c->fd, BLKBSZGET, &ct->blksize) < 0) {
> +	if (ioctl(c->fd, BLKBSZGET, &req->blksize) < 0) {
>  		c->msgid = MSG_DIRECTIO_BLOCKSIZE;
> -		ct->blksize = 512;
> +		req->blksize = 512;

You didn't change this, but I wonder if this is really a safe default.
IIUC it's safe (although perhaps a bit slower) to read a multiple of
the logical block size, but reading less than the logical block size
might fail. Perhaps we should default to 4k?

>  	}
> -	if (ct->blksize > 4096) {
> +	if (req->blksize > 4096) {
>  		/*
>  		 * Sanity check for DASD; BSZGET is broken
>  		 */
> -		ct->blksize = 4096;
> +		req->blksize = 4096;
>  	}
> -	if (!ct->blksize)
> +	if (!req->blksize)
>  		goto out;
> -	ct->buf = (unsigned char *)malloc(ct->blksize + pgsize);
> -	if (!ct->buf)
> +
> +	req->buf = (unsigned char *)malloc(req->blksize + pgsize);

Why don't you simply use posix_memalign()?

> +	if (!req->buf)
>  		goto out;
>  
>  	flags = fcntl(c->fd, F_GETFL);
> @@ -88,17 +238,22 @@ int libcheck_init (struct checker * c)
>  		ct->reset_flags = 1;
>  	}
>  
> -	ct->ptr = (unsigned char *) (((unsigned long)ct->buf + pgsize - 1) &
> +	req->ptr = (unsigned char *) (((unsigned long)req->buf + pgsize - 1) &
>  		  (~(pgsize - 1)));

See above.

>  
>  	/* Successfully initialized, return the context. */
> +	ct->req = req;
>  	c->context = (void *) ct;
>  	return 0;
>  
>  out:
> -	if (ct->buf)
> -		free(ct->buf);
> -	io_destroy(ct->ioctx);
> +	if (req) {
> +		if (req->buf)
> +			free(req->buf);
> +		free(req);
> +	}
> +	if (ct->aio_grp)
> +		ct->aio_grp->holders--;
>  	free(ct);
>  	return 1;
>  }
> @@ -106,6 +261,7 @@ out:
>  void libcheck_free (struct checker * c)
>  {
>  	struct directio_context * ct = (struct directio_context *)c->context;
> +	struct io_event event;
>  	long flags;
>  
>  	if (!ct)
> @@ -121,20 +277,72 @@ void libcheck_free (struct checker * c)
>  		}
>  	}
>  
> -	if (ct->buf)
> -		free(ct->buf);
> -	io_destroy(ct->ioctx);
> +	if (ct->running &&
> +	    (ct->req->state != PATH_PENDING ||
> +	     io_cancel(ct->aio_grp->ioctx, &ct->req->io, &event) == 0))
> +		ct->running = 0;
> +	if (!ct->running) {
> +		free(ct->req->buf);
> +		free(ct->req);
> +		ct->aio_grp->holders--;
> +	} else {
> +		ct->req->state = PATH_REMOVED;
> +		list_add(&ct->req->node, &ct->aio_grp->orphans);
> +		check_orphaned_group(ct->aio_grp);
> +	}
> +
>  	free(ct);
> +	c->context = NULL;
> +}
> +
> +static int
> +get_events(struct aio_group *aio_grp, struct timespec *timeout)
> +{
> +	struct io_event events[128];
> +	int i, nr, got_events = 0;
> +	struct timespec zero_timeout = {0};
> +	struct timespec *timep = (timeout)? timeout : &zero_timeout;

This isn't wrong, but the semantics of the "timeout" parameter are a
bit confusing, as io_getevents() would interpret a NULL timeout as
"forever", and get_events is mostly a wrapper around io_getevents().

> +
> +	do {
> +		errno = 0;
> +		nr = io_getevents(aio_grp->ioctx, 1, 128, events, timep);
> +		got_events |= (nr > 0);
> +
> +		for (i = 0; i < nr; i++) {
> +			struct async_req *req = container_of(events[i].obj, struct async_req, io);
> +
> +			LOG(3, "io finished %lu/%lu", events[i].res,
> +			    events[i].res2);
> +
> +			/* got an orphaned request */
> +			if (req->state == PATH_REMOVED) {
> +				list_del(&req->node);
> +				free(req->buf);
> +				free(req);
> +				aio_grp->holders--;
> +			} else
> +				req->state = (events[i].res == req->blksize) ?
> +					      PATH_UP : PATH_DOWN;
> +		}
> +		timep = &zero_timeout;
> +	} while (nr == 128); /* assume there are more events and try again */
> +
> +	if (nr < 0)
> +		LOG(3, "async io getevents returned %i (errno=%s)",
> +		    nr, strerror(errno));
> +
> +	return got_events;
>  }
>  static int
>  check_state(int fd, struct directio_context *ct, int sync, int timeout_secs)
>  {
>  	struct timespec	timeout = { .tv_nsec = 5 };

What's the purpose of these 5ns? Unless the device in question is an
NVDIMM, I'd say 5ns is practically equivalent to 0.


> -	struct io_event event;
>  	struct stat	sb;
> -	int		rc = PATH_UNCHECKED;
> +	int		rc;
>  	long		r;
> +	struct timespec currtime, endtime;
> +	struct timespec *timep = &timeout;
>  
>  	if (fstat(fd, &sb) == 0) {
>  		LOG(4, "called for %x", (unsigned) sb.st_rdev);
> @@ -145,50 +353,60 @@ check_state(int fd, struct directio_context *ct, int sync, int timeout_secs)
>  		timeout.tv_nsec = 0;
>  	}
>  
> -	if (!ct->running) {
> -		struct iocb *ios[1] = { &ct->io };
> +	if (ct->running) {
> +		if (ct->req->state != PATH_PENDING) {
> +			ct->running = 0;
> +			return ct->req->state;
> +		}
> +	} else {
> +		struct iocb *ios[1] = { &ct->req->io };
>  
>  		LOG(3, "starting new request");
> -		memset(&ct->io, 0, sizeof(struct iocb));
> -		io_prep_pread(&ct->io, fd, ct->ptr, ct->blksize, 0);
> -		if (io_submit(ct->ioctx, 1, ios) != 1) {
> +		memset(&ct->req->io, 0, sizeof(struct iocb));
> +		io_prep_pread(&ct->req->io, fd, ct->req->ptr,
> +			      ct->req->blksize, 0);
> +		ct->req->state = PATH_PENDING;
> +		if (io_submit(ct->aio_grp->ioctx, 1, ios) != 1) {
>  			LOG(3, "io_submit error %i", errno);
>  			return PATH_UNCHECKED;
>  		}
>  	}
>  	ct->running++;

This looks to me as if in the case (ct->running && ct->req->state ==
PATH_PENDING), ct->running could become > 1, even though you don't
start a new IO. Is that intended? I don't think it matters because you
never decrement, but it looks weird.

>  
> -	errno = 0;
> -	r = io_getevents(ct->ioctx, 1L, 1L, &event, &timeout);
> +	get_monotonic_time(&endtime);
> +	endtime.tv_sec += timeout.tv_sec;
> +	endtime.tv_nsec += timeout.tv_nsec;
> +	normalize_timespec(&endtime);
> +	while(1) {
> +		r = get_events(ct->aio_grp, timep);
>  
> -	if (r < 0 ) {
> -		LOG(3, "async io getevents returned %li (errno=%s)", r,
> -		    strerror(errno));
> -		ct->running = 0;
> -		rc = PATH_UNCHECKED;
> -	} else if (r < 1L) {
> -		if (ct->running > timeout_secs || sync) {
> -			struct iocb *ios[1] = { &ct->io };
> -
> -			LOG(3, "abort check on timeout");
> -			r = io_cancel(ct->ioctx, ios[0], &event);
> -			/*
> -			 * Only reset ct->running if we really
> -			 * could abort the pending I/O
> -			 */
> -			if (r)
> -				LOG(3, "io_cancel error %i", errno);
> -			else
> -				ct->running = 0;
> -			rc = PATH_DOWN;
> -		} else {
> -			LOG(3, "async io pending");
> -			rc = PATH_PENDING;
> -		}
> +		if (ct->req->state != PATH_PENDING) {
> +			ct->running = 0;
> +			return ct->req->state;
> +		} else if (r == 0 || !timep)
> +			break;
> +
> +		get_monotonic_time(&currtime);
> +		timespecsub(&endtime, &currtime, &timeout);
> +		if (timeout.tv_sec < 0)
> +			timep = NULL;

See comment for get_events() above. Why don't you simply do this?

    timeout.tv_sec = timeout.tv_nsec = 0;


> +	}
> +	if (ct->running > timeout_secs || sync) {
> +		struct io_event event;
> +
> +		LOG(3, "abort check on timeout");
> +
> +		r = io_cancel(ct->aio_grp->ioctx, &ct->req->io, &event);
> +		/*
> +		 * Only reset ct->running if we really
> +		 * could abort the pending I/O

... which will never happen ... but never mind.

> +		 */
> +		if (!r)
> +			ct->running = 0;
> +		rc = PATH_DOWN;
>  	} else {
> -		LOG(3, "io finished %lu/%lu", event.res, event.res2);
> -		ct->running = 0;
> -		rc = (event.res == ct->blksize) ? PATH_UP : PATH_DOWN;
> +		LOG(3, "async io pending");
> +		rc = PATH_PENDING;
>  	}
>  
>  	return rc;
> diff --git a/multipath/multipath.conf.5 b/multipath/multipath.conf.5
> index dc103fd8..05a5e8ff 100644
> --- a/multipath/multipath.conf.5
> +++ b/multipath/multipath.conf.5
> @@ -494,9 +494,10 @@ Check the path state for LSI/Engenio/NetApp RDAC class as NetApp SANtricity E/EF
>  Series, and OEM arrays from IBM DELL SGI STK and SUN.
>  .TP
>  .I directio
> -(Deprecated) Read the first sector with direct I/O. This checker is being
> -deprecated, it could cause spurious path failures under high load.
> -Please use \fItur\fR instead.
> +(Deprecated) Read the first sector with direct I/O. If you have a large number
> +of paths, or many AIO users on a system, you may need to use sysctl to
> +increase fs.aio-max-nr. This checker is being deprecated, it could cause
> +spurious path failures under high load. Please use \fItur\fR instead.
>  .TP
>  .I cciss_tur
>  (Hardware-dependent)



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

