Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C0D256C5737
	for <lists+dm-devel@lfdr.de>; Wed, 22 Mar 2023 21:15:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679516138;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ScuU68/lGpFG99vRbSCih4ioreODerkcYDeRvnc8REI=;
	b=UvueAKYpy+vt6Hc8Jh0ez2Cx1uYCrWI5mGMWQozoIMT/RxaVHYxswH9uaEflfpjGfxWu1t
	lParZak1CZy47R91bgGQlD9uiMKVXdK/9jDxEDALv81wK759qVO4WrFUEHlu78tHVaQe0d
	6xy6zbw56MI9glWMHSvz6DIbjLxu2Lo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-65-VTgKndl5MRiu-lx6pCMkYw-1; Wed, 22 Mar 2023 16:15:34 -0400
X-MC-Unique: VTgKndl5MRiu-lx6pCMkYw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 628D3858F09;
	Wed, 22 Mar 2023 20:15:31 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 390FB2166B29;
	Wed, 22 Mar 2023 20:15:26 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 7F1E919465BD;
	Wed, 22 Mar 2023 20:15:10 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id BF0771946586
 for <dm-devel@listman.corp.redhat.com>; Wed, 22 Mar 2023 20:15:08 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 817B240B934; Wed, 22 Mar 2023 20:15:08 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
 (file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6F00E483EC4;
 Wed, 22 Mar 2023 20:15:08 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
 by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP id
 32MKF8i3020000; Wed, 22 Mar 2023 16:15:08 -0400
Received: from localhost (mpatocka@localhost)
 by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with ESMTP
 id 32MKF829019996; Wed, 22 Mar 2023 16:15:08 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
 owned process doing -bs
Date: Wed, 22 Mar 2023 16:15:08 -0400 (EDT)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: "Jiazi.Li" <jqqlijiazi@gmail.com>
In-Reply-To: <20230310100533.6290-1-jiazi.li@transsion.com>
Message-ID: <alpine.LRH.2.21.2303221602270.19430@file01.intranet.prod.int.rdu2.redhat.com>
References: <20230310100533.6290-1-jiazi.li@transsion.com>
User-Agent: Alpine 2.21 (LRH 202 2017-01-01)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Subject: Re: [dm-devel] [PATCH] dm: call remove_single_exception_chunk
 before commit_merge
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/dm-devel/>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=subscribe>
Cc: "Jiazi.Li" <jiazi.li@transsion.com>, dm-devel@redhat.com,
 Mike Snitzer <snitzer@kernel.org>, Alasdair Kergon <agk@redhat.com>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi

I don't feel strong need to fix it.

You claim that if you corrupt the snapshot metadata, there is a small race 
condition where the corruption may not be reported to the user.

If you corrupt the snapshot metadata, you obviously get corrupted result 
of the merge. "garbage in - garbage out". I don't think that we need to 
improve handling of corrupted metadata.

I wrote this code 13 years ago, then I forgot the details about it, and I 
don't feel confident touching it unless there is some strong reason.

Mikulas



On Fri, 10 Mar 2023, Jiazi.Li wrote:

> Assume that the metadata of cow on the disk is corrupted after init
> for some reason:
> old chunk-id	new chunk-id
> 0               2
> ...
> x ---> 0        y
> After starting merge, old chunk 0 will be updated twice, and old
> chunk x will not be updated.
> And dm-snap will print err log after merge new chunk 2 to old chunk 0:
> 
> <3>[  731.921642]  (1)[4092:kworker/1:0]device-mapper: snapshots:
> Corruption detected: exception for block 0 is on disk but not in memory
> then set snap->merge_failed to true.
> 
> If userspace use "sectors_allocated == metadata_sectors" to determine
> whether the merge is completed, there maybe the following race that
> makes the userspace unable to know merge fail event:
> 
> kernel merge kworker                 userspace process
> merge_callback
>   ->commit_merge
>                                      get snapshot_status by ioctl
>   ->remove_single_exception_chunk
>   set merge_failed to true
>                                      think merge has been completed,
> 				     switch device to another target
> 
> Could we call remove_single_exception_chunk first to solve this race?
> 
> Signed-off-by: Jiazi.Li <jiazi.li@transsion.com>
> ---
>  drivers/md/dm-snap.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/md/dm-snap.c b/drivers/md/dm-snap.c
> index f766c21408f1..f658d05752f2 100644
> --- a/drivers/md/dm-snap.c
> +++ b/drivers/md/dm-snap.c
> @@ -1141,15 +1141,15 @@ static void merge_callback(int read_err, unsigned long write_err, void *context)
>  		goto shut;
>  	}
>  
> +	if (remove_single_exception_chunk(s) < 0)
> +		goto shut;
> +
>  	if (s->store->type->commit_merge(s->store,
>  					 s->num_merging_chunks) < 0) {
>  		DMERR("Write error in exception store: shutting down merge");
>  		goto shut;
>  	}
>  
> -	if (remove_single_exception_chunk(s) < 0)
> -		goto shut;
> -
>  	snapshot_merge_next_chunks(s);
>  
>  	return;
> -- 
> 2.17.1
> 
> --
> dm-devel mailing list
> dm-devel@redhat.com
> https://listman.redhat.com/mailman/listinfo/dm-devel
> 
--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

