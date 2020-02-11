Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 5DEDF158B67
	for <lists+dm-devel@lfdr.de>; Tue, 11 Feb 2020 09:42:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1581410522;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ErFraaw1YwqUBtIJFo2T4eeVHutF57E31ma/ZmxfVqw=;
	b=Lx7rg97ZE2luodRKiSIepHPxQrV10LKboLVWYykKCr0wINNKdQli8nhPLyxhEL+75Z6DX/
	jHzsVDpiv2AXUSLzr1j+50Jm7hPBBWq6kFNNRMWYpSDihg546Er8zgKbnZVsnofYFeA5dk
	yOZv84pN+oBOC4GZiAkf4xS2FqqtWkA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-228-RCFtcBcxNGykY_RM3yZohg-1; Tue, 11 Feb 2020 03:41:29 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 40B2610CE78A;
	Tue, 11 Feb 2020 08:41:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E25F15DA2C;
	Tue, 11 Feb 2020 08:41:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 199EF8B2A2;
	Tue, 11 Feb 2020 08:41:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01B8fIGs008509 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 11 Feb 2020 03:41:18 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 1525010AF9D2; Tue, 11 Feb 2020 08:41:18 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0FC9D10AF9CF
	for <dm-devel@redhat.com>; Tue, 11 Feb 2020 08:41:16 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F06BD185B0AF
	for <dm-devel@redhat.com>; Tue, 11 Feb 2020 08:41:15 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-248-YityB1v4N8epJX_zqJQWWw-1;
	Tue, 11 Feb 2020 03:41:14 -0500
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 1FA44AD05;
	Tue, 11 Feb 2020 08:40:52 +0000 (UTC)
Message-ID: <2c4135621e915a436919b5c6c32acd2c8ef179e3.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: Benjamin Marzinski <bmarzins@redhat.com>, Christophe Varoqui
	<christophe.varoqui@opensvc.com>
Date: Tue, 11 Feb 2020 09:42:21 +0100
In-Reply-To: <1580929100-32572-16-git-send-email-bmarzins@redhat.com>
References: <1580929100-32572-1-git-send-email-bmarzins@redhat.com>
	<1580929100-32572-16-git-send-email-bmarzins@redhat.com>
User-Agent: Evolution 3.34.3
MIME-Version: 1.0
X-MC-Unique: YityB1v4N8epJX_zqJQWWw-1
X-MC-Unique: RCFtcBcxNGykY_RM3yZohg-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01B8fIGs008509
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH v2 15/17] libmultipath: make directio checker
 share io contexts
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, 2020-02-05 at 12:58 -0600, Benjamin Marzinski wrote:
> On systems with a large number of cores (>500), io_destroy() can take
> tens to hundreds of milliseconds to complete, due to RCU
> synchronization. If there are a large number of paths using the
> directio
> checker on such a system, this can lead to multipath taking almost a
> minute to complete, with the vast majority of time taken up by
> io_destroy().
> 
> To solve this, the directio checker now allocates one aio context for
> every 1024 checkers. This reduces the io_destroy() delay to a
> thousandth
> of its previous level. However, this means that muliple checkers are
> sharing the same aio context, and must be able to handle getting
> results
> for other checkers.  Because only one checker is ever running at a
> time, this doesn't require any locking.  However, locking could be
> added
> in the future if necessary, to allow multiple checkers to run at the
> same time.
> 
> When checkers are freed, they usually no longer destroy the io
> context.
> Instead, they attempt to cancel any outstanding request. If that
> fails,
> they put the request on an orphan list, so that it can be freed by
> other
> checkers, once it has completed. IO contexts are only destroyed at
> three
> times, during reconfigure (to deal with the possibility that
> multipathd
> is holding more aio events than it needs to be, since there is a
> single
> limit for the whole system), when the checker class is unloaded, and
> in a corner case when checkers are freed. If an aio_group (which
> contains the aio context) is entirely full of orphaned requests, then
> no checker can use it. Since no checker is using it, there is no
> checker
> to clear out the orphaned requests. In this (likely rare) case, the
> last checker from that group to be freed and leave behind an orphaned
> request will call io_destroy() and remove the group.
> 
> Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
> ---
>  libmultipath/checkers/directio.c | 336 +++++++++++++++++++++++++--
> ----
>  multipath/multipath.conf.5       |   7 +-
>  2 files changed, 281 insertions(+), 62 deletions(-)

Reviewed-by: Martin Wilck <mwilck@suse.com>

(some minor nitpicks to be fixed in follow-up patch)



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

