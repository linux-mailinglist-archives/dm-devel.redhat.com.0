Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 8BC5020AE4F
	for <lists+dm-devel@lfdr.de>; Fri, 26 Jun 2020 10:14:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1593159280;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ZVxVegfh4CZbl3JiGPiaTknMigh1WwnOJHyqYvmtDuc=;
	b=JQEfP8HRQlVYzhMzO3+rmQWgWUbOTvbZ2r6NOyV8HZD53xxFMM+DZ8lR0fyl6JOGy1azlV
	Y2+lZdZZDR/9DBr+ye5HcM3HfJuHM254UKkd52pgdFowhMqffBcFozlB7JYPLPisbnzTE+
	NcTmlfV+SiC1j3OYhKhRLqrQ3LNYCK4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-299-kTZhcdwDMVuOSxLMXDjgEQ-1; Fri, 26 Jun 2020 04:14:38 -0400
X-MC-Unique: kTZhcdwDMVuOSxLMXDjgEQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 18EC5800C60;
	Fri, 26 Jun 2020 08:14:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ECA1D5C578;
	Fri, 26 Jun 2020 08:14:31 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id ADD891809563;
	Fri, 26 Jun 2020 08:14:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05PKf2HQ013554 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 25 Jun 2020 16:41:02 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id CFB662144B39; Thu, 25 Jun 2020 20:41:01 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 953B5200ACAE
	for <dm-devel@redhat.com>; Thu, 25 Jun 2020 20:40:58 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9FB988007D6
	for <dm-devel@redhat.com>; Thu, 25 Jun 2020 20:40:58 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-335-14AhWeRqMDGZRS82atZ6LA-1; Thu, 25 Jun 2020 16:40:56 -0400
X-MC-Unique: 14AhWeRqMDGZRS82atZ6LA-1
Received: from willy by casper.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1joYft-00055m-0p; Thu, 25 Jun 2020 20:40:45 +0000
Date: Thu, 25 Jun 2020 21:40:44 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Michal Hocko <mhocko@kernel.org>
Message-ID: <20200625204044.GH7703@casper.infradead.org>
References: <20200625113122.7540-1-willy@infradead.org>
	<20200625184832.GP7606@magnolia>
	<20200625203611.GS1320@dhcp22.suse.cz>
MIME-Version: 1.0
In-Reply-To: <20200625203611.GS1320@dhcp22.suse.cz>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Fri, 26 Jun 2020 04:13:56 -0400
Cc: Jens Axboe <axboe@kernel.dk>, "Darrick J. Wong" <darrick.wong@oracle.com>,
	linux-kernel@vger.kernel.org, linux-xfs@vger.kernel.org,
	linux-mm@kvack.org, dm-devel@redhat.com,
	Yafang Shao <laoar.shao@gmail.com>, Mikulas Patocka <mpatocka@redhat.com>
Subject: Re: [dm-devel] [PATCH 0/6] Overhaul memalloc_no*
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

On Thu, Jun 25, 2020 at 10:36:11PM +0200, Michal Hocko wrote:
> On Thu 25-06-20 11:48:32, Darrick J. Wong wrote:
> > On Thu, Jun 25, 2020 at 12:31:16PM +0100, Matthew Wilcox (Oracle) wrote:
> > > I want a memalloc_nowait like we have memalloc_noio and memalloc_nofs
> > > for an upcoming patch series, and Jens also wants it for non-blocking
> > > io_uring.  It turns out we already have dm-bufio which could benefit
> > > from memalloc_nowait, so it may as well go into the tree now.
> > > 
> > > The biggest problem is that we're basically out of PF_ flags, so we need
> > > to find somewhere else to store the PF_MEMALLOC_NOWAIT flag.  It turns
> > > out the PF_ flags are really supposed to be used for flags which are
> > > accessed from other tasks, and the MEMALLOC flags are only going to
> > > be used by this task.  So shuffling everything around frees up some PF
> > > flags and generally makes the world a better place.
> > 
> > So, uh, how does this intersect with the patch "xfs: reintroduce
> > PF_FSTRANS for transaction reservation recursion protection" that
> > re-adds PF_TRANS because uh I guess we lost some subtlety or another at
> > some point?
> 
> This is independent, really. It just relocates the NOFS flag. PF_TRANS
> is reintroduced for a different reason. When I have replaced the
> original PF_TRANS by PF_MEMALLOC_NOFS I didn't realized that xfs doesn't
> need only the NOFS semantic but also the transaction tracking so this
> cannot be a single bit only. So it has to be added back. But
> PF_MEMALLOC_NOFS needs to stay for the scoped NOFS semantic.

If XFS needs to track transactions, why doesn't it use
current->journal_info like btrfs/ceph/ext4/gfs2/nilfs2/reiserfs?

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

