Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 3ECCD20CD41
	for <lists+dm-devel@lfdr.de>; Mon, 29 Jun 2020 10:22:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1593418961;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=pvLOL4N0z/s98EYBeoNgo7HrMvf7BLETO/xdWuCWTvE=;
	b=frx+U7tWX9HSC77ltkBBmhrUToj7rfqqCt7wCGHJPOySpxEcZiXh/q6BVCLYyZzAg39Z64
	Xfup4Rw+bIaJpWgKhPuYPBMpvD3ib219G+na1kblDrCqr4W/R1K9WuBC3r4jUfk3SJXYUR
	AYqSFcAmHSgAxy6VCdqPGfBlaeIy6PY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-447-on6eW-lgNwO8Aa0w05R_cw-1; Mon, 29 Jun 2020 04:22:39 -0400
X-MC-Unique: on6eW-lgNwO8Aa0w05R_cw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5CE13800FF5;
	Mon, 29 Jun 2020 08:22:33 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 39CEF5F7D8;
	Mon, 29 Jun 2020 08:22:31 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7C6E518095FF;
	Mon, 29 Jun 2020 08:22:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05T8MKri009388 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 29 Jun 2020 04:22:20 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 702F710C39FE; Mon, 29 Jun 2020 08:22:20 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2D5031003345
	for <dm-devel@redhat.com>; Mon, 29 Jun 2020 08:22:18 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 26BA0858F0A
	for <dm-devel@redhat.com>; Mon, 29 Jun 2020 08:22:18 +0000 (UTC)
Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com
	[209.85.218.65]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-375-GJD-pvy-NqiADn_m6DtedA-1; Mon, 29 Jun 2020 04:22:13 -0400
X-MC-Unique: GJD-pvy-NqiADn_m6DtedA-1
Received: by mail-ej1-f65.google.com with SMTP id p20so15619873ejd.13;
	Mon, 29 Jun 2020 01:22:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=mPrydynbK5+rnDYJyI/EITf6/MzUF0CRG2o081Vq5dc=;
	b=OeF3mKxEjrG/9Zkvi3Gob6kjmEWE91jVgpLUkAHGRSpf5oHKW/p3sbmfJOYxsXKJzx
	imdvMEKns6PtsJv/6dRs7nlPCx+98mAbO6Jz8/jC3LjiX28/YFyVh5D3KtYKtPpSkd2p
	AQ/2YPg+uCaQt0WfFBSuggPEAqowmi9NLfbnC3DwLxmZpFDYPf1nNt0+jwgKu79bXiQp
	OyU2Eo1UgtVKs0JtRUCtefsxac3PNAFSkn0TMeCIedad1D0+5X8fecZFnXtaq1jblszh
	hXfkpUNpFfRwvIdloOTjXQfJWmIZ+fiHQH7am4jF+cBH/Xr5V5u4aOsCKt93BDTL02Pb
	fgEQ==
X-Gm-Message-State: AOAM531gNXehW5A1o6ypcMY4b50Mypw/qBErSbON7NMvqHylfo4Gwy/Y
	vihIXLksoDiufbeiCW23iTY=
X-Google-Smtp-Source: ABdhPJxpOcTkL4osdGXouPGkUvoEu+LR2SWHbzDt5dJZtwUNOJWJOn7V0ppda1Dcr/qptC9T6ZT4xQ==
X-Received: by 2002:a17:906:fa9b:: with SMTP id
	lt27mr12396115ejb.365.1593418931557; 
	Mon, 29 Jun 2020 01:22:11 -0700 (PDT)
Received: from localhost (ip-37-188-168-3.eurotel.cz. [37.188.168.3])
	by smtp.gmail.com with ESMTPSA id
	x10sm15592704ejc.46.2020.06.29.01.22.10
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 29 Jun 2020 01:22:10 -0700 (PDT)
Date: Mon, 29 Jun 2020 10:22:09 +0200
From: Michal Hocko <mhocko@kernel.org>
To: Dave Chinner <david@fromorbit.com>
Message-ID: <20200629082209.GC32461@dhcp22.suse.cz>
References: <20200625113122.7540-1-willy@infradead.org>
	<alpine.LRH.2.02.2006261058250.11899@file01.intranet.prod.int.rdu2.redhat.com>
	<20200626230847.GI2005@dread.disaster.area>
