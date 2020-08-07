Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 25F6923E577
	for <lists+dm-devel@lfdr.de>; Fri,  7 Aug 2020 03:22:33 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-379-EtMfMpi4P7S4KPqOZsO0uQ-1; Thu, 06 Aug 2020 21:22:30 -0400
X-MC-Unique: EtMfMpi4P7S4KPqOZsO0uQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D405480183C;
	Fri,  7 Aug 2020 01:22:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5284C6FEDC;
	Fri,  7 Aug 2020 01:22:20 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BBEB11809554;
	Fri,  7 Aug 2020 01:22:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0771LJLT030584 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 6 Aug 2020 21:21:19 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0429F2157F24; Fri,  7 Aug 2020 01:21:19 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F3C322157F23
	for <dm-devel@redhat.com>; Fri,  7 Aug 2020 01:21:16 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E520A8007A4
	for <dm-devel@redhat.com>; Fri,  7 Aug 2020 01:21:15 +0000 (UTC)
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-296-4Zsw8g_WONCTvC9AC8CwFQ-1; Thu, 06 Aug 2020 21:21:11 -0400
X-MC-Unique: 4Zsw8g_WONCTvC9AC8CwFQ-1
Received: by mail-wm1-f67.google.com with SMTP id c80so327830wme.0;
	Thu, 06 Aug 2020 18:21:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=daG516BDPGkR6eCXIiwBJwkG56zv/pww0gKw6DNtmTs=;
	b=ZbE+xzlsfxdudb4Py8cDpX/WlsljnqhxeWMUQJlwO5Mae4gESeU1AkOb7WP8fLAtkn
	ZCjyj4OKyLBNAxkhBlAxTdyEOlN7DvqihAa+b33hU0TWcl2VRW+k5Mc2HR5h/o81UBQP
	T8ogJxqdC9i9JsnTf2AsYvi00LVllcJ3WtTdJuwhQDowKaKbV5kwfqFour7nETcb9Loc
	V/m5ArkhHohYXeEmpYZVMA5GskwZVffnH6aqwSXDiSp6HFc9RwXsqkNxje5El0qvU5yY
	MpiKZ5nk4N3P6YPAkKJBLCwkUalEiYHFpfcMyi05VBh28FFg9pkCqHEcRG8Wk8gpEcQP
	kwmA==
X-Gm-Message-State: AOAM533IwOfpazpPaVcu362pgKRdKUFD+JcAWlqHfRBVtdcJDyKMpdzu
	vT3OCLqSDF6ZoxR0mtq5f4s=
X-Google-Smtp-Source: ABdhPJxUPTEW8+UUWxpbNGdzZJwSd6n3twXpuwdu/6EIkAcS/xBXWnG/8oOhDfWoXXIxIRHzdJJo9g==
X-Received: by 2002:a1c:dd06:: with SMTP id u6mr10782451wmg.39.1596763269997; 
	Thu, 06 Aug 2020 18:21:09 -0700 (PDT)
Received: from ?IPv6:2601:647:4802:9070:d88d:857c:b14c:519a?
	([2601:647:4802:9070:d88d:857c:b14c:519a])
	by smtp.gmail.com with ESMTPSA id x4sm8770226wru.81.2020.08.06.18.21.06
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Thu, 06 Aug 2020 18:21:09 -0700 (PDT)
To: Mike Snitzer <snitzer@redhat.com>,
	"Meneghini, John" <John.Meneghini@netapp.com>
References: <43e5dee8-1a91-4d8b-fdb5-91f9679ddeb3@huawei.com>
	<8d01b123-478f-f057-1598-8283dd099b03@huawei.com>
	<20200805152905.GB1982647@dhcp-10-100-145-180.wdl.wdc.com>
	<255d55e3-f824-a968-e478-3efeda095696@huawei.com>
	<20200806142625.GA3075319@dhcp-10-100-145-180.wdl.wdc.com>
	<729820BC-5F38-4E22-A83A-862E57BAE201@netapp.com>
	<E3390A8E-D582-47BA-A085-21663D883365@netapp.com>
	<20200806184057.GA27858@redhat.com> <20200806191943.GA27868@redhat.com>
	<6B826235-C504-4621-B8F7-34475B200979@netapp.com>
	<20200807000755.GA28957@redhat.com>
From: Sagi Grimberg <sagi@grimberg.me>
Message-ID: <510f5aff-0437-b1ce-f7ab-c812edbea880@grimberg.me>
Date: Thu, 6 Aug 2020 18:21:03 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200807000755.GA28957@redhat.com>
Content-Language: en-US
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
Cc: "linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
	Christoph Hellwig <hch@infradead.org>, dm-devel@redhat.com,
	Ewan Milne <emilne@redhat.com>, Chao Leng <lengchao@huawei.com>,
	Keith Busch <kbusch@kernel.org>
