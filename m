Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id A7FF132B606
	for <lists+dm-devel@lfdr.de>; Wed,  3 Mar 2021 09:48:02 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-163-N3UmKbhLMgC1IL54IvkdcQ-1; Wed, 03 Mar 2021 03:47:49 -0500
X-MC-Unique: N3UmKbhLMgC1IL54IvkdcQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 30A2185B660;
	Wed,  3 Mar 2021 08:47:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 01CAB10013C1;
	Wed,  3 Mar 2021 08:47:41 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 822224A7C6;
	Wed,  3 Mar 2021 08:47:29 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1232rc39004228 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 2 Mar 2021 21:53:39 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id D0FD810D16CD; Wed,  3 Mar 2021 02:53:38 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CC697112D42A
	for <dm-devel@redhat.com>; Wed,  3 Mar 2021 02:53:36 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 64959858F0E
	for <dm-devel@redhat.com>; Wed,  3 Mar 2021 02:53:36 +0000 (UTC)
Received: from out30-131.freemail.mail.aliyun.com
	(out30-131.freemail.mail.aliyun.com [115.124.30.131]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-225-iNJ919QHP9Ke5kjzukfQWg-1;
	Tue, 02 Mar 2021 21:53:31 -0500
X-MC-Unique: iNJ919QHP9Ke5kjzukfQWg-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R591e4; CH=green; DM=||false|;
	DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04395;
	MF=jefflexu@linux.alibaba.com; NM=1; PH=DS; RN=10; SR=0;
	TI=SMTPD_---0UQAbNuR_1614740007
Received: from admindeMacBook-Pro-2.local(mailfrom:jefflexu@linux.alibaba.com
	fp:SMTPD_---0UQAbNuR_1614740007) by smtp.aliyun-inc.com(127.0.0.1);
	Wed, 03 Mar 2021 10:53:27 +0800
To: Mikulas Patocka <mpatocka@redhat.com>, Mike Snitzer <msnitzer@redhat.com>,
	Heinz Mauelshagen <heinzm@redhat.com>, axboe@kernel.dk,
	caspar@linux.alibaba.com, io-uring@vger.kernel.org,
	linux-block@vger.kernel.org, joseph.qi@linux.alibaba.com,
	dm-devel@redhat.com, hch@lst.de
References: <20210302190555.201228400@debian-a64.vm>
From: JeffleXu <jefflexu@linux.alibaba.com>
Message-ID: <33fa121a-88a8-5c27-0a43-a7efc9b5b3e3@linux.alibaba.com>
Date: Wed, 3 Mar 2021 10:53:27 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
	Gecko/20100101 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210302190555.201228400@debian-a64.vm>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Wed, 03 Mar 2021 03:47:16 -0500
Subject: Re: [dm-devel] [PATCH 4/4] dm: support I/O polling
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
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On 3/3/21 3:05 AM, Mikulas Patocka wrote:

> Support I/O polling if submit_bio_noacct_mq_direct returned non-empty
> cookie.
> 
> Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
> 
> ---
>  drivers/md/dm.c |    5 +++++
>  1 file changed, 5 insertions(+)
> 
> Index: linux-2.6/drivers/md/dm.c
> ===================================================================
> --- linux-2.6.orig/drivers/md/dm.c	2021-03-02 19:26:34.000000000 +0100
> +++ linux-2.6/drivers/md/dm.c	2021-03-02 19:26:34.000000000 +0100
> @@ -1682,6 +1682,11 @@ static void __split_and_process_bio(stru
>  		}
>  	}
>  
> +	if (ci.poll_cookie != BLK_QC_T_NONE) {
> +		while (atomic_read(&ci.io->io_count) > 1 &&
> +		       blk_poll(ci.poll_queue, ci.poll_cookie, true)) ;
> +	}
> +
>  	/* drop the extra reference count */
>  	dec_pending(ci.io, errno_to_blk_status(error));
>  }

It seems that the general idea of your design is to
1) submit *one* split bio
2) blk_poll(), waiting the previously submitted split bio complets

and then submit next split bio, repeating the above process. I'm afraid
the performance may be an issue here, since the batch every time
blk_poll() reaps may decrease.


Besides, the submitting routine and polling routine is bound together
here, i.e., polling is always synchronous.

-- 
Thanks,
Jeffle

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

