Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id AEC731FB0AB
	for <lists+dm-devel@lfdr.de>; Tue, 16 Jun 2020 14:28:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592310536;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=UQ5qUwivGu0xmcfsw/ZUFH1XzMRESCktVBgurlDCn/I=;
	b=W5v9fq8IrTD3p1mQIdjP9sPZsteOJBdRmOi8ylqlYRvyOtMalz6RhZCnkoCkg5rKqOYJeC
	w2v1/zQDpw9Va6qZMUVNxQXRt8Tbo2kF0Fw/4HpN9MQsV5dqa6vTWh6SoNglhQDHV2Zqk5
	AAmZ7oemMm1hunBxK4UM9mTPF2bF9rU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-42-U_XVJLRwPkWZdPePCr7yNg-1; Tue, 16 Jun 2020 08:28:53 -0400
X-MC-Unique: U_XVJLRwPkWZdPePCr7yNg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5A9C1835B5D;
	Tue, 16 Jun 2020 12:28:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BA69019D7D;
	Tue, 16 Jun 2020 12:28:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 586B6833BD;
	Tue, 16 Jun 2020 12:28:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05GCSDhR003076 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 16 Jun 2020 08:28:13 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8F27460F8D; Tue, 16 Jun 2020 12:28:13 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost.localdomain (unknown [10.33.36.159])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 48DC360C05;
	Tue, 16 Jun 2020 12:28:06 +0000 (UTC)
Date: Tue, 16 Jun 2020 13:28:03 +0100
From: "Bryn M. Reeves" <bmr@redhat.com>
To: yangerkun <yangerkun@huawei.com>, bgurney@redhat.com, agk@redhat.com,
	snitzer@redhat.com, dm-devel@redhat.com
Message-ID: <20200616122803.GA24935@localhost.localdomain>
References: <20200608084513.115671-1-yangerkun@huawei.com>
	<20200615170331.GA12312@agk-dp.fab.redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200615170331.GA12312@agk-dp.fab.redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH 0/2] introduce interface to list all	badblocks
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Mon, Jun 15, 2020 at 06:03:31PM +0100, Alasdair G Kergon wrote:
> On Mon, Jun 08, 2020 at 04:45:11PM +0800, yangerkun wrote:
> >     $ sudo dmsetup message dust1 0 listbadblocks
> > The following message will appear, listing one bad block number per
> 
> Did you consider returning the data directly to the caller so it
> can be accessed directly?
> 
> (e.g. like @stats_list handled in dm-stats.c)

Having this returned in the message response would certainly be more
natural and would simplify parsing the data: sending it to the log seems
like it would allow log lines from distinct devices to become
interleaved when the lists are long and the message is sent to two or
more devices near simultaneously. Without something to identify the
devices in each message you can't distinguish them.

Even with large numbers of bad blocks userspace libdevmapper will
automatically handle re-trying with a larger buffer if the list is too
big for the default.

We use (sometimes very large) message replies heavily in libdm-stats.

device-mapper.h provides the DMEMIT macro to output message replies.
See dm_stats_print() or various target status() functions for
examples.

Regards,
Bryn.

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

