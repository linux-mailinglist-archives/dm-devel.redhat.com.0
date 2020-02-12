Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 65D0015AD90
	for <lists+dm-devel@lfdr.de>; Wed, 12 Feb 2020 17:42:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1581525766;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=g/n4FbPbCGpmM79SbBGhyue5jDcIJk/B69eoihLQiuo=;
	b=SA5y4S7KjUMr4mQ+PWBcBnvnfxnxtCUH7vfTE76ogLUB0wY6MCZDtGx15ZyXE+6At3t8im
	t2ZCp6OOUyO9O7kpggo5rrjeawU5EoPMYJY13pGNLyZBdu9Hlj56XZCoYLki3slry9eYxV
	I/lAi/oTqDecAMN0MSV9/zX6kQYj1AE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-56-vT7bi9LFPeac7wvjbTvI6Q-1; Wed, 12 Feb 2020 11:42:40 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E77F28017CC;
	Wed, 12 Feb 2020 16:42:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 87F808AC22;
	Wed, 12 Feb 2020 16:42:27 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 159538B2A5;
	Wed, 12 Feb 2020 16:42:15 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01CGg2sB031392 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 12 Feb 2020 11:42:02 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 0113F2093CF9; Wed, 12 Feb 2020 16:42:02 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EE5D72093CC1
	for <dm-devel@redhat.com>; Wed, 12 Feb 2020 16:41:59 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AAD978032B3
	for <dm-devel@redhat.com>; Wed, 12 Feb 2020 16:41:59 +0000 (UTC)
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
	[209.85.160.200]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-6-4PPDZ6sPP5KZxfiv6eDvAg-1; Wed, 12 Feb 2020 11:41:57 -0500
Received: by mail-qt1-f200.google.com with SMTP id e8so1636567qtg.9
	for <dm-devel@redhat.com>; Wed, 12 Feb 2020 08:41:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=o641c6SHP/uMS6yMIFc1TvMEZg1SqVNZ7n302PTY/TI=;
	b=B7YPEpsa/m7nCUx/GTOAVgR4XnLY2ckMPdttsqBIfMqv07KvkG4QEesci89/F+GGj6
	pDSKK2MJbuCa1ByySTt38XCRUJ/0/qV1dIPSR5zPhkxtYnW/PEJloV1YVjBveBxxh7R+
	gHnOW+1+dHTsl96PzBWExuIu1dI1r550agSc3ZRED3JBnNUnnHCB/Q1xt8X0a5xPEecj
	KXf0wOqB6iu5EgcA4TGRFs687vdj2LVDFCn63+hPHUGsWSaomyG64N2EM4kxHuElW/fG
	3vw11yQGWfQ336BXolIbnqaVwSuXK7tJ03Y1JbNqKQZ6WgJiQkKBppnAozM1PpCZ1fEs
	kvVg==
X-Gm-Message-State: APjAAAXGr+ehHKzo0s0zxRfJ+l28auk5sUJEY8OVEqXB/H6olaO6dpEF
	mT6Ys2ZZZI3FaS1vvOwjC8cqaAHPJHs6C4wmuTjTkam8B+3v2OaOZhE37kXjcWbUG91nlZt5E6q
	jLLJlXNh2WkTFKGSWlPoTqCTMBy0pn9I=
X-Received: by 2002:ad4:4c42:: with SMTP id cs2mr8034928qvb.198.1581525717203; 
	Wed, 12 Feb 2020 08:41:57 -0800 (PST)
X-Google-Smtp-Source: APXvYqyxQx8b70LFwsYtAFX5hxZ8x+c9qfjOAD+kt4e/414rvLfPQdyAjOHGbItGk8IDFhuaChm3G3jREUqfNxWTsbw=
X-Received: by 2002:ad4:4c42:: with SMTP id cs2mr8034918qvb.198.1581525716998; 
	Wed, 12 Feb 2020 08:41:56 -0800 (PST)
MIME-Version: 1.0
References: <alpine.LRH.2.02.2002121015310.19039@file01.intranet.prod.int.rdu2.redhat.com>
In-Reply-To: <alpine.LRH.2.02.2002121015310.19039@file01.intranet.prod.int.rdu2.redhat.com>
From: John Dorminy <jdorminy@redhat.com>
Date: Wed, 12 Feb 2020 11:41:46 -0500
Message-ID: <CAMeeMh9NyhQAEVOhHMTOBMxXM4Tt=_k5UwY_M2uXZmwwsRBhZw@mail.gmail.com>
To: Mikulas Patocka <mpatocka@redhat.com>
X-MC-Unique: 4PPDZ6sPP5KZxfiv6eDvAg-1
X-MC-Unique: vT7bi9LFPeac7wvjbTvI6Q-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01CGg2sB031392
X-loop: dm-devel@redhat.com
Cc: Corey Marthaler <cmarthal@redhat.com>, Mike Snitzer <msnitzer@redhat.com>,
	David Teigland <teigland@redhat.com>,
	device-mapper development <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH] dm-writecache: fix a crash when unloading
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

> Also, the test "!dm_suspended(wc->ti)" in writecache_writeback is not
> sufficient, because dm_suspended returns zero while writecache_suspend is
> in progress. We add a variable wc->suspending and set it in
> writecache_suspend. Without this variable, drain_workqueue would spit
> warnings:
> workqueue writecache-writeback: drain_workqueue() isn't complete after 10 tries
> workqueue writecache-writeback: drain_workqueue() isn't complete after 100 tries
> workqueue writecache-writeback: drain_workqueue() isn't complete after 200 tries
> workqueue writecache-writeback: drain_workqueue() isn't complete after 300 tries
> workqueue writecache-writeback: drain_workqueue() isn't complete after 400 tries

This I don't understand.

writecache_suspend is a postsuspend function.

Here's a partial call chain representing suspending a table:
dm_suspend()
  __dm_suspend(...,DMF_SUSPENDED)
    ...do suspend stuff...
    set_bit(dmf_suspended_flags, ...) // DMF_SUSPENDED
  dm_table_postsuspend_targets()
    // for each segment, call that segments' postsuspend function

And dm_suspended() calls dm_suspended_md() which checks whether
DMF_SUSPENDED is set.

So, by the time the targets' postsuspend function gets called,
dm_suspended() should be returning 1, and the existing conditional
should be preventing requeuing. So I worry there's something deeper
going on here...

Additionally, I don't think wc->suspending is multithread safe -- it's
getting set on one thread and getting checked on another thread,
right? So the CPU running the workqueue thread is free to read
wc->suspending and then later on write it to the value it read, even
if the other thread has attempted to write a different value in
between.


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

