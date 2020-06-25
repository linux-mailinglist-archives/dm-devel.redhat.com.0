Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 1647F20AE4C
	for <lists+dm-devel@lfdr.de>; Fri, 26 Jun 2020 10:14:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1593159273;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=wmD67dV9f+RHGZoZ3RsSIc8kSFj9V9efmFHRzjiMY2o=;
	b=VgwHha83RtY/iODBmtmW+XE0LCGv36Z3UIaDA+s5c7/TyBrcJs9U0t77BGX/A+CmYsx5YF
	DT2xAm+86uJ34uBBkxfKaVN8eNaOJ5iWh43WxqJKyuX3zynhwMM0Bl5ZM1Fwck2RldlhPW
	7hoIGF/F6mRVGXfDjFQ3jJ9xtUEQgys=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-209-hxOJtI20NSmUmRJxxFT4lA-1; Fri, 26 Jun 2020 04:14:29 -0400
X-MC-Unique: hxOJtI20NSmUmRJxxFT4lA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 616908015FB;
	Fri, 26 Jun 2020 08:14:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 418865C6BD;
	Fri, 26 Jun 2020 08:14:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 03A80875B3;
	Fri, 26 Jun 2020 08:14:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05PCYSTD028304 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 25 Jun 2020 08:34:29 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id CBBCB2022EA2; Thu, 25 Jun 2020 12:34:28 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C72E5202A942
	for <dm-devel@redhat.com>; Thu, 25 Jun 2020 12:34:26 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9D02F805F41
	for <dm-devel@redhat.com>; Thu, 25 Jun 2020 12:34:26 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-296-QMvVS5dCN1K3sWKx6JG2Ug-1; Thu, 25 Jun 2020 08:34:24 -0400
X-MC-Unique: QMvVS5dCN1K3sWKx6JG2Ug-1
Received: from willy by casper.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1joR58-00051J-Dq; Thu, 25 Jun 2020 12:34:18 +0000
Date: Thu, 25 Jun 2020 13:34:18 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Michal Hocko <mhocko@kernel.org>
Message-ID: <20200625123418.GB7703@casper.infradead.org>
References: <20200625113122.7540-1-willy@infradead.org>
	<20200625113122.7540-2-willy@infradead.org>
	<20200625122239.GJ1320@dhcp22.suse.cz>
MIME-Version: 1.0
In-Reply-To: <20200625122239.GJ1320@dhcp22.suse.cz>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Fri, 26 Jun 2020 04:13:56 -0400
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thu, Jun 25, 2020 at 02:22:39PM +0200, Michal Hocko wrote:
> On Thu 25-06-20 12:31:17, Matthew Wilcox wrote:
> > We're short on PF_* flags, so make memalloc_noio its own bit where we
> > have plenty of space.
> 
> I do not mind moving that outside of the PF_* space. Unless I
> misremember all flags in this space were intented to be set only on the
> current which rules out any RMW races and therefore they can be
> lockless. I am not sure this holds for the bitfield you are adding this
> to. At least in_memstall seem to be set on external task as well. But
> this would require double checking. Maybe that is not really intended or
> just a bug.

I was going from the comment:

        /* Unserialized, strictly 'current' */
(which you can't see from the context of the diff, but is above the block)

The situation with ->flags is a little more ambiguous:

/*
 * Only the _current_ task can read/write to tsk->flags, but other
 * tasks can access tsk->flags in readonly mode for example
 * with tsk_used_math (like during threaded core dumping).
 * There is however an exception to this rule during ptrace
 * or during fork: the ptracer task is allowed to write to the
 * child->flags of its traced child (same goes for fork, the parent
 * can write to the child->flags), because we're guaranteed the
 * child is not running and in turn not changing child->flags
 * at the same time the parent does it.
 */

but it wasn't unsafe to use the PF_ flags in the way that you were.
It's just crowded.

If in_memstall is set on other tasks, then it should be moved to the
PFA flags, which there are plenty of.

But a quick grep shows it only being read on other tasks and always
set on current:

kernel/sched/psi.c:     *flags = current->in_memstall;
kernel/sched/psi.c:      * in_memstall setting & accounting needs to be atomic wrt
kernel/sched/psi.c:     current->in_memstall = 1;
kernel/sched/psi.c:      * in_memstall clearing & accounting needs to be atomic wrt
kernel/sched/psi.c:     current->in_memstall = 0;
kernel/sched/psi.c:     if (task->in_memstall)
kernel/sched/stats.h:           if (p->in_memstall)
kernel/sched/stats.h:           if (p->in_memstall)
kernel/sched/stats.h:   if (unlikely(p->in_iowait || p->in_memstall)) {
kernel/sched/stats.h:           if (p->in_memstall)
kernel/sched/stats.h:   if (unlikely(rq->curr->in_memstall))

so I think everything is fine.

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

