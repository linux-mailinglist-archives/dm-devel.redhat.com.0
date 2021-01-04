Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 544B42E9BA9
	for <lists+dm-devel@lfdr.de>; Mon,  4 Jan 2021 18:05:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1609779943;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=UQmIp4wtKb3G/RTXnZGalBruVCSY81JcrIN/nQvvChs=;
	b=d+ATRaeGanPrIMmWUkLFJKDGqKeXMLkoPz/MTQpu5uM8YVXziiWjOkezdp7OOd5nVMk1xY
	HB0mzAObYsgf9kFh5wNHx5lyfwkHXf16D+SdYCHf8mhqJhdCetjn+dI8bufCzsj2n+Qf/m
	kc615lUzDEXMvRuwGIc/YST+tNcJhA4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-380-IBRYWLB5OpC0U_wQUk3olw-1; Mon, 04 Jan 2021 12:05:41 -0500
X-MC-Unique: IBRYWLB5OpC0U_wQUk3olw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BC7ADAFA80;
	Mon,  4 Jan 2021 17:05:30 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C3495614F5;
	Mon,  4 Jan 2021 17:05:26 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CA276180954D;
	Mon,  4 Jan 2021 17:05:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 104H59Yt011949 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 4 Jan 2021 12:05:09 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 29BBA5D756; Mon,  4 Jan 2021 17:05:09 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6A3595D751;
	Mon,  4 Jan 2021 17:05:02 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id 104H51GA002921; Mon, 4 Jan 2021 12:05:01 -0500
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id 104H4xUR002896; Mon, 4 Jan 2021 12:04:59 -0500
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Mon, 4 Jan 2021 12:04:59 -0500 (EST)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Ignat Korchagin <ignat@cloudflare.com>
In-Reply-To: <20210104145948.1857-1-ignat@cloudflare.com>
Message-ID: <alpine.LRH.2.02.2101041204010.2157@file01.intranet.prod.int.rdu2.redhat.com>
References: <20210104145948.1857-1-ignat@cloudflare.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: Damien.LeMoal@wdc.com, herbert@gondor.apana.org.au, snitzer@redhat.com,
	kernel-team@cloudflare.com, dm-crypt@saout.de,
	linux-kernel@vger.kernel.org, nobuto.murata@canonical.com,
	ebiggers@kernel.org, clm@fb.com, dm-devel@redhat.com,
	linux-btrfs@vger.kernel.org, dsterba@suse.com,
	josef@toxicpanda.com, mail@maciej.szmigiero.name, agk@redhat.com
Subject: Re: [dm-devel] [PATCH v3 0/2] dm crypt: some fixes to support
 dm-crypt running in softirq context
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



On Mon, 4 Jan 2021, Ignat Korchagin wrote:

> Changes from v1:
>   * 0001: handle memory allocation failure for GFP_ATOMIC
> 
> Changes from v2:
>   * reordered patches
>   * 0002: crypt_convert will be retried from a workqueue, when a crypto request
>     allocation fails with GFP_ATOMIC instead of just returning an IO error to
>     the user
> 
> Ignat Korchagin (2):
>   dm crypt: do not wait for backlogged crypto request completion in
>     softirq
>   dm crypt: use GFP_ATOMIC when allocating crypto requests from softirq
> 
>  drivers/md/dm-crypt.c | 138 +++++++++++++++++++++++++++++++++++++-----
>  1 file changed, 123 insertions(+), 15 deletions(-)
> 
> -- 
> 2.20.1
> 

Acked-by: Mikulas Patocka <mpatocka@redhat.com>

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

