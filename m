Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id E03E6244517
	for <lists+dm-devel@lfdr.de>; Fri, 14 Aug 2020 08:54:12 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-183-TMOqQIB2O7-6iD8Uqrb38A-1; Fri, 14 Aug 2020 02:54:09 -0400
X-MC-Unique: TMOqQIB2O7-6iD8Uqrb38A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E670C1DDE4;
	Fri, 14 Aug 2020 06:54:01 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 331E26715F;
	Fri, 14 Aug 2020 06:53:57 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9C979180B655;
	Fri, 14 Aug 2020 06:53:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07E6rUVH005519 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 14 Aug 2020 02:53:30 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0F8FA2017F06; Fri, 14 Aug 2020 06:53:30 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F32342017E93
	for <dm-devel@redhat.com>; Fri, 14 Aug 2020 06:53:27 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A423680088F
	for <dm-devel@redhat.com>; Fri, 14 Aug 2020 06:53:27 +0000 (UTC)
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-156-Ze-6iZebMZGLniyhwEyItw-1; Fri, 14 Aug 2020 02:53:21 -0400
X-MC-Unique: Ze-6iZebMZGLniyhwEyItw-1
Received: by mail-wm1-f66.google.com with SMTP id f18so7773675wmc.0;
	Thu, 13 Aug 2020 23:53:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=R98QDB24e1f/EyNvzbPCtJM2RLHYWMk5nZRYsMJ6+Vw=;
	b=otc1nG2lIavW6qGcGqDXSoJgqHXvXjnxvOfsmJT42iuCGLFd3rAwpHIf9qxnt0xeqs
	WT6FA4sB8QwGSYx0Tp3JJQW0H45ow4pduDuKc7aUVpNZ/WJ83euNbSFfqIUZUiXujkTG
	fm7pwjp+qE5MrOo9aeAM5YT0wTiE5Pv5G9IGn/2tPJmBzu4KUxpb4L88p2vLIhK51dfq
	zP5VnBw+Z2QBiIcXLdMiAZM/GpWJcRTN7foG2PElYTuS6ZxLQ4SQXbM+9qVt4KVli1u0
	5oTyjQTR/jicJZUn/8UVwXkMEn5y4J50kiuRm2eXx8S2GZVbDDP149ULyG8/AgVNTMQ7
	zQHQ==
X-Gm-Message-State: AOAM532OPg9rqAfPXGtYTwHXY8oYJh/EDqpTDJyAFWnSWzGOup95UyED
	EyNlCZ/BTYUh+OIOdGzXZ56ISAJCh5oPag==
X-Google-Smtp-Source: ABdhPJyblIiEL1uyaEoCxwaA/L+BxzNnfLA00lQmpNzqeruB2N+ne1qge8Ibhvf74hOyrQiw+FIhJg==
X-Received: by 2002:a1c:540c:: with SMTP id i12mr1123763wmb.96.1597387999953; 
	Thu, 13 Aug 2020 23:53:19 -0700 (PDT)
Received: from ?IPv6:2601:647:4802:9070:51f:3472:bc7:2f4f?
	([2601:647:4802:9070:51f:3472:bc7:2f4f])
	by smtp.gmail.com with ESMTPSA id
	a10sm13359599wro.35.2020.08.13.23.53.16
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Thu, 13 Aug 2020 23:53:19 -0700 (PDT)
To: Christoph Hellwig <hch@infradead.org>, Mike Snitzer <snitzer@redhat.com>
References: <6B826235-C504-4621-B8F7-34475B200979@netapp.com>
	<20200807000755.GA28957@redhat.com>
	<510f5aff-0437-b1ce-f7ab-c812edbea880@grimberg.me>
	<20200807045015.GA29737@redhat.com>
	<fec745aa-0091-ee1f-cb0f-da9e18cf0aa2@grimberg.me>
	<20200810143620.GA19127@redhat.com> <20200810172209.GA19535@redhat.com>
	<20200813144811.GA5452@redhat.com>
	<20200813153623.GA30905@infradead.org>
	<20200813174704.GA6137@redhat.com>
	<20200813184349.GA8191@infradead.org>
From: Sagi Grimberg <sagi@grimberg.me>
Message-ID: <96aff2d0-5907-f5c9-9164-8fea0d030d95@grimberg.me>
Date: Thu, 13 Aug 2020 23:53:14 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200813184349.GA8191@infradead.org>
Content-Language: en-US
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
Cc: linux-nvme@lists.infradead.org, dm-devel@redhat.com,
	Ewan Milne <emilne@redhat.com>, Chao Leng <lengchao@huawei.com>,
	Keith Busch <kbusch@kernel.org>, "Meneghini,
	John" <John.Meneghini@netapp.com>
Subject: Re: [dm-devel] [RESEND PATCH] nvme: explicitly use normal NVMe
 error handling when appropriate
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.003
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit


