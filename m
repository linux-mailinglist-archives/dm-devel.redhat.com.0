Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id A48D9243E7D
	for <lists+dm-devel@lfdr.de>; Thu, 13 Aug 2020 19:49:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1597340968;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=m1QyltqH4iz8+L3Q8dGU3A6goe5evYoZKKfB9jIjPz4=;
	b=BlBvpMrvKX9qQgEYDOnCQBna6YAXJVZ2fa2Tz9O0QTTa1jGc2pnetPI/eO68Msih+fayWs
	pLV7MOiNtE0glPOEWu61jDKRQ6wUZScnEKbImedYe9ty7GQ+EzyF0dNnw5TDHp5kaxcV2Q
	86q5iRKuFh+I5RozwnfUCP5OjIVTfko=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-194-uQTMfF3yNcuYYYkSn4mwxg-1; Thu, 13 Aug 2020 13:49:26 -0400
X-MC-Unique: uQTMfF3yNcuYYYkSn4mwxg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 026751005504;
	Thu, 13 Aug 2020 17:49:19 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E83596FDAF;
	Thu, 13 Aug 2020 17:49:15 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7FF554EE1A;
	Thu, 13 Aug 2020 17:49:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07DHl8Rn009601 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 13 Aug 2020 13:47:08 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 201D8600E4; Thu, 13 Aug 2020 17:47:08 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E702B600D4;
	Thu, 13 Aug 2020 17:47:04 +0000 (UTC)
Date: Thu, 13 Aug 2020 13:47:04 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <20200813174704.GA6137@redhat.com>
References: <20200806191943.GA27868@redhat.com>
	<6B826235-C504-4621-B8F7-34475B200979@netapp.com>
	<20200807000755.GA28957@redhat.com>
	<510f5aff-0437-b1ce-f7ab-c812edbea880@grimberg.me>
	<20200807045015.GA29737@redhat.com>
	<fec745aa-0091-ee1f-cb0f-da9e18cf0aa2@grimberg.me>
	<20200810143620.GA19127@redhat.com>
	<20200810172209.GA19535@redhat.com>
	<20200813144811.GA5452@redhat.com>
	<20200813153623.GA30905@infradead.org>
MIME-Version: 1.0
In-Reply-To: <20200813153623.GA30905@infradead.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Cc: Sagi Grimberg <sagi@grimberg.me>, Ewan Milne <emilne@redhat.com>,
	dm-devel@redhat.com, linux-nvme@lists.infradead.org,
	Chao Leng <lengchao@huawei.com>, Keith Busch <kbusch@kernel.org>,
	"Meneghini, John" <John.Meneghini@netapp.com>
Subject: Re: [dm-devel] [RESEND PATCH] nvme: explicitly use normal NVMe
 error handling when appropriate
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thu, Aug 13 2020 at 11:36am -0400,
Christoph Hellwig <hch@infradead.org> wrote:

> On Thu, Aug 13, 2020 at 10:48:11AM -0400, Mike Snitzer wrote:
> > Commit 764e9332098c0 ("nvme-multipath: do not reset on unknown
> > status"), among other things, fixed NVME_SC_CMD_INTERRUPTED error
> > handling by changing multipathing's nvme_failover_req() to short-circuit
> > path failover and then fallback to NVMe's normal error handling (which
> > takes care of NVME_SC_CMD_INTERRUPTED).
> > 
> > This detour through native NVMe multipathing code is unwelcome because
> > it prevents NVMe core from handling NVME_SC_CMD_INTERRUPTED independent
> > of any multipathing concerns.
> > 
> > Introduce nvme_status_needs_local_error_handling() to prioritize
> > non-failover retry, when appropriate, in terms of normal NVMe error
> > handling.  nvme_status_needs_local_error_handling() will naturely evolve
> > to include handling of any other errors that normal error handling must
> > be used for.
> > 
> > nvme_failover_req()'s ability to fallback to normal NVMe error handling
> > has been preserved because it may be useful for future NVME_SC that
> > nvme_status_needs_local_error_handling() hasn't been trained for yet.
> > 
> > Signed-off-by: Mike Snitzer <snitzer@redhat.com>
> 
> I don't see how this would change anything.  nvme_failover_req simply
> retuns false for NVME_SC_CMD_INTERRUPTED, so your change is a no-op.

This is just a tweak to improve the high-level fault tree of core NVMe
error handling.  No functional change, but for such basic errors,
avoiding entering nvme_failover_req is meaningful on a code flow level.
Makes code to handle errors that need local retry clearer by being more
structured, less circuitous.

Allows NVMe core's handling of such errors to be more explicit and live
in core.c rather than multipath.c -- so things like ACRE handling can be
made explicitly part of core and not nested under nvme_failover_req's
relatively obscure failsafe that returns false for anything it doesn't
care about.

Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