Subject: Re: [dm-devel] nvme: restore use of blk_path_error() in
	nvme_complete_rq()
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit

Hey Mike,

>> The point is: blk_path_error() has nothing to do with NVMe errors.
>> This is dm-multipath logic stuck in the middle of the NVMe error
>> handling code.
> 
> No, it is a means to have multiple subsystems (to this point both SCSI
> and NVMe) doing the correct thing when translating subsystem specific
> error codes to BLK_STS codes.

Not exactly, don't find any use of this in scsi. The purpose is to make
sure that nvme and dm speak the same language.

> If you, or others you name drop below, understood the point we wouldn't
> be having this conversation.  You'd accept the point of blk_path_error()
> to be valid and required codification of what constitutes a retryable
> path error for the Linux block layer.

This incident is a case where the specific nvme status was designed
to retry on the same path respecting the controller retry delay.
And because nvme used blk_path_error at the time it caused us to use a
non-retryable status to get around that. Granted, no one had 
dm-multipath in mind.

So in a sense, there is consensus on changing patch 35038bffa87da
_because_ nvme no longer uses blk_path_error. Otherwise it would break.

> Any BLK_STS mapping of NVMe specific error codes would need to not screw
> up by categorizing a retryable error as non-retryable (and vice-versa).

But it is a special type of retryable. There is nothing that fits the
semantics of the current behavior.

> Again, assuming proper testing, commit 35038bffa87 wouldn't have made it
> upstream if NVMe still used blk_path_error().

Agree.

> Yes, your commit 764e9332098c0 needlessly removed NVMe's use of
> blk_path_error().  If you're saying it wasn't needless please explain
> why.
> 
>>      Fixes: 764e9332098c0 ("nvme-multipath: do not reset on unknown status")
>>      Cc: stable@vger.kerneel.org
>>      Signed-off-by: Mike Snitzer <snitzer@redhat.com>
>>      ---
>>      drivers/nvme/host/core.c | 9 +++++++--
>>      1 file changed, 7 insertions(+), 2 deletions(-)
>>
>>      diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
>>      index 6585d57112ad..072f629da4d8 100644
>>      --- a/drivers/nvme/host/core.c
>>      +++ b/drivers/nvme/host/core.c
>>      @@ -290,8 +290,13 @@ void nvme_complete_rq(struct request *req)
>>                      nvme_req(req)->ctrl->comp_seen = true;
>>
>>              if (unlikely(status != BLK_STS_OK && nvme_req_needs_retry(req))) {
>>      -               if ((req->cmd_flags & REQ_NVME_MPATH) && nvme_failover_req(req))
>>      -                       return;
>>      +               if (blk_path_error(status)) {
>>      +                       if (req->cmd_flags & REQ_NVME_MPATH) {
>>      +                               if (nvme_failover_req(req))
>>      +                                       return;
>>      +                               /* fallthru to normal error handling */
>>      +                       }
>>      +               }
>>
>> This would basically undo the patch Hannes, Christoph, and I put together in
>> commit 764e9332098c0.  This patch greatly simplified and improved the
>> whole nvme_complete_rq() code path, and I don't support undoing that change.
> 
> Please elaborate on how I've undone anything?

I think you're right, this hasn't undone the patch from John, but it
breaks NVME_SC_CMD_INTERRUPTED error handling behavior.

> The only thing I may have done is forced NVMe to take more care about
> properly translating its NVME_SC to BLK_STS in nvme_error_status().
> Which is a good thing.

I don't think there is an issue here of mistakenly converting an nvme
status code to a wrong block status code. This conversion is there
because there is no block status that give us the semantics we need
which is apparently specific to nvme.

I personally don't mind restoring blk_path_error to nvme, I don't
particularly feel strong about it either. But for sure blk_path_error
needs to first provide the semantics needed for NVME_SC_CMD_INTERRUPTED.

...

> Anyway, no new BLK_STS is needed at this point.  More discipline with
> how NVMe's error handling is changed is.

Please read the above.

> If NVMe wants to ensure its
> interface isn't broken regularly it _should_ use blk_path_error() to
> validate future nvme_error_status() changes.  Miscategorizing NVMe
> errors to upper layers is a bug -- not open for debate.

Again, don't agree is a Miscategorization nor a bug, its just something
that is NVMe specific.

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

