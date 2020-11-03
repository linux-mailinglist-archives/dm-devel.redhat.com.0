Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id D3EC52A3782
	for <lists+dm-devel@lfdr.de>; Tue,  3 Nov 2020 01:11:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1604362311;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=gP4NFtQlQZNDdSYW/91ofcR+YMsgy7BIeOjALU9zJPM=;
	b=TPpDGzas4tFYNKC+C1/gFWZa4zzuQsBuIln2wmJctQJp030Jbhe/IAP48Lq+YPebEJHM4x
	pd8f2VS3shy93mh8sVsDyVm487Rfcys79k+rcs330mCV3abLkbopGKSHdiUdlwsFfWTHag
	GYKK1OVkpI32Jj19BW4zF//mw3ENH0Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-425-unuUSPL2M3KC2SNdTMf9zA-1; Mon, 02 Nov 2020 19:11:49 -0500
X-MC-Unique: unuUSPL2M3KC2SNdTMf9zA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4721A802B61;
	Tue,  3 Nov 2020 00:11:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2554F73669;
	Tue,  3 Nov 2020 00:11:35 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6DDAA180B658;
	Tue,  3 Nov 2020 00:11:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0A30B9L6029597 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 2 Nov 2020 19:11:09 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id A3DF021E97; Tue,  3 Nov 2020 00:11:09 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1CAC91A885;
	Tue,  3 Nov 2020 00:11:06 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 0A30B4Fr012877; 
	Mon, 2 Nov 2020 18:11:04 -0600
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 0A30B4B7012876;
	Mon, 2 Nov 2020 18:11:04 -0600
Date: Mon, 2 Nov 2020 18:11:03 -0600
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Martin Wilck <mwilck@suse.com>
Message-ID: <20201103001103.GW3384@octiron.msp.redhat.com>
References: <20201016104501.8700-1-mwilck@suse.com>
	<20201016104501.8700-30-mwilck@suse.com>
	<20201020022008.GK3384@octiron.msp.redhat.com>
	<b90e91621122ebfacd85a548e0ec7a9aa59865e3.camel@suse.com>
	<44a708f870a0f9a60b1adcbe37acca9a58933366.camel@suse.com>
MIME-Version: 1.0
In-Reply-To: <44a708f870a0f9a60b1adcbe37acca9a58933366.camel@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: lixiaokeng@huawei.com, dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH v2 29/29] libmultipath: fix race between
 log_safe and log_thread_stop()
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

On Mon, Oct 26, 2020 at 06:24:57PM +0100, Martin Wilck wrote:
> On Mon, 2020-10-26 at 17:22 +0100, Martin Wilck wrote:
> > On Mon, 2020-10-19 at 21:20 -0500, Benjamin Marzinski wrote:
> > > On Fri, Oct 16, 2020 at 12:45:01PM +0200, mwilck@suse.com wrote:
> > > > From: Martin Wilck <mwilck@suse.com>
> > > > 
> > > > log_safe() could race with log_thread_stop(); simply
> > > > checking the value of log_thr has never been safe. By converting
> > > > the
> > > > mutexes to static initializers, we avoid having to destroy them,
> > > > and thus
> > > > possibly accessing a destroyed mutex in log_safe(). Furthermore,
> > > > taking
> > > > both the logev_lock and the logq_lock makes sure the logarea
> > > > isn't
> > > > freed
> > > > while we are writing to it.
> > > > 
> > > 
> > > I don't see any problems with this, but I also don't think it's
> > > necssary
> > > to hold the log thread lock (logev_lock), just to add a message to
> > > the
> > > queue. It seems like protecting the log queue is the job of
> > > logq_lock.
> > > As long as log_safe() enqueues the message before flush_logqueue()
> > > is
> > > called in log_thread_stop(), it should be fine. This could be
> > > solved
> > > by
> > > simply having a static variable in log_pthread.c named something
> > > like
> > > log_area_enabled, that always accessed while holding the logq_lock,
> > > and
> > > is set to true when the log_area is created, and set to false just
> > > before calling the flush_logqueue() in log_thread_stop().
> > 
> > If we do this, we might as well use the variable "la" itself for
> > that,
> > and make sure it's only accessed under the lock. It'd be fine,
> > because
> > la is used if and only if the log thread is active, and spare us
> > another variable. I had actually considered that, thought it was too
> > invasive for the already big series. If you prefer this way, I can do
> > it. 
> 
> OTOH, we take logev_lock in log_safe() anyway (to set
> log_messages_pending). I doubt that it makes a big difference if we
> take the two locks sequentially, or nested. The previous code actually
> took the logev_lock twice, before and after logq_lock. Assuming that
> contention is rather rare, I believe my code might actually perform
> better than before. 
> 
> In your previous review 
> https://www.redhat.com/archives/dm-devel/2020-September/msg00631.html
> you pointed out that you considered it important that log_safe() works
> even after the thread was stopped. Making this work implies that
> log_safe() needs to check if the thread is up. So we either have to
> take logev_lock twice, or take logq_lock while holding logev_lock.
> 
> Bottom line: I think my patch is correct. We could add another patch on
> top that moves logq_lock() into log.c, protecting the "la" variable,
> but the nesting would still need to be the same.
> 
> Does this make sense?

No. Maybe I'm just being dumb, but couldn't log safe:

- grab the logq_lock
- check if the log_area is usable. We can use la for this.
	- If not, unlock, write to syslog and return
	- If so, you know that flush_logqueue() hasn't been run by
	  log_thread_stop() yet, meaning anything you add to the log
	  will get flushed by flush_logqueue, so enqueue the message
-unlock logq_lock and lock logev_lock
-signal that there are messages pending. If nobody is listening on the
 the other side, who cares, because log_thread_stop() will still flush
 the enqueued message
-unlock logev_lock

Am I missing something?

-Ben

>      
> Regards,
> Martin
> 
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

