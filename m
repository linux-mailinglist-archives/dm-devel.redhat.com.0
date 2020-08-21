Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 929D824E33B
	for <lists+dm-devel@lfdr.de>; Sat, 22 Aug 2020 00:23:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1598048581;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=EUEabL3nzF8LLwRqtqfhe/Oy9f2wyX2JVfEfrK7rge0=;
	b=ArLJ8IP+oLBEJuMb/HfVNxZQp/nON0vTKmgMvwB1/038jMT9URsX9O2MH7YqlntMp2qNqZ
	aJPaN2CwcfL3XzaGotPYaX5Ml492gLEUeRAvkS/Jne9YkeIE1OSCNc/JOuwlCaR+bQlhSS
	9EvBw6MW1OOADM/7KF43G8eqrErtjKI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-473-KCnei7EZMh6uGIsXlKredw-1; Fri, 21 Aug 2020 18:22:59 -0400
X-MC-Unique: KCnei7EZMh6uGIsXlKredw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6C7B081CBE7;
	Fri, 21 Aug 2020 22:22:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EEA2A19728;
	Fri, 21 Aug 2020 22:22:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5A3101832FC2;
	Fri, 21 Aug 2020 22:22:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07LMMO1J031850 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 21 Aug 2020 18:22:24 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A56447AEE6; Fri, 21 Aug 2020 22:22:24 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B66AF7AEE5;
	Fri, 21 Aug 2020 22:22:21 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 07LMMKiV022642; 
	Fri, 21 Aug 2020 17:22:20 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 07LMMJn0022641;
	Fri, 21 Aug 2020 17:22:19 -0500
Date: Fri, 21 Aug 2020 17:22:19 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Martin Wilck <mwilck@suse.com>
Message-ID: <20200821222219.GZ19233@octiron.msp.redhat.com>
References: <20190104175914.22784-1-mwilck@suse.com>
	<20190104175914.22784-5-mwilck@suse.com>
	<20190116234056.GT11315@octiron.msp.redhat.com>
	<ac0f4fc202cf40b1c12dd7484468a162d757b4e0.camel@suse.com>
	<9b5a6c4fd5790f4662cf70d23578f86e90bbe37f.camel@suse.com>
MIME-Version: 1.0
In-Reply-To: <9b5a6c4fd5790f4662cf70d23578f86e90bbe37f.camel@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: Chongyun Wu <wu.chongyun@h3c.com>, dm-devel@redhat.com
Subject: Re: [dm-devel] [RFC PATCH 4/6] multipathd: cancel threads early
	during shutdown
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
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thu, Aug 20, 2020 at 10:39:19PM +0200, Martin Wilck wrote:
> Hi Ben,
> 
> I need to get back to this old discussion. I didn't resend this patch
> last year, because I tried to figure out how to solve the memory leaks
> you mentioned.
> 
> On Thu, 2019-01-17 at 10:59 +0100, Martin Wilck wrote:
> > On Wed, 2019-01-16 at 17:40 -0600, Benjamin Marzinski wrote:
> > > On Fri, Jan 04, 2019 at 06:59:12PM +0100, Martin Wilck wrote:
> > > > Cancel the other threads before taking vecs->lock. This avoids
> > > > delays during shutdown caused e.g. by the checker thread holding
> > > > the vecs lock.
> > > 
> > > Before this change, multipathd was guaranteed that once a thread
> > > had
> > > locked the vecs lock, and checked if it had been cancelled, it
> > > could
> > > not
> > > be cancelled after that until it unlocked the vecs lock.  Undoing
> > > this
> > > guarantee will likely make it possible for multipathd to leak
> > > memory
> > > where it wasn't possible before. 
> > 
> > Thanks for pointing that out.
> > 
> > I wasn't aware of this guarantee. In my latest valgrind tests,
> > valgrind
> > reported no leaks, but multipathd was also not "clean" in the sense
> > that every chunk of memory malloc()d had been explicitly free()d at
> > exit. IIRC that hadn't been caused by any patches added recently.
> > I haven't had time to look at that further, I was satisfied with no
> > real leaks being reported.
> > 
> > We do free the global data structures in "vecs" when we exit. So any
> > possible leaks caused by this patch must be cases where temporary
> > memory is allocated without proper pthread_cleanup_push(), or where a
> > thread was cancelled between allocation of memory and setting a
> > reference to it in the global data structures - e.g. between
> > allocation
> > of a path and adding it to vecs->pathvec.
> > 
> > I haven't audited either class of leaks. I believe the first class
> > should have been eliminated by earlier phthread_cancel audits. Fixing
> > the second class would require designing some really clever helpers,
> > I
> > guess. But as argued above, I really don't think it matters much if
> > it
> > concerns only leaks-at-shutdown.
> > 
> > I'll put this on my todo list, but not at the highest prio.
> > For this RFC, we need to decide whether it's more important to be
> > leak-
> > free on shutdown, or to react quickly on shutdown requests.
> 
> Last year, I had started looking into this, and produced a first patch,
> bca3729 ("libmultipath: alias.c: prepare for cancel-safe allocation").
> I've just revisited this. I think what I did back then was broken.
> 
>  out:
> +       pthread_cleanup_push(free, alias);
>         fclose(f);
> +       pthread_cleanup_pop(0);
> 
> 
> is confusing and hard to read. When I just saw it, several months after
> having written it myself, I thought it was a bug. Actually, it *is*
> broken, as you pointed out already in 
> https://www.redhat.com/archives/dm-devel/2019-October/msg00211.html,
> because we need to avoid leaking the fd, too.
> 
> How would code look like that would protect both from the memory and fd
> leak due to cancellation? Maybe like this:
> 
> char *get_user_friendly_alias(...)
> {
>         char *alias = NULL;
>         ...
> 
>         /* simplified, we need a wrapper for fclose */
> 	pthread_cleanup_push(fclose, f);
> 
> 	id = lookup_binding(f, wwid, &alias, prefix);
> 	if (id < 0)
>                 goto out_fclose;
> 
> 	pthread_cleanup_push(free, alias);
> 	if (fflush(f) != 0) {
> 		condlog(0, "cannot fflush bindings file stream : %s",
> 			strerror(errno));
> 		free(alias);
> 		alias = NULL;
>                 goto out_free;
> 	} else if (can_write && !bindings_read_only && !alias)
> 		alias = allocate_binding(fd, wwid, id, prefix);
> 
> out_free:
>         /* This is necessary to preserve nesting */
> 	pthread_cleanup_pop(0); /* free */
> out_fclose:
> 	pthread_cleanup_pop(0); /* fclose */
>         /* This is necessary because fclose() is a cancellation point */
> 	pthread_cleanup_push(free, alias);
> 	fclose(f);
> 	pthread_cleanup_pop(0); /* free */
> 
>         return alias;
> }
> 
> I hope you concur that this is awfully ugly. Everyone is invited to
> find a solution that doesn't require 3x pthread_cleanup_push()/pop(),
> without completely rewriting the code.

