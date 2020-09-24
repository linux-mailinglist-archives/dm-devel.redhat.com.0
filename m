Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 8CCE8277775
	for <lists+dm-devel@lfdr.de>; Thu, 24 Sep 2020 19:07:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1600967261;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=g7ShnVPtOypSeKrumEtV83Wevf6JgL0ABMxydsWRl/8=;
	b=DDILJAUBnhY+9lG0K/awSCvjjDryYngcHFjy6zTjIQEkQIf75TUVA0rg4IE8NHvEg+azNm
	mzUmsCpCBKTeSVxF0Jj0eEG4G+XS2K6pZzkWya58DZSIUL4AobtmTbLAo+Td2qPTvw8tvj
	YE1oiXcacea/wuFOH7NBqIgfulNxTUE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-459-TjZkI5kANKCSTIjGMNI2-A-1; Thu, 24 Sep 2020 13:07:39 -0400
X-MC-Unique: TjZkI5kANKCSTIjGMNI2-A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 89931AD697;
	Thu, 24 Sep 2020 17:07:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 953CC55786;
	Thu, 24 Sep 2020 17:07:31 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AE8691826D2A;
	Thu, 24 Sep 2020 17:07:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08OH7IMo021419 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 24 Sep 2020 13:07:19 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id EFC3B19D7C; Thu, 24 Sep 2020 17:07:18 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EB32E19C66;
	Thu, 24 Sep 2020 17:07:13 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id 08OH7Ch6001530; Thu, 24 Sep 2020 13:07:12 -0400
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id 08OH7C8U001526; Thu, 24 Sep 2020 13:07:12 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Thu, 24 Sep 2020 13:07:12 -0400 (EDT)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Mike Snitzer <snitzer@redhat.com>
In-Reply-To: <20200924165616.GA14650@redhat.com>
Message-ID: <alpine.LRH.2.02.2009241306170.28814@file01.intranet.prod.int.rdu2.redhat.com>
References: <alpine.LRH.2.02.2009241225310.22728@file01.intranet.prod.int.rdu2.redhat.com>
	<20200924165616.GA14650@redhat.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Zdenek Kabelac <zkabelac@redhat.com>
Subject: Re: [dm-devel] dm-raid: stack limits instead of overwriting them.
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On Thu, 24 Sep 2020, Mike Snitzer wrote:

> WAIT... Could it be that raid_io_hints _really_ meant to special case
> raid0 and raid10 -- due to their striping/splitting requirements!?
> So, not raid1 but raid0?
> 
> E.g.:
> 
> diff --git a/drivers/md/dm-raid.c b/drivers/md/dm-raid.c
> index 56b723d012ac..6dca932d6f1d 100644
> --- a/drivers/md/dm-raid.c
> +++ b/drivers/md/dm-raid.c
> @@ -3730,10 +3730,10 @@ static void raid_io_hints(struct dm_target *ti,
> struct queue_limits *limits)
>         blk_limits_io_opt(limits, chunk_size_bytes *
> 	mddev_data_stripes(rs));
> 
>         /*
> -        * RAID1 and RAID10 personalities require bio splitting,
> -        * RAID0/4/5/6 don't and process large discard bios properly.
> +        * RAID0 and RAID10 personalities require bio splitting,
> +        * RAID1/4/5/6 don't and process large discard bios properly.
>          */
> -       if (rs_is_raid1(rs) || rs_is_raid10(rs)) {
> +       if (rs_is_raid0(rs) || rs_is_raid10(rs)) {
>                 limits->discard_granularity = chunk_size_bytes;
>                 limits->max_discard_sectors = rs->md.chunk_sectors;
>         }
> 
> Mike

Yes - that's an interesing point.

Mikulas

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

