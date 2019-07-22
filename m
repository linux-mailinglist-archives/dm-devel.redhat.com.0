Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 85DF970408
	for <lists+dm-devel@lfdr.de>; Mon, 22 Jul 2019 17:41:14 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D2467335E7;
	Mon, 22 Jul 2019 15:41:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E9B4160BFB;
	Mon, 22 Jul 2019 15:41:07 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 13CED1800208;
	Mon, 22 Jul 2019 15:40:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6MFed7o000442 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 22 Jul 2019 11:40:39 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 43DB65C6D2; Mon, 22 Jul 2019 15:40:39 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.25])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 76FE3601B6;
	Mon, 22 Jul 2019 15:40:27 +0000 (UTC)
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B0E8881DF4;
	Mon, 22 Jul 2019 15:40:26 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id y15so17562094pfn.5;
	Mon, 22 Jul 2019 08:40:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=9VDIEaBQFbumPn4Bce8zgt7MQLL9xp5pDaU4ejJmVDg=;
	b=sGFxZGvRlSNdXzRNX8SxGGgKuvYY5gXlx0mvJWD2jf675lCIiPTxSSP9TglzjaKPML
	FIEoHjfp4uI2zRD7gF9J1QdBJIHxUJyyoc9+XSPloOotFG6I760Vrk9jUfPiqUAARw94
	HN+OtQyEijO193znryNrv5dYvJu0IroYDurK9pi5fI269fqvg5SaMMaU68rMtKM37/qF
	Slj78wqV6IRjbA7JNSpVwGztjBsfDFNMUl0aI2d9glICVyxwGS8EGYfNBDNQA5IvYoSN
	irhfp209y/vdTz6VZix1dXFIwZpsBEQzsjoW9/06NaDPX6VVGB9tpR02+uTzek34oXPl
	pJtg==
X-Gm-Message-State: APjAAAXIJfA2gINE/+rgtYUvdUY2gahobI/m7PnedHW1n1Av6d+03GNC
	GXEgmxmTobbuuLMm2r97YqE=
X-Google-Smtp-Source: APXvYqzPGeYPDGcgeAkgH93yM2lKMQlRZowrweQeb+g1Y8vjkzbLJ9ZNl2ah7SODOkL9aCxA75AdGg==
X-Received: by 2002:a17:90a:b312:: with SMTP id
	d18mr75654365pjr.35.1563810025966; 
	Mon, 22 Jul 2019 08:40:25 -0700 (PDT)
Received: from desktop-bart.svl.corp.google.com
	([2620:15c:2cd:202:4308:52a3:24b6:2c60])
	by smtp.gmail.com with ESMTPSA id
	85sm41323334pfv.130.2019.07.22.08.40.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 22 Jul 2019 08:40:24 -0700 (PDT)
To: Ming Lei <ming.lei@redhat.com>, Jens Axboe <axboe@kernel.dk>
References: <20190720030637.14447-1-ming.lei@redhat.com>
	<20190720030637.14447-3-ming.lei@redhat.com>
From: Bart Van Assche <bvanassche@acm.org>
Message-ID: <eed624d5-0585-699c-9084-9f5f0ea09e52@acm.org>
Date: Mon, 22 Jul 2019 08:40:23 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190720030637.14447-3-ming.lei@redhat.com>
Content-Language: en-US
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Mon, 22 Jul 2019 15:40:26 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.25]);
	Mon, 22 Jul 2019 15:40:26 +0000 (UTC) for IP:'209.85.210.195'
	DOMAIN:'mail-pf1-f195.google.com'
	HELO:'mail-pf1-f195.google.com' FROM:'bart.vanassche@gmail.com'
	RCPT:''
X-RedHat-Spam-Score: 0.231  (FREEMAIL_FORGED_FROMDOMAIN, FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3, RCVD_IN_MSPIKE_WL, SPF_HELO_NONE,
	SPF_PASS) 209.85.210.195 mail-pf1-f195.google.com 209.85.210.195
	mail-pf1-f195.google.com <bart.vanassche@gmail.com>
X-Scanned-By: MIMEDefang 2.83 on 10.5.110.25
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Cc: Hannes Reinecke <hare@suse.com>,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	linux-scsi@vger.kernel.org, "James E . J . Bottomley" <jejb@linux.ibm.com>,
	"Ewan D . Milne" <emilne@redhat.com>,
	linux-block@vger.kernel.org, dm-devel@redhat.com,
	Mike Snitzer <snitzer@redhat.com>, stable@vger.kernel.org,
	Christoph Hellwig <hch@lst.de>
Subject: Re: [dm-devel] [PATCH V2 2/2] scsi: implement .cleanup_rq callback
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.38]); Mon, 22 Jul 2019 15:41:12 +0000 (UTC)

On 7/19/19 8:06 PM, Ming Lei wrote:
> diff --git a/drivers/scsi/scsi_lib.c b/drivers/scsi/scsi_lib.c
> index e1da8c70a266..52537c145762 100644
> --- a/drivers/scsi/scsi_lib.c
> +++ b/drivers/scsi/scsi_lib.c
> @@ -154,12 +154,9 @@ scsi_set_blocked(struct scsi_cmnd *cmd, int reason)
>   
>   static void scsi_mq_requeue_cmd(struct scsi_cmnd *cmd)
>   {
> -	if (cmd->request->rq_flags & RQF_DONTPREP) {
> -		cmd->request->rq_flags &= ~RQF_DONTPREP;
> -		scsi_mq_uninit_cmd(cmd);
> -	} else {
> -		WARN_ON_ONCE(true);
> -	}
> +	WARN_ON_ONCE(!(cmd->request->rq_flags & RQF_DONTPREP));
> +
> +	scsi_mq_uninit_cmd(cmd);
>   	blk_mq_requeue_request(cmd->request, true);
>   }

The above changes are independent of this patch series. Have you 
considered to move these into a separate patch?

> +/*
> + * Only called when the request isn't completed by SCSI, and not freed by
> + * SCSI
> + */
> +static void scsi_cleanup_rq(struct request *rq)
> +{
> +	struct scsi_cmnd *cmd = blk_mq_rq_to_pdu(rq);
> +
> +	scsi_mq_uninit_cmd(cmd);
> +}

Is the comment above this function correct? The previous patch adds an 
unconditional call to mq_ops->cleanup_rq() in blk_mq_free_request().

Thanks,

Bart.

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
