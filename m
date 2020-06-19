Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id E0FD1201204
	for <lists+dm-devel@lfdr.de>; Fri, 19 Jun 2020 17:51:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592581893;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=gtYTYOyKKkU4hSc35idTXXY7FavYiNLtjEVoPvS5kYc=;
	b=elZeE8J9upwfDXhWypjWoFin00JvdpWDgnzM4n5x3aqVSikr7L+R857TFrzsQpDOdevuEt
	dIX55Oe9loBcylXz9xVjvzNdpYgoCeAFyHALydI0XC4g16HGOOQ1wvQVFDeHyT3/pxa7Gg
	hW1l1mVWtP2v1OuSuM2UXCQM+GMMR/k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-105-hXSGAfoYOXWly4TEzxj8VA-1; Fri, 19 Jun 2020 11:51:31 -0400
X-MC-Unique: hXSGAfoYOXWly4TEzxj8VA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 765B51083E80;
	Fri, 19 Jun 2020 15:51:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C07127C1E8;
	Fri, 19 Jun 2020 15:51:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A9EBF1809547;
	Fri, 19 Jun 2020 15:51:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05JFp757022223 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 19 Jun 2020 11:51:07 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9D58B1054FD4; Fri, 19 Jun 2020 15:51:07 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 976CC1054FD0
	for <dm-devel@redhat.com>; Fri, 19 Jun 2020 15:51:05 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 32BCB108C273
	for <dm-devel@redhat.com>; Fri, 19 Jun 2020 15:51:05 +0000 (UTC)
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
	[209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-220-gm-uTQwxMfC2QTdqUeZphw-1; Fri, 19 Jun 2020 11:51:03 -0400
X-MC-Unique: gm-uTQwxMfC2QTdqUeZphw-1
Received: by mail-wm1-f72.google.com with SMTP id p24so2750176wma.4
	for <dm-devel@redhat.com>; Fri, 19 Jun 2020 08:51:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=zwTLKkjhAZy3n84vtSfkqQSkKI6xH37wvgAy5smGnFE=;
	b=qAMy2EJFFWFn7jpthlnpLuYq9v4f5OcBHbuPvhsQmY0dI1PTCxyp8PqKIOqq2qZjK+
	GOmVnBm9mzQg1KNGe2B+JSoKKvlNeM4HTWRb6aVUYXO4RVpuF9OhgByn6jIvJmcrgU8h
	5synAS3KEH1FV+S1uFLP4/nO+GEyhBXwGgyMikcuZBJWXJ9Gow7NCgN7eZwqRPpztwtR
	tg4Qjfz8F+EEJC9mqqzJfsGcmkITaGLLyj0jytQgrTOpscxk6H929XmjOSAq2hngRdDw
	STyAJsufdzH/ULOuLgUEhdwjGhxFN+NCOeL2zv6wZGQ9czVLAYRHaL9gsZYf5FCM5YyV
	Edvg==
X-Gm-Message-State: AOAM533ihdCekarSp/BHVvjwMqcHNmLBxkHjYwjQK3B8wa7P9tm0jl80
	2dQ391rHFYkkawfVxFWhi00daHYNeVmncp4jwV1TpdhQ/hrbKOJ5XedudbPfNH8AMwQJXXlD0pm
	czXrLI8tDwBWAP1LkDs0hOCF0Ve8tk1g=
X-Received: by 2002:adf:f812:: with SMTP id s18mr4575930wrp.28.1592581862326; 
	Fri, 19 Jun 2020 08:51:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx1VQCE9+zfn6xUBkOnd/NDk15fMUAylyWh3iEbHeftTAbWX4V3V716e0u8mm0N8lAyVfnhLFwZ2ONo1B4YCBg=
X-Received: by 2002:adf:f812:: with SMTP id s18mr4575907wrp.28.1592581862036; 
	Fri, 19 Jun 2020 08:51:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200619123803.1441373-1-yangerkun@huawei.com>
	<20200619123803.1441373-3-yangerkun@huawei.com>
In-Reply-To: <20200619123803.1441373-3-yangerkun@huawei.com>
From: Bryan Gurney <bgurney@redhat.com>
Date: Fri, 19 Jun 2020 11:50:51 -0400
Message-ID: <CAHhmqcThF3TCaNUAu3rSHJFfkMARweZuChtbRmdsfNVE0DfBeA@mail.gmail.com>
To: yangerkun <yangerkun@huawei.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
Cc: bmr@redhat.com, dm-devel@redhat.com, "Alasdair G. Kergon" <agk@redhat.com>,
	Mike Snitzer <snitzer@redhat.com>
Subject: Re: [dm-devel] [PATCH v3 2/4] dm dust: update doc after message
 results report to user directly
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

On Fri, Jun 19, 2020 at 8:37 AM yangerkun <yangerkun@huawei.com> wrote:
>
> Since some type of message will report the results to user directly,
> we should update the doc too.
>
> Signed-off-by: yangerkun <yangerkun@huawei.com>
> ---
>  .../admin-guide/device-mapper/dm-dust.rst         | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)
>
> diff --git a/Documentation/admin-guide/device-mapper/dm-dust.rst b/Documentation/admin-guide/device-mapper/dm-dust.rst
> index b6e7e7ead831..84149c08b68f 100644
> --- a/Documentation/admin-guide/device-mapper/dm-dust.rst
> +++ b/Documentation/admin-guide/device-mapper/dm-dust.rst
> @@ -69,10 +69,11 @@ Create the dm-dust device:
>          $ sudo dmsetup create dust1 --table '0 33552384 dust /dev/vdb1 0 4096'
>
>  Check the status of the read behavior ("bypass" indicates that all I/O
> -will be passed through to the underlying device)::
> +will be passed through to the underlying device, "verbose" indicates that
> +we will log everythings like bad blocks added, removed, or "remapped")::

