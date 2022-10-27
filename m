Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F44F61308B
	for <lists+dm-devel@lfdr.de>; Mon, 31 Oct 2022 07:39:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667198359;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=rOoUSbpg/2OWFFiLoyw48OYbVs9tY+0tFXxIXEzU9jM=;
	b=Ji+fE3QFXfEkpx0d36CEBuY7x+qiSvSpgbCcY0yYiTdskPUBX1lBM1+s+OfE84BSJJ5HBG
	4z51FIGed1Pagct0tVItfdHnoYRG46YfsxJr+p0MGrtsHQwyjMO+0PdKmE9Ba2g9eL3JkL
	mm5t1ctpkJ+487HIRNAoCWvlCTutE2o=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-654-5CKUNLtNPVeqae7LqyVbYA-1; Mon, 31 Oct 2022 02:39:01 -0400
X-MC-Unique: 5CKUNLtNPVeqae7LqyVbYA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 019F6800186;
	Mon, 31 Oct 2022 06:38:58 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E1B1C111E3FF;
	Mon, 31 Oct 2022 06:38:57 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id D68BC19465A0;
	Mon, 31 Oct 2022 06:38:57 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 577711946597
 for <dm-devel@listman.corp.redhat.com>; Thu, 27 Oct 2022 15:27:58 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 2E325492B16; Thu, 27 Oct 2022 15:27:57 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 269C4492B09
 for <dm-devel@redhat.com>; Thu, 27 Oct 2022 15:27:57 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D039B29DD9B9
 for <dm-devel@redhat.com>; Thu, 27 Oct 2022 15:27:55 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-609-DQboGFftNHSlvNHtGginBA-1; Thu, 27 Oct 2022 11:27:54 -0400
X-MC-Unique: DQboGFftNHSlvNHtGginBA-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1143B62377;
 Thu, 27 Oct 2022 15:19:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 775E0C433D6;
 Thu, 27 Oct 2022 15:18:59 +0000 (UTC)
Date: Thu, 27 Oct 2022 09:18:53 -0600
From: Keith Busch <kbusch@kernel.org>
To: Mike Christie <michael.christie@oracle.com>
Message-ID: <Y1qhXQYOpEUk2uqF@kbusch-mbp.dhcp.thefacebook.com>
References: <20221026231945.6609-1-michael.christie@oracle.com>
 <20221026231945.6609-11-michael.christie@oracle.com>
MIME-Version: 1.0
In-Reply-To: <20221026231945.6609-11-michael.christie@oracle.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mailman-Approved-At: Mon, 31 Oct 2022 06:38:42 +0000
Subject: Re: [dm-devel] [PATCH v3 10/19] nvme: Move NVMe and Block PR types
 to an array
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
Cc: axboe@kernel.dk, linux-block@vger.kernel.org, chaitanyak@nvidia.com,
 bvanassche@acm.org, linux-scsi@vger.kernel.org, snitzer@kernel.org,
 linux-nvme@lists.infradead.org, james.bottomley@hansenpartnership.com,
 dm-devel@redhat.com, target-devel@vger.kernel.org, martin.petersen@oracle.com,
 hch@lst.de
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Oct 26, 2022 at 06:19:36PM -0500, Mike Christie wrote:
> For Reservation Report support we need to also convert from the NVMe spec
> PR type back to the block PR definition. This moves us to an array, so in
> the next patch we can add another helper to do the conversion without
> having to manage 2 switches.
> 
> Signed-off-by: Mike Christie <michael.christie@oracle.com>
> ---
>  drivers/nvme/host/pr.c | 42 +++++++++++++++++++++++-------------------
>  include/linux/nvme.h   |  9 +++++++++
>  2 files changed, 32 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/nvme/host/pr.c b/drivers/nvme/host/pr.c
> index df7eb2440c67..5c4611d15d9c 100644
> --- a/drivers/nvme/host/pr.c
> +++ b/drivers/nvme/host/pr.c
> @@ -6,24 +6,28 @@
>  
>  #include "nvme.h"
>  
> -static char nvme_pr_type(enum pr_type type)
> +static const struct {
> +	enum nvme_pr_type	nvme_type;
> +	enum pr_type		blk_type;
> +} nvme_pr_types[] = {
> +	{ NVME_PR_WRITE_EXCLUSIVE, PR_WRITE_EXCLUSIVE },
> +	{ NVME_PR_EXCLUSIVE_ACCESS, PR_EXCLUSIVE_ACCESS },
> +	{ NVME_PR_WRITE_EXCLUSIVE_REG_ONLY, PR_WRITE_EXCLUSIVE_REG_ONLY },
> +	{ NVME_PR_EXCLUSIVE_ACCESS_REG_ONLY, PR_EXCLUSIVE_ACCESS_REG_ONLY },
> +	{ NVME_PR_WRITE_EXCLUSIVE_ALL_REGS, PR_WRITE_EXCLUSIVE_ALL_REGS },
> +	{ NVME_PR_EXCLUSIVE_ACCESS_ALL_REGS, PR_EXCLUSIVE_ACCESS_ALL_REGS },
> +};

Wouldn't it be easier to use the block type as the array index to avoid
the whole looped lookup?

  enum nvme_pr_type types[] = {
	.PR_WRITE_EXCLUSIVE = NVME_PR_WRITE_EXCLUSIVE,
	.PR_EXCLUSIVE_ACCESS  = NVME_PR_EXCLUSIVE_ACCESS,
        ...
  };

?

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

