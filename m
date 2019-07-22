Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 1836A705BA
	for <lists+dm-devel@lfdr.de>; Mon, 22 Jul 2019 18:51:57 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 56E55368E3;
	Mon, 22 Jul 2019 16:51:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 54CBC60BE2;
	Mon, 22 Jul 2019 16:51:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2E98341F53;
	Mon, 22 Jul 2019 16:51:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6MGpcUw014967 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 22 Jul 2019 12:51:38 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D70DA19D7C; Mon, 22 Jul 2019 16:51:38 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx18.extmail.prod.ext.phx2.redhat.com
	[10.5.110.47])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4DE2619D71;
	Mon, 22 Jul 2019 16:51:32 +0000 (UTC)
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
	[209.85.210.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0010B30821A0;
	Mon, 22 Jul 2019 16:51:30 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id u14so17669302pfn.2;
	Mon, 22 Jul 2019 09:51:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=sx4jGeZD1NAFZD3tRCTmaYml1fVFOhGJ/2sRj2Sic6g=;
	b=DZU7LeMeui869QvzQo8+tA3q4y950ZcAr3bw1WHJty/Biv5e/Qi50AjPhAb4AUJ8wZ
	Rtl7KhPj6Gplx4Nr0VIjo1+1HAnTe5NyLWe8ofh4whU6PFw5Dxn3OCBrPzh8DRjxBucx
	I16fK6LyMjhfTpWd2Hhf4ByfpWJ+/6/ffcLgGxc9EDrB9sNWA3gmR+t0aQvzgKDkUsGf
	kryTv8KI3e29FX8t4MnAJdXNI4ldjafsyK2BZBFxuM94GjU7wJ3LRT/+oAFDxdOVs7dT
	oqsCkdihARZkMIw/rAr2xTaS8dnIeMSPhq0ezY9JwCrRzWg5wmzwogWh6JpXW/hMjkZy
	w9Kw==
X-Gm-Message-State: APjAAAWWXZ/juQL0cbKS7zRrtmSnHPqD3Bc4I6vnZ+WdZbF8kRSOwy1k
	MHVfhuMy95oDvPENQQ/Y3d0=
X-Google-Smtp-Source: APXvYqzgKB+ahambBQH5r+rB5Xfqr8ZuYUyKs+7UZ6PacGfkrBMgMtfp+VqBqVxhZA1PNYh9nmwRsw==
X-Received: by 2002:a17:90a:3247:: with SMTP id
	k65mr34724555pjb.49.1563814290331; 
	Mon, 22 Jul 2019 09:51:30 -0700 (PDT)
Received: from desktop-bart.svl.corp.google.com
	([2620:15c:2cd:202:4308:52a3:24b6:2c60])
	by smtp.gmail.com with ESMTPSA id
	m4sm75534750pff.108.2019.07.22.09.51.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 22 Jul 2019 09:51:29 -0700 (PDT)
To: Ming Lei <ming.lei@redhat.com>, Jens Axboe <axboe@kernel.dk>
References: <20190720030637.14447-1-ming.lei@redhat.com>
	<20190720030637.14447-2-ming.lei@redhat.com>
From: Bart Van Assche <bvanassche@acm.org>
Message-ID: <4ffe9dd8-9e86-fd93-828e-78c1e5931c5f@acm.org>
Date: Mon, 22 Jul 2019 09:51:27 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190720030637.14447-2-ming.lei@redhat.com>
Content-Language: en-US
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.47]);
	Mon, 22 Jul 2019 16:51:31 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.47]);
	Mon, 22 Jul 2019 16:51:31 +0000 (UTC) for IP:'209.85.210.196'
	DOMAIN:'mail-pf1-f196.google.com'
	HELO:'mail-pf1-f196.google.com' FROM:'bart.vanassche@gmail.com'
	RCPT:''
X-RedHat-Spam-Score: 0.253  (FREEMAIL_FORGED_FROMDOMAIN, FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3, RCVD_IN_MSPIKE_WL, SPF_HELO_NONE,
	SPF_PASS) 209.85.210.196 mail-pf1-f196.google.com 209.85.210.196
	mail-pf1-f196.google.com <bart.vanassche@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.47
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: Hannes Reinecke <hare@suse.com>,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	linux-scsi@vger.kernel.org, "James E . J . Bottomley" <jejb@linux.ibm.com>,
	"Ewan D . Milne" <emilne@redhat.com>,
	linux-block@vger.kernel.org, dm-devel@redhat.com,
	Mike Snitzer <snitzer@redhat.com>, stable@vger.kernel.org,
	Christoph Hellwig <hch@lst.de>
Subject: Re: [dm-devel] [PATCH V2 1/2] blk-mq: add callback of .cleanup_rq
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.30]); Mon, 22 Jul 2019 16:51:55 +0000 (UTC)

On 7/19/19 8:06 PM, Ming Lei wrote:
> diff --git a/block/blk-mq.c b/block/blk-mq.c
> index b038ec680e84..fc38d95c557f 100644
> --- a/block/blk-mq.c
> +++ b/block/blk-mq.c
> @@ -502,6 +502,9 @@ void blk_mq_free_request(struct request *rq)
>   	struct blk_mq_ctx *ctx = rq->mq_ctx;
>   	struct blk_mq_hw_ctx *hctx = rq->mq_hctx;
>   
> +	if (q->mq_ops->cleanup_rq)
> +		q->mq_ops->cleanup_rq(rq);
> +
>   	if (rq->rq_flags & RQF_ELVPRIV) {
>   		if (e && e->type->ops.finish_request)
>   			e->type->ops.finish_request(rq);

I'm concerned about the performance impact of this change. How about not 
introducing .cleanup_rq() and adding a call to
scsi_mq_uninit_cmd() in scsi_queue_rq() just before that function 
returns BLK_STS_RESOURCE or BLK_STS_DEV_RESOURCE?

Thanks,

Bart.

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