> +static inline enum nvme_disposition nvme_req_disposition(struct request *req)
> +{
> +	if (likely(nvme_req(req)->status == 0))
> +		return COMPLETE;
> +
> +	if (blk_noretry_request(req) ||
> +	    (nvme_req(req)->status & NVME_SC_DNR) ||
> +	    nvme_req(req)->retries >= nvme_max_retries)
> +		return COMPLETE;
> +
> +	if (req->cmd_flags & REQ_NVME_MPATH) {
> +		switch (nvme_req(req)->status & 0x7ff) {
> +		case NVME_SC_ANA_TRANSITION:
> +		case NVME_SC_ANA_INACCESSIBLE:
> +		case NVME_SC_ANA_PERSISTENT_LOSS:
> +			return REDIRECT_ANA;
> +		case NVME_SC_HOST_PATH_ERROR:
> +		case NVME_SC_HOST_ABORTED_CMD:
> +			return REDIRECT_TMP;
> +		}
> +	}
> +
> +	if (blk_queue_dying(req->q))
> +		return COMPLETE;
> +	return RETRY;
> +}
> +
> +static inline void nvme_complete_req(struct request *req)
>   {
>   	blk_status_t status = nvme_error_status(nvme_req(req)->status);
>   
> -	trace_nvme_complete_rq(req);
> +	if (IS_ENABLED(CONFIG_BLK_DEV_ZONED) &&
> +	    req_op(req) == REQ_OP_ZONE_APPEND)
> +		req->__sector = nvme_lba_to_sect(req->q->queuedata,
> +			le64_to_cpu(nvme_req(req)->result.u64));
> +
> +	nvme_trace_bio_complete(req, status);
> +	blk_mq_end_request(req, status);
> +}
>   
> +void nvme_complete_rq(struct request *req)
> +{
> +	trace_nvme_complete_rq(req);
>   	nvme_cleanup_cmd(req);
>   
>   	if (nvme_req(req)->ctrl->kas)
>   		nvme_req(req)->ctrl->comp_seen = true;
>   
> -	if (unlikely(status != BLK_STS_OK && nvme_req_needs_retry(req))) {
> -		if ((req->cmd_flags & REQ_NVME_MPATH) && nvme_failover_req(req))
> -			return;
> -
> -		if (!blk_queue_dying(req->q)) {
> -			nvme_retry_req(req);
> -			return;
> -		}
> -	} else if (IS_ENABLED(CONFIG_BLK_DEV_ZONED) &&
> -		   req_op(req) == REQ_OP_ZONE_APPEND) {
> -		req->__sector = nvme_lba_to_sect(req->q->queuedata,
> -			le64_to_cpu(nvme_req(req)->result.u64));
> +	switch (nvme_req_disposition(req)) {
> +	case COMPLETE:
> +		nvme_complete_req(req);

nvme_complete_rq calling nvme_complete_req... Maybe call it
__nvme_complete_rq instead?

> +		return;
> +	case RETRY:
> +		nvme_retry_req(req);
> +		return;
> +	case REDIRECT_ANA:
> +		nvme_failover_req(req, true);
> +		return;
> +	case REDIRECT_TMP:
> +		nvme_failover_req(req, false);
> +		return;
>   	}
> -
> -	nvme_trace_bio_complete(req, status);
> -	blk_mq_end_request(req, status);
>   }
>   EXPORT_SYMBOL_GPL(nvme_complete_rq);
>   
> diff --git a/drivers/nvme/host/multipath.c b/drivers/nvme/host/multipath.c
> index 3ded54d2c9c6ad..0c22b2c88687a2 100644
> --- a/drivers/nvme/host/multipath.c
> +++ b/drivers/nvme/host/multipath.c
> @@ -65,51 +65,32 @@ void nvme_set_disk_name(char *disk_name, struct nvme_ns *ns,
>   	}
>   }
>   
> -bool nvme_failover_req(struct request *req)
> +void nvme_failover_req(struct request *req, bool is_ana_status)
>   {
>   	struct nvme_ns *ns = req->q->queuedata;
> -	u16 status = nvme_req(req)->status;
>   	unsigned long flags;
>   
> -	switch (status & 0x7ff) {
> -	case NVME_SC_ANA_TRANSITION:
> -	case NVME_SC_ANA_INACCESSIBLE:
> -	case NVME_SC_ANA_PERSISTENT_LOSS:
> -		/*
> -		 * If we got back an ANA error we know the controller is alive,
> -		 * but not ready to serve this namespaces.  The spec suggests
> -		 * we should update our general state here, but due to the fact
> -		 * that the admin and I/O queues are not serialized that is
> -		 * fundamentally racy.  So instead just clear the current path,
> -		 * mark the the path as pending and kick of a re-read of the ANA
> -		 * log page ASAP.
> -		 */
> -		nvme_mpath_clear_current_path(ns);
> -		if (ns->ctrl->ana_log_buf) {
> -			set_bit(NVME_NS_ANA_PENDING, &ns->flags);
> -			queue_work(nvme_wq, &ns->ctrl->ana_work);
> -		}
> -		break;
> -	case NVME_SC_HOST_PATH_ERROR:
> -	case NVME_SC_HOST_ABORTED_CMD:
> -		/*
> -		 * Temporary transport disruption in talking to the controller.
> -		 * Try to send on a new path.
> -		 */
> -		nvme_mpath_clear_current_path(ns);
> -		break;
> -	default:
> -		/* This was a non-ANA error so follow the normal error path. */
> -		return false;
> +	nvme_mpath_clear_current_path(ns);
> +
> +	/*
> +	 * If we got back an ANA error we know the controller is alive, but not
> +	 * ready to serve this namespaces.  The spec suggests we should update
> +	 * our general state here, but due to the fact that the admin and I/O
> +	 * queues are not serialized that is fundamentally racy.  So instead
> +	 * just clear the current path, mark the the path as pending and kick
> +	 * of a re-read of the ANA log page ASAP.
> +	 */
> +	if (is_ana_status && ns->ctrl->ana_log_buf) {

Maybe call nvme_req_disposition again locally here to not carry
the is_ana_status. But not a biggy..

Overall this looks good I think.

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

