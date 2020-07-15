Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 8065B220E5F
	for <lists+dm-devel@lfdr.de>; Wed, 15 Jul 2020 15:43:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1594820627;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=WojcvowcxyEdQLe5EH2lNM3LPMRNhpxR4aCdsPYjSwY=;
	b=Da2HhepRalQHQdZ4Jpl7UwOm947B6sOxGNb+nw/2eLglD2G+yuAxdVDyvFxaKoMjCj/7XU
	xPqFdZwD9Phb8xu7z5DqsG+zBCX/t20Q7dLMvLs6+H5fpizQIUfg7htqU1muDMWhY3/dZU
	nnAEpzWcG+jn57Suj+QYkgo3uRT3jAw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-438-6VoyROzgOlOSZzIxcCb56Q-1; Wed, 15 Jul 2020 09:43:44 -0400
X-MC-Unique: 6VoyROzgOlOSZzIxcCb56Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5E25A8015F3;
	Wed, 15 Jul 2020 13:43:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F362C79CE4;
	Wed, 15 Jul 2020 13:43:29 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A6681180954D;
	Wed, 15 Jul 2020 13:43:15 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06FDh2IF008913 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 15 Jul 2020 09:43:02 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2A93779D00; Wed, 15 Jul 2020 13:43:02 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 33CC679D0B;
	Wed, 15 Jul 2020 13:42:59 +0000 (UTC)
Date: Wed, 15 Jul 2020 09:42:58 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Damien Le Moal <damien.lemoal@wdc.com>
Message-ID: <20200715134258.GB9501@redhat.com>
References: <20200715095217.441885-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
In-Reply-To: <20200715095217.441885-1-damien.lemoal@wdc.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH 0/8] Various cleanups
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

On Wed, Jul 15 2020 at  5:52am -0400,
Damien Le Moal <damien.lemoal@wdc.com> wrote:

> Mike,
> 
> These patches fix various compilation warnings showing up when compiling
> with W=1. The last patch addresses a static checker warning (C=1
> compilation). There are a lot more of these code checker warnings
> remaining that probably could be addressed, some seem to be false
> positive though.
> 
> Damien Le Moal (8):
>   dm raid5: Remove set but unused variable
>   dm raid5: Fix compilation warning
>   md: Fix compilation warning
>   dm raid10: Fix compilation warning
>   dm verity: Fix compilation warning
>   dm raid: Remove empty if statement
>   dm ioctl: Fix compilation warning
>   dm init: Set file local variable static
> 
>  drivers/md/dm-init.c              |  2 +-
>  drivers/md/dm-ioctl.c             |  2 +-
>  drivers/md/dm-raid.c              |  2 --
>  drivers/md/dm-verity-verify-sig.h | 14 +++++++-------

OK, thanks.

>  drivers/md/md.c                   | 12 ++++++------
>  drivers/md/raid10.c               |  4 ++--
>  drivers/md/raid5-cache.c          |  4 +---
>  drivers/md/raid5.c                | 12 ++++++------

But these need to be routed through the MD.

Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