Thanks for the addition here, and the revision of the "dmsetup status"
output example below.  Here's a quick grammatical fix:

'..."verbose" indicates that bad block additions, removals, and remaps
will be verbosely logged'

After that change,

Reviewed-by: Bryan Gurney <bgurney@redhat.com>


Thanks,

Bryan

>
>          $ sudo dmsetup status dust1
> -        0 33552384 dust 252:17 bypass
> +        0 33552384 dust 252:17 bypass verbose
>
>          $ sudo dd if=/dev/mapper/dust1 of=/dev/null bs=512 count=128 iflag=direct
>          128+0 records in
> @@ -164,7 +165,7 @@ following message command::
>  A message will print with the number of bad blocks currently
>  configured on the device::
>
> -        kernel: device-mapper: dust: countbadblocks: 895 badblock(s) found
> +        countbadblocks: 895 badblock(s) found
>
>  Querying for specific bad blocks
>  --------------------------------
> @@ -176,11 +177,11 @@ following message command::
>
>  The following message will print if the block is in the list::
>
> -        device-mapper: dust: queryblock: block 72 found in badblocklist
> +        block 72 found in badblocklist
>
>  The following message will print if the block is not in the list::
>
> -        device-mapper: dust: queryblock: block 72 not found in badblocklist
> +        block 72 not found in badblocklist
>
>  The "queryblock" message command will work in both the "enabled"
>  and "disabled" modes, allowing the verification of whether a block
> @@ -198,12 +199,12 @@ following message command::
>
>  After clearing the bad block list, the following message will appear::
>
> -        kernel: device-mapper: dust: clearbadblocks: badblocks cleared
> +        badblocks cleared
>
>  If there were no bad blocks to clear, the following message will
>  appear::
>
> -        kernel: device-mapper: dust: clearbadblocks: no badblocks found
> +        no badblocks found
>
>  Message commands list
>  ---------------------
> --
> 2.25.4
>

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

