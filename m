Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 22CC674CD83
	for <lists+dm-devel@lfdr.de>; Mon, 10 Jul 2023 08:47:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1688971638;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ZOzbgZnGxVY8RzbWMdjcHgi2m7KXH6xF5clUXc7jy5o=;
	b=BJ1KbdrnQj0HfhU4q0VAbrGBW31zvklyUD8sqbNE2Q7kR1Osxhi4LBb9ye+GGea+T0oM5t
	IEubZALkHfC2hi/iWSsYZgwTRbsdfL58eLiprJ0hEbZCV03n4oGHLCUVJ0p5A6ME3ryuWJ
	bvjv/30QrnBK/29iSSbYV6cyWf911CA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-179-_NTmtJ8JOC6ineIDscU2Tg-1; Mon, 10 Jul 2023 02:47:16 -0400
X-MC-Unique: _NTmtJ8JOC6ineIDscU2Tg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 03599887192;
	Mon, 10 Jul 2023 06:47:04 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E10944CD0C9;
	Mon, 10 Jul 2023 06:47:03 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 5ED7C19451D6;
	Mon, 10 Jul 2023 06:47:03 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id C8C4F1946586
 for <dm-devel@listman.corp.redhat.com>; Mon,  3 Jul 2023 16:44:53 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 8C6924CD0C6; Mon,  3 Jul 2023 16:44:53 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 859C3492C13
 for <dm-devel@redhat.com>; Mon,  3 Jul 2023 16:44:53 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 650CB280D21C
 for <dm-devel@redhat.com>; Mon,  3 Jul 2023 16:44:53 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-326-TOJ01J0qNGWGpwdBDPmY8g-1; Mon, 03 Jul 2023 12:44:52 -0400
X-MC-Unique: TOJ01J0qNGWGpwdBDPmY8g-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2A58760FCE;
 Mon,  3 Jul 2023 16:39:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88545C433C8;
 Mon,  3 Jul 2023 16:39:23 +0000 (UTC)
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
 id 22663CE0DD0; Mon,  3 Jul 2023 09:39:23 -0700 (PDT)
Date: Mon, 3 Jul 2023 09:39:23 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Dave Chinner <david@fromorbit.com>
Message-ID: <cc894c77-717a-4e9f-b649-48bab40e7c60@paulmck-laptop>
References: <20230622085335.77010-1-zhengqi.arch@bytedance.com>
 <20230622085335.77010-25-zhengqi.arch@bytedance.com>
 <cf0d9b12-6491-bf23-b464-9d01e5781203@suse.cz>
 <ZJU708VIyJ/3StAX@dread.disaster.area>
