Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id EFBD322B598
	for <lists+dm-devel@lfdr.de>; Thu, 23 Jul 2020 20:24:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1595528659;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=6Ecm14AGMBbz7sT/TpJGWw8z/+TdUYK5/P50cYm056c=;
	b=bB0FBchdNzTwy0RuLP9aURXNaC6jpPjPw2k5Wm7GTpb4kBjs2ivTEZyKycfUr4ZXlfw0Li
	2D1nIwbPdwJsHdgShbFLhoklulGS9KIt6A9QC6XP4GdUUT+eCjougTlCQ5/k8IjIFAJzC9
	CGyDhB4S/wEMVDEw0I/ogWyrwHLR+Bk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-418-l96i2dGoNZWNxXmC_45d_A-1; Thu, 23 Jul 2020 14:24:09 -0400
X-MC-Unique: l96i2dGoNZWNxXmC_45d_A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9D9801005504;
	Thu, 23 Jul 2020 18:24:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CC8AF76208;
	Thu, 23 Jul 2020 18:24:00 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CD682730C5;
	Thu, 23 Jul 2020 18:23:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06NINXwW005899 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 23 Jul 2020 14:23:33 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3DD9371D31; Thu, 23 Jul 2020 18:23:33 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CA9C35BAD5;
	Thu, 23 Jul 2020 18:23:29 +0000 (UTC)
Date: Thu, 23 Jul 2020 14:23:29 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Mikulas Patocka <mpatocka@redhat.com>
Message-ID: <20200723182328.GA3753@redhat.com>
References: <alpine.LRH.2.02.2007221444390.6426@file01.intranet.prod.int.rdu2.redhat.com>
	<20200722194536.GA28682@redhat.com>
	<alpine.LRH.2.02.2007221601140.16826@file01.intranet.prod.int.rdu2.redhat.com>
	<alpine.LRH.2.02.2007231036570.17947@file01.intranet.prod.int.rdu2.redhat.com>
MIME-Version: 1.0
In-Reply-To: <alpine.LRH.2.02.2007231036570.17947@file01.intranet.prod.int.rdu2.redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Marian Csontos <mcsontos@redhat.com>,
	Zdenek Kabelac <zkabelac@redhat.com>
Subject: Re: [dm-devel] [PATCH v2] dm-integrity: revert adc0daad366b to fix
	recalculation
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

On Thu, Jul 23 2020 at 10:42am -0400,
Mikulas Patocka <mpatocka@redhat.com> wrote:

> In order to fix this race condition, we add a function dm_suspending that
> is only true during the postsuspend phase and use it instead of
> dm_suspended.
> 

...

> Index: rhel8/drivers/md/dm.c
> ===================================================================
> --- rhel8.orig/drivers/md/dm.c
> +++ rhel8/drivers/md/dm.c
> @@ -140,6 +140,7 @@ EXPORT_SYMBOL_GPL(dm_bio_get_target_bio_
>  #define DMF_NOFLUSH_SUSPENDING 5
>  #define DMF_DEFERRED_REMOVE 6
>  #define DMF_SUSPENDED_INTERNALLY 7
> +#define DMF_SUSPENDING 8

Think I prefer DMF_POST_SUSPENDING.  If you're OK with that I can fix up
the code while I stage your commit.

Thanks,
Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