MIME-Version: 1.0
In-Reply-To: <20200626230847.GI2005@dread.disaster.area>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
Cc: Jens Axboe <axboe@kernel.dk>, linux-kernel@vger.kernel.org,
	"Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
	linux-xfs@vger.kernel.org, linux-mm@kvack.org,
	dm-devel@redhat.com, Mikulas Patocka <mpatocka@redhat.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Sat 27-06-20 09:08:47, Dave Chinner wrote:
> On Fri, Jun 26, 2020 at 11:02:19AM -0400, Mikulas Patocka wrote:
> > Hi
> > 
> > I suggest to join memalloc_noio and memalloc_nofs into just one flag that 
> > prevents both filesystem recursion and i/o recursion.
> > 
> > Note that any I/O can recurse into a filesystem via the loop device, thus 
> > it doesn't make much sense to have a context where PF_MEMALLOC_NOFS is set 
> > and PF_MEMALLOC_NOIO is not set.
> 
> Correct me if I'm wrong, but I think that will prevent swapping from
> GFP_NOFS memory reclaim contexts. IOWs, this will substantially
> change the behaviour of the memory reclaim system under sustained
> GFP_NOFS memory pressure. Sustained GFP_NOFS memory pressure is
> quite common, so I really don't think we want to telling memory
> reclaim "you can't do IO at all" when all we are trying to do is
> prevent recursion back into the same filesystem.
> 
> Given that the loop device IO path already operates under
> memalloc_noio context, (i.e. the recursion restriction is applied in
> only the context that needs is) I see no reason for making that a
> global reclaim limitation....
> 
> In reality, we need to be moving the other way with GFP_NOFS - to
> fine grained anti-recursion contexts, not more broad contexts.

Absolutely agreed! It is not really hard to see system struggling due to
heavy FS metadata workload while there are objects which could be
reclaimed.

> That is, GFP_NOFS prevents recursion into any filesystem, not just
> the one that we are actively operating on and needing to prevent
> recursion back into. We can safely have reclaim do relcaim work on
> other filesysetms without fear of recursion deadlocks, but the
> memory reclaim infrastructure does not provide that capability.(*)
> 
> e.g. if memalloc_nofs_save() took a reclaim context structure that
> the filesystem put the superblock, the superblock's nesting depth
> (because layering on loop devices can create cross-filesystem
> recursion dependencies), and any other filesyetm private data the
> fs wanted to add, we could actually have reclaim only avoid reclaim
> from filesytsems where there is a deadlock possiblity. e.g:
> 
> 	- superblock nesting depth is different, apply GFP_NOFS
> 	  reclaim unconditionally
> 	- superblock different apply GFP_KERNEL reclaim
> 	- superblock the same, pass context to filesystem to
> 	  decide if reclaim from the sueprblock is safe.
> 
> At this point, we get memory reclaim able to always be able to
> reclaim from filesystems that are not at risk of recursion
> deadlocks. Direct reclaim is much more likely to be able to make
> progress now because it is much less restricted in what it can
> reclaim. That's going to make direct relcaim faster and more
> efficient, and taht's the ultimate goal we are aiming to acheive
> here...

Yes, we have discussed something like that few years back at LSFMM IIRC.
The scoped NOFS/NOIO api was just a first step to reduce explicit
NOFS/NOIO usage with a hope that we will get no-recursion entry points
much more well defined and get rid of many instances where "this is a fs
code so it has to use NOFS gfp mask".

Some of that has happened and that is really great. On the other hand
many people still like to use that api as a workaround for an immediate
problem because no-recursion scopes are much harder to recognize unless
you are supper familiar with the specific fs/IO layer implementation.
So this is definitely not a project for somebody to go over all code and
just do the clean up.

Thanks!
-- 
Michal Hocko
SUSE Labs

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

