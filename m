Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id D70BF15B00F
	for <lists+dm-devel@lfdr.de>; Wed, 12 Feb 2020 19:44:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1581533076;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=qCB6xrNauwi3iadUMRipDz9718z/mjX+QpJIuLTAkIg=;
	b=aWledCcdijeJiWwujPkFV7crJgM1vUv1zbfqhfPuLaMsYX00bG7SBGI3f753vNOtntw0mG
	CISEuEP9RSQHR5tbTXcP84Gg1VWT6z9hgAq5MEu8FJgw5lMKETFpvsmn7dquNJKYHoAuga
	aGaXk+DGO7L7Kg87u/zQQK5DqPLjODI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-24-hQ_rmAFaMC2lbF0YlCqBjw-1; Wed, 12 Feb 2020 13:44:34 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9D0608010CB;
	Wed, 12 Feb 2020 18:44:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8D83719C6A;
	Wed, 12 Feb 2020 18:44:26 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3ECA61803C32;
	Wed, 12 Feb 2020 18:44:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01CIiDlZ007460 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 12 Feb 2020 13:44:13 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 7470A8AC2A; Wed, 12 Feb 2020 18:44:13 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B7DA48AC24;
	Wed, 12 Feb 2020 18:44:08 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id 01CIi7Qf005506; Wed, 12 Feb 2020 13:44:07 -0500
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id 01CIi7l8005502; Wed, 12 Feb 2020 13:44:07 -0500
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Wed, 12 Feb 2020 13:44:07 -0500 (EST)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: John Dorminy <jdorminy@redhat.com>
In-Reply-To: <CAMeeMh9NyhQAEVOhHMTOBMxXM4Tt=_k5UwY_M2uXZmwwsRBhZw@mail.gmail.com>
Message-ID: <alpine.LRH.2.02.2002121338450.3607@file01.intranet.prod.int.rdu2.redhat.com>
References: <alpine.LRH.2.02.2002121015310.19039@file01.intranet.prod.int.rdu2.redhat.com>
	<CAMeeMh9NyhQAEVOhHMTOBMxXM4Tt=_k5UwY_M2uXZmwwsRBhZw@mail.gmail.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: hQ_rmAFaMC2lbF0YlCqBjw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On Wed, 12 Feb 2020, John Dorminy wrote:

> > Also, the test "!dm_suspended(wc->ti)" in writecache_writeback is not
> > sufficient, because dm_suspended returns zero while writecache_suspend is
> > in progress. We add a variable wc->suspending and set it in
> > writecache_suspend. Without this variable, drain_workqueue would spit
> > warnings:
> > workqueue writecache-writeback: drain_workqueue() isn't complete after 10 tries
> > workqueue writecache-writeback: drain_workqueue() isn't complete after 100 tries
> > workqueue writecache-writeback: drain_workqueue() isn't complete after 200 tries
> > workqueue writecache-writeback: drain_workqueue() isn't complete after 300 tries
> > workqueue writecache-writeback: drain_workqueue() isn't complete after 400 tries
> 
> This I don't understand.
> 
> writecache_suspend is a postsuspend function.
> 
> Here's a partial call chain representing suspending a table:
> dm_suspend()
>   __dm_suspend(...,DMF_SUSPENDED)
>     ...do suspend stuff...
>     set_bit(dmf_suspended_flags, ...) // DMF_SUSPENDED
>   dm_table_postsuspend_targets()
>     // for each segment, call that segments' postsuspend function
> 
> And dm_suspended() calls dm_suspended_md() which checks whether
> DMF_SUSPENDED is set.
> 
> So, by the time the targets' postsuspend function gets called,
> dm_suspended() should be returning 1, and the existing conditional
> should be preventing requeuing. So I worry there's something deeper
> going on here...

When the device is being deleted, the postsuspend function is called 
without the DMF_SUSPENDED flag - see the function __dm_destroy. We could 
test for DMF_DELETING or DMF_FREEING, but there is no exported function 
that checks them.

Should we set DMF_SUSPENDED when deleting the device? Perhaps yes, but it 
could change behavior of other targets.

> Additionally, I don't think wc->suspending is multithread safe -- it's
> getting set on one thread and getting checked on another thread,
> right? So the CPU running the workqueue thread is free to read
> wc->suspending and then later on write it to the value it read, even
> if the other thread has attempted to write a different value in
> between.

In all three cases where wc->suspending is accessed, we hold the 
writecache lock.

Mikulas

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

