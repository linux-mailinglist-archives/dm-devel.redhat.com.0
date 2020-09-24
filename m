Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 5144327771B
	for <lists+dm-devel@lfdr.de>; Thu, 24 Sep 2020 18:46:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1600965985;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=/3yeH5SlN2KUeXvEp1a0RYDxu9zrCUxXnIR3KMbuTGs=;
	b=dOYx046tqLgrUXt2IKQUyhtE/QWZWm0lhD0JNw+yIM8MUZdaseLLw+koMH7bOZ8i7pjy/v
	p3X7tMBsOnc3lmEqjhWDlz1a1EWCnbO1iV5HJ5lFmL7IrnL2Ehgn91OqS21L2Q9zXuIPEA
	spYA74Pk+xqwmS/Cx4BKtcJdtH7lPlw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-481-MDVD3v02M-OG_Vbto3bJRA-1; Thu, 24 Sep 2020 12:46:21 -0400
X-MC-Unique: MDVD3v02M-OG_Vbto3bJRA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AFA4C1022E1B;
	Thu, 24 Sep 2020 16:46:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B25577368C;
	Thu, 24 Sep 2020 16:46:11 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5D06B8C7A2;
	Thu, 24 Sep 2020 16:46:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08OGjxx8019081 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 24 Sep 2020 12:45:59 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id F373510A143B; Thu, 24 Sep 2020 16:45:58 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EEE8110A1437
	for <dm-devel@redhat.com>; Thu, 24 Sep 2020 16:45:56 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B225D858294
	for <dm-devel@redhat.com>; Thu, 24 Sep 2020 16:45:56 +0000 (UTC)
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com
	[209.85.217.72]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-595-4btEP8UAPDGyD84ZU4ZxPw-1; Thu, 24 Sep 2020 12:45:55 -0400
X-MC-Unique: 4btEP8UAPDGyD84ZU4ZxPw-1
Received: by mail-vs1-f72.google.com with SMTP id s68so2667vss.3
	for <dm-devel@redhat.com>; Thu, 24 Sep 2020 09:45:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=z2ZxJLEzKDTd/kNj2NTHKUnqtet7FBJnNzDhitOCcP8=;
	b=QZ4PkTMGF77nZ2Rm0ygKsE4ly8S5/LBauSADRsZzmOcQXeR/mC5FZMrtLD4nsAANVQ
	1iMGMHLVvRg6/rUrNH/bmux0WARGb/98AOGvlMivDJ1rg6s8grePwBpRV0glHlCgUqLV
	q5a4ywieqMYX0/NbFJGOYeEHclTh+p6Gt7i/Z8VaDYwHr1fEij+hs2TdsiZAtLOpX37a
	SmhAUtcbl4XbeZ0YltrOdVlURdYIaq0icdz8y8/o5VTbf9Xyu8QkWDFzey6fH2AnBNr/
	QVzFwYxdRV0wNbnBkuOYsJfwUxgbZLnj/iyzvGA5eNGRhFZx5PiCiRb2ef3VL4kRFK+0
	eVdA==
X-Gm-Message-State: AOAM530b+4AqbGDt9xJILKXCD3hq8NKwLY9HlHjyzksJ7Zhbe8ZoUK7Y
	mJLq9fNTa0TUWsuVRhxXzmieE6xxytyx4DKIfR6n/tDPApiYouYoir50ymlgRoFVFmh3lDP55ou
	Tde1vMulpBxvmHgdiPn6lOByeyxHfhI8=
X-Received: by 2002:a67:f698:: with SMTP id n24mr5051774vso.19.1600965954216; 
	Thu, 24 Sep 2020 09:45:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy4AoEE5PjUS1kJ8HHH02GC91LHJdmqhb5fJmnqK7Nv+H1t/olHqAmfhI/Kitwi0skVD3F/8No8oZf01FZtqUA=
X-Received: by 2002:a67:f698:: with SMTP id n24mr5051748vso.19.1600965953944; 
	Thu, 24 Sep 2020 09:45:53 -0700 (PDT)
MIME-Version: 1.0
References: <alpine.LRH.2.02.2009241225310.22728@file01.intranet.prod.int.rdu2.redhat.com>
In-Reply-To: <alpine.LRH.2.02.2009241225310.22728@file01.intranet.prod.int.rdu2.redhat.com>
From: John Dorminy <jdorminy@redhat.com>
Date: Thu, 24 Sep 2020 12:45:43 -0400
Message-ID: <CAMeeMh87GLea=7_4qGuPhMj0WKnB-596HzkKQDafLirHiBpSzQ@mail.gmail.com>
To: Mikulas Patocka <mpatocka@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
Cc: Mike Snitzer <msnitzer@redhat.com>,
	device-mapper development <dm-devel@redhat.com>,
	Zdenek Kabelac <zkabelac@redhat.com>
Subject: Re: [dm-devel] [PATCH] dm-raid: stack limits instead of overwriting
	them.
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

I don't understand how this works...

Can chunk_size_bytes be 0? If not, how is discard_granularity being set to 0?

I think also limits is local to the ti in question here, initialized
by blk_set_stacking_limits() via dm-table.c, and therefore has only
default values and not anything to do with the underlying queue. So
setting discard_granularity=max(discard_granularity, chunk_size_bytes)
doesn't seem like it should be working, unless I'm not understanding
what it's there for...

And shouldn't melding in the target's desired io_hints into the
existing queue limits be happening in blk_stack_limits() instead?
(Also, it does lcm_not_zero() for stacking granularity, instead of
max()...)


On Thu, Sep 24, 2020 at 12:29 PM Mikulas Patocka <mpatocka@redhat.com> wrote:
>
> This patch fixes a warning WARN_ON_ONCE(!q->limits.discard_granularity).
> The reason is that the function raid_io_hints overwrote
> limits->discard_granularity with zero. We need to properly stack the
> limits instead of overwriting them.
>
> Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
> Cc: stable@vger.kernel.org
>
> ---
>  drivers/md/dm-raid.c |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> Index: linux-2.6/drivers/md/dm-raid.c
> ===================================================================
> --- linux-2.6.orig/drivers/md/dm-raid.c 2020-09-24 18:16:45.000000000 +0200
> +++ linux-2.6/drivers/md/dm-raid.c      2020-09-24 18:16:45.000000000 +0200
> @@ -3734,8 +3734,8 @@ static void raid_io_hints(struct dm_targ
>          * RAID0/4/5/6 don't and process large discard bios properly.
>          */
>         if (rs_is_raid1(rs) || rs_is_raid10(rs)) {
> -               limits->discard_granularity = chunk_size_bytes;
> -               limits->max_discard_sectors = rs->md.chunk_sectors;
> +               limits->discard_granularity = max(limits->discard_granularity, chunk_size_bytes);
> +               limits->max_discard_sectors = min_not_zero(limits->max_discard_sectors, (unsigned)rs->md.chunk_sectors);
>         }
>  }
>
>
> --
> dm-devel mailing list
> dm-devel@redhat.com
> https://www.redhat.com/mailman/listinfo/dm-devel
>

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