I assume you would do it something like:

static void free_ptr(void *arg)
{
	void *ptr;

	if (!arg)
		return

	ptr = *((void **) arg);
	if (ptr)
		free(ptr);
}

char *get_user_friendly_alias(...)
{
        char *alias = NULL;

	pthread_cleanup_push(free_ptr, &alias);
	...

	/* simplified, we need a wrapper for fclose */
	pthread_cleanup_push(fclose, f);
	...

out:
	pthread_cleanup_pop(1); /* fclose */
	pthread_cleanup_pop(0); /* free_ptr */
	return alias;
}
 
> IMO avoiding the fd leak is more important than avoiding the memory 
> leak of "alias". I'm going to submit a patch that does exactly that.
> 
> In general: I think completely avoiding memory leaks in multithreaded
> code that allows almost arbitrary cancellation is not a worthwhile
> goal. After all, except for the waiter and checker threads,
> all other threads are only cancelled when multipathd exits. Yes, this
> makes it harder to assess potential memory leaks with valgrind, because
> we can't easily distinguish real memory leaks from leaks caused by
> cancellation. But that's about it, and I think the distinction is
> actually not that hard, because the leaks caused by cancellation would
> be sporadic, and wouldn't pile up during longer runs.
> 
> So, I propose not to go further in this direction. IOW, we shouldn't
> write code like bca3729 any more. We don't have to avoid it at all cost
> (for example, it's always good to link allocated memory to some global
> data structure as soon as it makes sense to do so). But I think that
> "pthread_cleanup_push(free, xyz)" is often not worth the code
> uglification it causes. If it conflicts with other cleanup actions, and
> can't be cleanly nested like above, we should definitely not do it.

Sure. For threads that are only cancelled for shutdown, I'm fine with
reasonable effort, balanced against other code considerations.
 
> Moreover, I believe that reacting quickly on cancellation / exit
> requests is more important than avoiding cancellation-caused memory
> leaks. Therefore I plan to resend the "cancel threads early" patch,
> unless you come up with more strong reasons not to do so.

go ahead.

> Another possibility to "fix" cancellation issues and get rid of ugly
> pthread_cleanup_push() calls would be changing our cancellation policy
> to PTHREAD_CANCEL_DISABLE, and check for cancellation only at certain
> points during runtime (basically, before and after blocking / waiting
> on something). But I don't think that's going to work well, for the
> same reason - we'd run high risk to get those multipathd shutdown
> issues back which we've overcome only recently.

I'm not a fan either. I'd rather deal with occasionally seeing fake
memory leaks.

-Ben

> Thoughts?
> 
> Martin
> 
> 
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