MIME-Version: 1.0
In-Reply-To: <ZJU708VIyJ/3StAX@dread.disaster.area>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mailman-Approved-At: Mon, 10 Jul 2023 06:46:55 +0000
Subject: Re: [dm-devel] [PATCH 24/29] mm: vmscan: make global slab shrink
 lockless
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/dm-devel/>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=subscribe>
Reply-To: paulmck@kernel.org
Cc: djwong@kernel.org, roman.gushchin@linux.dev,
 Qi Zheng <zhengqi.arch@bytedance.com>,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 dm-devel@redhat.com, linux-ext4@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-nfs@vger.kernel.org,
 linux-raid@vger.kernel.org, linux-bcache@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Vlastimil Babka <vbabka@suse.cz>,
 brauner@kernel.org, tytso@mit.edu, linux-kernel@vger.kernel.org,
 linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 akpm@linux-foundation.org, linux-btrfs@vger.kernel.org, tkhai@ya.ru
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kernel.org
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Jun 23, 2023 at 04:29:39PM +1000, Dave Chinner wrote:
> On Thu, Jun 22, 2023 at 05:12:02PM +0200, Vlastimil Babka wrote:
> > On 6/22/23 10:53, Qi Zheng wrote:
> > > @@ -1067,33 +1068,27 @@ static unsigned long shrink_slab(gfp_t gfp_mask, int nid,
> > >  	if (!mem_cgroup_disabled() && !mem_cgroup_is_root(memcg))
> > >  		return shrink_slab_memcg(gfp_mask, nid, memcg, priority);
> > >  
> > > -	if (!down_read_trylock(&shrinker_rwsem))
> > > -		goto out;
> > > -
> > > -	list_for_each_entry(shrinker, &shrinker_list, list) {
> > > +	rcu_read_lock();
> > > +	list_for_each_entry_rcu(shrinker, &shrinker_list, list) {
> > >  		struct shrink_control sc = {
> > >  			.gfp_mask = gfp_mask,
> > >  			.nid = nid,
> > >  			.memcg = memcg,
> > >  		};
> > >  
> > > +		if (!shrinker_try_get(shrinker))
> > > +			continue;
> > > +		rcu_read_unlock();
> > 
> > I don't think you can do this unlock?

Sorry to be slow to respond here, this one fell through the cracks.
And thank you to Qi for reminding me!

If you do this unlock, you had jolly well better nail down the current
element (the one referenced by shrinker), for example, by acquiring an
explicit reference count on the object.  And presumably this is exactly
what shrinker_try_get() is doing.  And a look at your 24/29 confirms this,
at least assuming that shrinker->refcount is set to zero before the call
to synchronize_rcu() in free_module() *and* that synchronize_rcu() doesn't
start until *after* shrinker_put() calls complete().  Plus, as always,
the object must be removed from the list before the synchronize_rcu()
starts.  (On these parts of the puzzle, I defer to those more familiar
with this code path.  And I strongly suggest carefully commenting this
type of action-at-a-distance design pattern.)

Why is this important?  Because otherwise that object might be freed
before you get to the call to rcu_read_lock() at the end of this loop.
And if that happens, list_for_each_entry_rcu() will be walking the
freelist, which is quite bad for the health and well-being of your kernel.

There are a few other ways to make this sort of thing work:

1.	Defer the shrinker_put() to the beginning of the loop.
	You would need a flag initially set to zero, and then set to
	one just before (or just after) the rcu_read_lock() above.
	You would also need another shrinker_old pointer to track the
	old pointer.  Then at the top of the loop, if the flag is set,
	invoke shrinker_put() on shrinker_old.	This ensures that the
	previous shrinker structure stays around long enough to allow
	the loop to find the next shrinker structure in the list.

	This approach is attractive when the removal code path
	can invoke shrinker_put() after the grace period ends.

2.	Make shrinker_put() invoke call_rcu() when ->refcount reaches
	zero, and have the callback function free the object.  This of
	course requires adding an rcu_head structure to the shrinker
	structure, which might or might not be a reasonable course of
	action.  If adding that rcu_head is reasonable, this simplifies
	the logic quite a bit.

3.	For the shrinker-structure-removal code path, remove the shrinker
	structure, then remove the initial count from ->refcount,
	and then keep doing grace periods until ->refcount is zero,
	then do one more.  Of course, if the result of removing the
	initial count was zero, then only a single additional grace
	period is required.

	This would need to be carefully commented, as it is a bit
	unconventional.

There are probably many other ways, but just to give an idea of a few
other ways to do this.

> > > +
> > >  		ret = do_shrink_slab(&sc, shrinker, priority);
> > >  		if (ret == SHRINK_EMPTY)
> > >  			ret = 0;
> > >  		freed += ret;
> > > -		/*
> > > -		 * Bail out if someone want to register a new shrinker to
> > > -		 * prevent the registration from being stalled for long periods
> > > -		 * by parallel ongoing shrinking.
> > > -		 */
> > > -		if (rwsem_is_contended(&shrinker_rwsem)) {
> > > -			freed = freed ? : 1;
> > > -			break;
> > > -		}
> > > -	}
> > >  
> > > -	up_read(&shrinker_rwsem);
> > > -out:
> > > +		rcu_read_lock();
> > 
> > That new rcu_read_lock() won't help AFAIK, the whole
> > list_for_each_entry_rcu() needs to be under the single rcu_read_lock() to be
> > safe.
> 
> Yeah, that's the pattern we've been taught and the one we can look
> at and immediately say "this is safe".
> 
> This is a different pattern, as has been explained bi Qi, and I
> think it *might* be safe.
> 
> *However.*
> 
> Right now I don't have time to go through a novel RCU list iteration
> pattern it one step at to determine the correctness of the
> algorithm. I'm mostly worried about list manipulations that can
> occur outside rcu_read_lock() section bleeding into the RCU
> critical section because rcu_read_lock() by itself is not a memory
> barrier.
> 
> Maybe Paul has seen this pattern often enough he could simply tell
> us what conditions it is safe in. But for me to work that out from
> first principles? I just don't have the time to do that right now.

If the code does just the right sequence of things on the removal path
(remove, decrement reference, wait for reference to go to zero, wait for
grace period, free), then it would work.  If this is what is happening,
I would argue for more comments.  ;-)

							Thanx, Paul

> > IIUC this is why Dave in [4] suggests unifying shrink_slab() with
> > shrink_slab_memcg(), as the latter doesn't iterate the list but uses IDR.
> 
> Yes, I suggested the IDR route because radix tree lookups under RCU
> with reference counted objects are a known safe pattern that we can
> easily confirm is correct or not.  Hence I suggested the unification
> + IDR route because it makes the life of reviewers so, so much
> easier...
> 
> Cheers,
> 
> Dave.
> -- 
> Dave Chinner
> david@fromorbit.com

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

