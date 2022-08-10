Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7529A58E58A
	for <lists+dm-devel@lfdr.de>; Wed, 10 Aug 2022 05:36:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1660102568;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=UcoSqAl5Eio+d9Mafjl0gHaoUihh2Z2bk1BHsfvfCG8=;
	b=bi6LhetHcN+aNGWS/+Nxpkjf5EAofj3CYNeP8JsadG5yac/Rk8y32psJG8HayG6I4pGRPm
	chHUW8vgAX1INFhvQCNbHya9jjBMqBmb3ENpLOjIs5GfANaiDXUQXI+fRNDAxUDql0UHyg
	F0yQ0vtd1SNHU1ve/L2oTI6TMukgh20=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-587-oCo27Y8YMkmhHIr6IeGajA-1; Tue, 09 Aug 2022 23:36:07 -0400
X-MC-Unique: oCo27Y8YMkmhHIr6IeGajA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 32A43180F6F4;
	Wed, 10 Aug 2022 03:36:04 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B8323140EBE3;
	Wed, 10 Aug 2022 03:36:03 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id F41001946A6A;
	Wed, 10 Aug 2022 03:36:02 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id E9CC41946A52
 for <dm-devel@listman.corp.redhat.com>; Wed, 10 Aug 2022 03:26:01 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id D57892026D07; Wed, 10 Aug 2022 03:26:01 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D18902026D4C
 for <dm-devel@redhat.com>; Wed, 10 Aug 2022 03:26:01 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B477629ABA1F
 for <dm-devel@redhat.com>; Wed, 10 Aug 2022 03:26:01 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-654-lc7qq1f4N1iFbASp6PBSbg-1; Tue, 09 Aug 2022 23:26:00 -0400
X-MC-Unique: lc7qq1f4N1iFbASp6PBSbg-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EBC8D61314;
 Wed, 10 Aug 2022 03:17:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67EA2C433C1;
 Wed, 10 Aug 2022 03:17:24 +0000 (UTC)
Date: Tue, 9 Aug 2022 21:17:21 -0600
From: Keith Busch <kbusch@kernel.org>
To: Chaitanya Kulkarni <chaitanyak@nvidia.com>
Message-ID: <YvMjQSlFKJE8Cp8w@kbusch-mbp.dhcp.thefacebook.com>
References: <20220809000419.10674-1-michael.christie@oracle.com>
 <20220809000419.10674-10-michael.christie@oracle.com>
 <12b99b10-8353-0f72-f314-c453a4fc5b6a@nvidia.com>
 <YvJ0Xh61npH+M9HP@kbusch-mbp.dhcp.thefacebook.com>
 <5f55a431-31ce-185a-6ab0-db701b878d82@oracle.com>
 <a0184a51-ef30-dc80-412e-6f754c4d9476@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <a0184a51-ef30-dc80-412e-6f754c4d9476@nvidia.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Mailman-Approved-At: Wed, 10 Aug 2022 03:36:02 +0000
Subject: Re: [dm-devel] [PATCH v2 09/20] nvme: Add helper to execute
 Reservation Report
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
Cc: "axboe@kernel.dk" <axboe@kernel.dk>,
 "james.bottomley@hansenpartnership.com"
 <james.bottomley@hansenpartnership.com>,
 "bvanassche@acm.org" <bvanassche@acm.org>,
 "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
 "snitzer@kernel.org" <snitzer@kernel.org>,
 "linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 "dm-devel@redhat.com" <dm-devel@redhat.com>,
 "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 "hch@lst.de" <hch@lst.de>, Mike Christie <michael.christie@oracle.com>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Aug 10, 2022 at 01:45:48AM +0000, Chaitanya Kulkarni wrote:
> On 8/9/22 09:21, Mike Christie wrote:
> > On 8/9/22 9:51 AM, Keith Busch wrote:
> >> On Tue, Aug 09, 2022 at 10:56:55AM +0000, Chaitanya Kulkarni wrote:
> >>> On 8/8/22 17:04, Mike Christie wrote:
> >>>> +
> >>>> +	c.common.opcode = nvme_cmd_resv_report;
> >>>> +	c.common.cdw10 = cpu_to_le32(nvme_bytes_to_numd(data_len));
> >>>> +	c.common.cdw11 = 1;
> >>>> +	*eds = true;
> >>>> +
> >>>> +retry:
> >>>> +	if (IS_ENABLED(CONFIG_NVME_MULTIPATH) &&
> >>>> +	    bdev->bd_disk->fops == &nvme_ns_head_ops)
> >>>> +		ret = nvme_send_ns_head_pr_command(bdev, &c, data, data_len);
> >>>> +	else
> >>>> +		ret = nvme_send_ns_pr_command(bdev->bd_disk->private_data, &c,
> >>>> +					      data, data_len);
> >>>> +	if (ret == NVME_SC_HOST_ID_INCONSIST && c.common.cdw11) {
> >>>> +		c.common.cdw11 = 0;
> >>>> +		*eds = false;
> >>>> +		goto retry;
> >>>
> >>> Unconditional retries without any limit can create problems,
> >>> perhaps consider adding some soft limits.
> >>
> >> It's already conditioned on cdw11, which is cleared to 0 on the 2nd try. Not
> >> that that's particularly clear. I'd suggest naming an enum value for it so the
> >> code tells us what the signficance of cdw11 is in this context (it's the
> >> Extended Data Structure control flag).
> > 
> 
> true, my concern is if controller went bad (not a common case but it is
> H/W afterall) then we should have some soft limit to avoid infinite
> retries.

cdw11 is '0' on the 2nd try, and the 'goto' is conditioned on cdw11 being
non-zero. There's no infinite retry here.

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

