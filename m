Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 74AF04CE1F4
	for <lists+dm-devel@lfdr.de>; Sat,  5 Mar 2022 02:43:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1646444634;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=0H+Xp13Oer+/cM+JF5k8K5fbWU1IJlVlasgStbti+u8=;
	b=BDBUOQPTZtxI8Lw9H4KtJTFyKpJizzh9VthhsidHf9D9va+xLemHBEXbefQr07pCwd9jeW
	XZQTQ3eXSe7d+Xke6JO9LJghaPFbcYG2R1q9nnDM71461lOqL71ijtBARTOBm4bW7sqllN
	MaHu/FxU2DiOS5NES+vt+6qq1QDbk0A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-192-SNzynjQOOSu8ACTQxefcLw-1; Fri, 04 Mar 2022 20:43:50 -0500
X-MC-Unique: SNzynjQOOSu8ACTQxefcLw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D7F911006AA5;
	Sat,  5 Mar 2022 01:43:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D040C1078650;
	Sat,  5 Mar 2022 01:43:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B6E9E4ED66;
	Sat,  5 Mar 2022 01:43:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 2251hTtM027118 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 4 Mar 2022 20:43:29 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 765414BC45; Sat,  5 Mar 2022 01:43:29 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from T590 (ovpn-8-17.pek2.redhat.com [10.72.8.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 88D524BC7A;
	Sat,  5 Mar 2022 01:43:05 +0000 (UTC)
Date: Sat, 5 Mar 2022 09:43:00 +0800
From: Ming Lei <ming.lei@redhat.com>
To: Mike Snitzer <snitzer@redhat.com>
Message-ID: <YiLAJIOZz9UHbUKq@T590>
References: <20220304212623.34016-1-snitzer@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220304212623.34016-1-snitzer@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: axboe@kernel.dk, linux-block@vger.kernel.org, dm-devel@redhat.com,
	hch@lst.de
Subject: Re: [dm-devel] [PATCH v4 0/2] block/dm: support bio polling
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Mar 04, 2022 at 04:26:21PM -0500, Mike Snitzer wrote:
> Hi,
> 
> I've rebased Ming's latest [1] ontop of dm-5.18 [2] (which is based on
> for-5.18/block). End result available in dm-5.18-biopoll branch [3]
> 
> These changes add bio polling support to DM.  Tested with linear and
> striped DM targets.
> 
> IOPS improvement was ~5% on my baremetal system with a single Intel
> Optane NVMe device (555K hipri=1 vs 525K hipri=0).
> 
> Ming has seen better improvement while testing within a VM:
>  dm-linear: hipri=1 vs hipri=0 15~20% iops improvement
>  dm-stripe: hipri=1 vs hipri=0 ~30% iops improvement
> 
> I'd like to merge these changes via the DM tree when the 5.18 merge
> window opens.  The first block patch that adds ->poll_bio to
> block_device_operations will need review so that I can take it
> through the DM tree.  Reason for going through the DM tree is there
> have been some fairly extensive changes queued in dm-5.18 that build
> on for-5.18/block.  So I think it easiest to just add the block
> depenency via DM tree since DM is first consumer of ->poll_bio
> 
> FYI, Ming does have another DM patch [4] that looks to avoid using
> hlist but I only just saw it.  bio_split() _is_ involved (see
> dm_split_and_process_bio) so I'm not exactly sure where he is going
> with that change. 

io_uring(polling) workloads often cares latency, so big IO request
isn't involved usually, I guess. Then bio_split() is seldom called in
dm_split_and_process_bio(), such as if 4k random IO is run on dm-linear
or dm-stripe via io_uring, bio_split() won't be run into.

Single list is enough here, and efficient than hlist, just need
a little care to delete element from the list since linux kernel doesn't
have generic single list implementation.

> But that is DM-implementation detail that we'll
> sort out.

Yeah, that patch also needs more test.


Thanks, 
Ming

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

