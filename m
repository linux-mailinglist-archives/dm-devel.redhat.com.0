Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 11F2511360F
	for <lists+dm-devel@lfdr.de>; Wed,  4 Dec 2019 20:59:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1575489580;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=syyqvICdrU2ExXz5pm3vLVRiUHJAP2/y6U2ek+x432s=;
	b=itqzCB0N1axog/5+KD2JxfklAU4xg78Yd1gFSiPiWOE9bjNC6DC+rXnIWVZfNKLpXt3+bM
	yh6LyCxz+scAcaR3p87pn87e6iJD6tFBmZwQCeJcpu+deT4LN9Co8Xlg1vGhIFhOfelvDO
	aHlupfYytFZdA7co4jDYQk5QkGTA94E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-356-h2CemfEXNnuffCxjewQoyA-1; Wed, 04 Dec 2019 14:59:39 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 98E2918543A0;
	Wed,  4 Dec 2019 19:59:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 194F869192;
	Wed,  4 Dec 2019 19:59:27 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 690D75BC10;
	Wed,  4 Dec 2019 19:59:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xB4Jx4YI025872 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 4 Dec 2019 14:59:04 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 18D382038B96; Wed,  4 Dec 2019 19:59:04 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 13FC82026D67
	for <dm-devel@redhat.com>; Wed,  4 Dec 2019 19:59:02 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EC32410131C2
	for <dm-devel@redhat.com>; Wed,  4 Dec 2019 19:59:01 +0000 (UTC)
Received: from mx.ewheeler.net (mx.ewheeler.net [173.205.220.69]) by
	relay.mimecast.com with ESMTP id us-mta-364-yCWQ4hCYO_SqFGAEEx8Wsw-1;
	Wed, 04 Dec 2019 14:59:00 -0500
Received: from localhost (localhost [127.0.0.1])
	by mx.ewheeler.net (Postfix) with ESMTP id DFB97A0633;
	Wed,  4 Dec 2019 19:58:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at ewheeler.net
Received: from mx.ewheeler.net ([127.0.0.1])
	by localhost (mx.ewheeler.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id ix_fZxS3WshJ; Wed,  4 Dec 2019 19:58:22 +0000 (UTC)
Received: from mx.ewheeler.net (mx.ewheeler.net [173.205.220.69])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx.ewheeler.net (Postfix) with ESMTPSA id 5C124A0440;
	Wed,  4 Dec 2019 19:58:22 +0000 (UTC)
Date: Wed, 4 Dec 2019 19:58:21 +0000 (UTC)
From: Eric Wheeler <dm-devel@lists.ewheeler.net>
X-X-Sender: lists@mx.ewheeler.net
To: Nikos Tsironis <ntsironis@arrikto.com>
In-Reply-To: <20191204140742.26273-1-ntsironis@arrikto.com>
Message-ID: <alpine.LRH.2.11.1912041907490.11561@mx.ewheeler.net>
References: <20191204140742.26273-1-ntsironis@arrikto.com>
User-Agent: Alpine 2.11 (LRH 23 2013-08-11)
MIME-Version: 1.0
X-MC-Unique: yCWQ4hCYO_SqFGAEEx8Wsw-1
X-MC-Unique: h2CemfEXNnuffCxjewQoyA-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xB4Jx4YI025872
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, thornber@redhat.com, agk@redhat.com,
	snitzer@redhat.com
Subject: Re: [dm-devel] [PATCH 0/2] dm thin: Flush data device before
 committing metadata to avoid data corruption
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, 4 Dec 2019, Nikos Tsironis wrote:

> The thin provisioning target maintains per thin device mappings that map
> virtual blocks to data blocks in the data device.
> 
> When we write to a shared block, in case of internal snapshots, or
> provision a new block, in case of external snapshots, we copy the shared
> block to a new data block (COW), update the mapping for the relevant
> virtual block and then issue the write to the new data block.
> 
> Suppose the data device has a volatile write-back cache and the
> following sequence of events occur:

For those with NV caches, can the data disk flush be optional (maybe as a 
table flag)?

--
Eric Wheeler



> 
> 1. We write to a shared block
> 2. A new data block is allocated
> 3. We copy the shared block to the new data block using kcopyd (COW)
> 4. We insert the new mapping for the virtual block in the btree for that
>    thin device.
> 5. The commit timeout expires and we commit the metadata, that now
>    includes the new mapping from step (4).
> 6. The system crashes and the data device's cache has not been flushed,
>    meaning that the COWed data are lost.
> 
> The next time we read that virtual block of the thin device we read it
> from the data block allocated in step (2), since the metadata have been
> successfully committed. The data are lost due to the crash, so we read
> garbage instead of the old, shared data.
> 
> Moreover, apart from internal and external snapshots, the same issue
> exists for newly provisioned blocks, when block zeroing is enabled.
> After the system recovers the provisioned blocks might contain garbage
> instead of zeroes.
> 
> For more information regarding the implications of this please see the
> relevant commit.
> 
> To solve this and avoid the potential data corruption we have to flush
> the pool's data device before committing its metadata.
> 
> This ensures that the data blocks of any newly inserted mappings are
> properly written to non-volatile storage and won't be lost in case of a
> crash.
> 
> Nikos Tsironis (2):
>   dm thin metadata: Add support for a pre-commit callback
>   dm thin: Flush data device before committing metadata
> 
>  drivers/md/dm-thin-metadata.c | 29 +++++++++++++++++++++++++++++
>  drivers/md/dm-thin-metadata.h |  7 +++++++
>  drivers/md/dm-thin.c          | 32 ++++++++++++++++++++++++++++++++
>  3 files changed, 68 insertions(+)
> 
> -- 
> 2.11.0
> 
> 
> --
> dm-devel mailing list
> dm-devel@redhat.com
> https://www.redhat.com/mailman/listinfo/dm-devel
> 
> 


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

