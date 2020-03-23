Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [63.128.21.74])
	by mail.lfdr.de (Postfix) with ESMTP id 3F99C18FA9F
	for <lists+dm-devel@lfdr.de>; Mon, 23 Mar 2020 17:58:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1584982711;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=7whBzQpqjv35LjNnmtuPGW6lrJYijpvwf5nhITvJgrg=;
	b=WEGn83UyU+uIcdcjIQZDUb8u6eHOXOgAKZ+90/5k5oH/VESKGUYx0ncs9LId0dn1KH9U1J
	t1NjXQmwkUGHUL6nO+b/KhSXcLDWq9J9oCzIhWJHU/wJAmwfvGEnXu/HdLggA/hxb0MKP2
	DYQLYpIB8VzRAdZwKWvComj+mbpauQM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-432-uHHpwb8IMF6NathYhhBgog-1; Mon, 23 Mar 2020 12:58:25 -0400
X-MC-Unique: uHHpwb8IMF6NathYhhBgog-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8FE4913EA;
	Mon, 23 Mar 2020 16:58:19 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4C02960C05;
	Mon, 23 Mar 2020 16:58:19 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 213DA18089CD;
	Mon, 23 Mar 2020 16:58:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02NGwBAt007142 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 23 Mar 2020 12:58:11 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C5A955DA7B; Mon, 23 Mar 2020 16:58:11 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7AD6D5D9C5;
	Mon, 23 Mar 2020 16:58:01 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id 02NGw0Uv011669; Mon, 23 Mar 2020 12:58:00 -0400
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id 02NGw0sc011665; Mon, 23 Mar 2020 12:58:00 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Mon, 23 Mar 2020 12:58:00 -0400 (EDT)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Mike Snitzer <snitzer@redhat.com>
In-Reply-To: <20200323142817.GA27360@redhat.com>
Message-ID: <alpine.LRH.2.02.2003231255320.10387@file01.intranet.prod.int.rdu2.redhat.com>
References: <20200322194220.074515600@debian-a64.vm>
	<20200323142817.GA27360@redhat.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, David Teigland <teigland@redhat.com>
Subject: Re: [dm-devel] [PATCH 0/7] dm-integrity patches
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On Mon, 23 Mar 2020, Mike Snitzer wrote:

> On Sun, Mar 22 2020 at  3:42pm -0400,
> Mikulas Patocka <mpatocka@redhat.com> wrote:
> 
> > Hi
> > 
> > Here I'm sending dm-integrity patches for the upcoming merge window.
> > They supersede dm-integrity patches that I sent before.
> 
> So the dm-bufio discard support isn't needed with your latest
> dm-integrity patches right?
> 
> https://patchwork.kernel.org/patch/11371287/

Yes - it isn't needed until Heinz uses it in the ebs target.

That patch (if used) should also be optimized to walk the rb-tree instead 
of doing lookup of every block number in the range.

Mikulas

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

