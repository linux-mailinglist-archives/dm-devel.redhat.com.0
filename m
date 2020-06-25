Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 9710D209EB1
	for <lists+dm-devel@lfdr.de>; Thu, 25 Jun 2020 14:43:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1593089006;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=jx+b2CxeIc1Rq9sexTvnYpdGZX3+KQo7n1yZp8MBV7U=;
	b=OO7zo9ejIIjscxm1aJlMiKkSLzrF/nZSDsdbgUdqos9hxrUyIWJJ6ktTe+1zjxvqTFFnfb
	TYHqaGTOV7xtqp+Zg9mhQD1G+CgzQT6Lrf8sjr2C/dHGQl5AhhWGwThyTVdRLZ242GbyO4
	yWsPqFgUP1D8ajAecbohzvJqpYrK778=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-213--FPZlkSAOhyNf4L2uXPReA-1; Thu, 25 Jun 2020 08:43:21 -0400
X-MC-Unique: -FPZlkSAOhyNf4L2uXPReA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2A67318585A3;
	Thu, 25 Jun 2020 12:43:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4CA0B7FE8B;
	Thu, 25 Jun 2020 12:43:14 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 33D8E1809547;
	Thu, 25 Jun 2020 12:43:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05PCggG8029258 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 25 Jun 2020 08:42:42 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2E4E8F77BD; Thu, 25 Jun 2020 12:42:42 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 29BE5F77B3
	for <dm-devel@redhat.com>; Thu, 25 Jun 2020 12:42:40 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 15E94100CF81
	for <dm-devel@redhat.com>; Thu, 25 Jun 2020 12:42:40 +0000 (UTC)
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-18-EQDNuMM-PEqUsEvJgGJUaQ-1; Thu, 25 Jun 2020 08:42:37 -0400
X-MC-Unique: EQDNuMM-PEqUsEvJgGJUaQ-1
Received: by mail-wm1-f65.google.com with SMTP id l2so4293960wmf.0;
	Thu, 25 Jun 2020 05:42:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=zqYYU+XzLTo4RZ3+vh2KfRtchjL+OjYySOUllgC9oo8=;
	b=LGpqD7IX/pDY6KdTKs6XwH4DpVnXUJkgZFFkWiMF+OVUZjoM/pPmhhceyFYc09s8zB
	+SyNoH1qGn8eP5dbtoipuUXIQpkhW0colaDj+m9I99pqvLyLe0CVljoE3DS5Fil3QByM
	60H8A+jC4U8a/6Bjwbm1xWWkbESWYxmJ0TsvX1DuDqN80UOjL0ENwq2M0BVyVNWGEx12
	AqRccDAj5HQ1UJptBLY5M8Dd/R5PwUd5BChpq2Ygf3dBeqWuSODYukc8Ph7hsYKlTcJf
	UR7mYeorp8PwG/gFrXNrBjROCYPVplYkKrYWd6q7uyfGpzUsxeY9yeb4pO7HLZ0lxPjc
	H/2Q==
X-Gm-Message-State: AOAM5316yLJui3MIgt3O7bHjF4a+VsGFVFc00x2Y/mIiyHcoELYzvc8Y
	QT0fOIa6vIEYqOK4XOsgStQ=
X-Google-Smtp-Source: ABdhPJwrxoXQ+HCO1VVYYUvEmwFEOPYklBv2D67vfvs9fNB1wlADT0sE5tlgxNrUNZ128ZofveX60g==
X-Received: by 2002:a1c:80c8:: with SMTP id b191mr3021699wmd.37.1593088956395; 
	Thu, 25 Jun 2020 05:42:36 -0700 (PDT)
Received: from localhost (ip-37-188-168-3.eurotel.cz. [37.188.168.3])
	by smtp.gmail.com with ESMTPSA id
	t5sm11739610wmj.37.2020.06.25.05.42.35
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 25 Jun 2020 05:42:35 -0700 (PDT)
Date: Thu, 25 Jun 2020 14:42:34 +0200
From: Michal Hocko <mhocko@kernel.org>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <20200625124234.GM1320@dhcp22.suse.cz>
References: <20200625113122.7540-1-willy@infradead.org>
	<20200625113122.7540-2-willy@infradead.org>
	<20200625122239.GJ1320@dhcp22.suse.cz>
	<20200625123418.GB7703@casper.infradead.org>
MIME-Version: 1.0
In-Reply-To: <20200625123418.GB7703@casper.infradead.org>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
Cc: Jens Axboe <axboe@kernel.dk>, linux-kernel@vger.kernel.org,
	linux-xfs@vger.kernel.org, linux-mm@kvack.org,
	dm-devel@redhat.com, Mikulas Patocka <mpatocka@redhat.com>
Subject: Re: [dm-devel] [PATCH 1/6] mm: Replace PF_MEMALLOC_NOIO with
	memalloc_noio
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thu 25-06-20 13:34:18, Matthew Wilcox wrote:
> On Thu, Jun 25, 2020 at 02:22:39PM +0200, Michal Hocko wrote:
> > On Thu 25-06-20 12:31:17, Matthew Wilcox wrote:
> > > We're short on PF_* flags, so make memalloc_noio its own bit where we
> > > have plenty of space.
> > 
> > I do not mind moving that outside of the PF_* space. Unless I
> > misremember all flags in this space were intented to be set only on the
> > current which rules out any RMW races and therefore they can be
> > lockless. I am not sure this holds for the bitfield you are adding this
> > to. At least in_memstall seem to be set on external task as well. But
> > this would require double checking. Maybe that is not really intended or
> > just a bug.
> 
> I was going from the comment:
> 
>         /* Unserialized, strictly 'current' */
> (which you can't see from the context of the diff, but is above the block)
> 
> The situation with ->flags is a little more ambiguous:
> 
> /*
>  * Only the _current_ task can read/write to tsk->flags, but other
>  * tasks can access tsk->flags in readonly mode for example
>  * with tsk_used_math (like during threaded core dumping).
>  * There is however an exception to this rule during ptrace
>  * or during fork: the ptracer task is allowed to write to the
>  * child->flags of its traced child (same goes for fork, the parent
>  * can write to the child->flags), because we're guaranteed the
>  * child is not running and in turn not changing child->flags
>  * at the same time the parent does it.
>  */

OK, I have obviously missed that.

> but it wasn't unsafe to use the PF_ flags in the way that you were.
> It's just crowded.
> 
> If in_memstall is set on other tasks, then it should be moved to the
> PFA flags, which there are plenty of.
> 
> But a quick grep shows it only being read on other tasks and always
> set on current:
> 
> kernel/sched/psi.c:     *flags = current->in_memstall;
> kernel/sched/psi.c:      * in_memstall setting & accounting needs to be atomic wrt
> kernel/sched/psi.c:     current->in_memstall = 1;
> kernel/sched/psi.c:      * in_memstall clearing & accounting needs to be atomic wrt
> kernel/sched/psi.c:     current->in_memstall = 0;
> kernel/sched/psi.c:     if (task->in_memstall)

Have a look at cgroup_move_task. So I believe this is something to be
fixed but independent on your change.

Feel free to add
Acked-by: Michal Hocko <mhocko@suse.com>

> kernel/sched/stats.h:           if (p->in_memstall)
> kernel/sched/stats.h:           if (p->in_memstall)
> kernel/sched/stats.h:   if (unlikely(p->in_iowait || p->in_memstall)) {
> kernel/sched/stats.h:           if (p->in_memstall)
> kernel/sched/stats.h:   if (unlikely(rq->curr->in_memstall))
> 
> so I think everything is fine.

-- 
Michal Hocko
SUSE Labs

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

