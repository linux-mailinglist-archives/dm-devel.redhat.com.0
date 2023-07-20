Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 887B575A73B
	for <lists+dm-devel@lfdr.de>; Thu, 20 Jul 2023 09:06:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689836792;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=CDUUgZaDCrlwwgJuD5VrunGXZfIr69py+PqSHBAG1YM=;
	b=W5OhY0s+uTZQsv9Q0EbR4NDnjimdR58LtiaIk3MF2iG3IR9TrTvGVUT2tG/4M6PlUgEj9I
	VVlnAj7UNR3155TcCq6adX9bhnCMiMEEWMo2LFw9dD56EfPcBn9UpD6ECJcz1dqynWp8vq
	oOUn6NIYlk51pU0XYIRmOmVNNk+tWkU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-451-458tLSopM2iWf42DRgJ6eA-1; Thu, 20 Jul 2023 03:06:29 -0400
X-MC-Unique: 458tLSopM2iWf42DRgJ6eA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B2ACD101A54E;
	Thu, 20 Jul 2023 07:06:26 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 84700492C13;
	Thu, 20 Jul 2023 07:06:24 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 3BECB1946A6A;
	Thu, 20 Jul 2023 07:06:24 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id BE7D41946587
 for <dm-devel@listman.corp.redhat.com>; Thu, 20 Jul 2023 07:06:22 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id A74EE40D283A; Thu, 20 Jul 2023 07:06:22 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9FA4040D2839
 for <dm-devel@redhat.com>; Thu, 20 Jul 2023 07:06:22 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8414A800C7F
 for <dm-devel@redhat.com>; Thu, 20 Jul 2023 07:06:22 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-45-2-eua6jZP3qIMPXlyL-vNQ-1; Thu, 20 Jul 2023 03:06:17 -0400
X-MC-Unique: 2-eua6jZP3qIMPXlyL-vNQ-1
Received: by verein.lst.de (Postfix, from userid 2407)
 id 5F0616732D; Thu, 20 Jul 2023 09:06:12 +0200 (CEST)
Date: Thu, 20 Jul 2023 09:06:12 +0200
From: Christoph Hellwig <hch@lst.de>
To: Nitesh Shetty <nj.shetty@samsung.com>
Message-ID: <20230720070612.GA4722@lst.de>
References: <20230627183629.26571-1-nj.shetty@samsung.com>
 <CGME20230627184000epcas5p1c7cb01eb1c70bc5a19f76ce21f2ec3f8@epcas5p1.samsung.com>
 <20230627183629.26571-2-nj.shetty@samsung.com>
MIME-Version: 1.0
In-Reply-To: <20230627183629.26571-2-nj.shetty@samsung.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Subject: Re: [dm-devel] [PATCH v13 1/9] block: Introduce queue limits for
 copy-offload support
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
Cc: linux-doc@vger.kernel.org, djwong@kernel.org,
 linux-nvme@lists.infradead.org, dm-devel@redhat.com,
 Christoph Hellwig <hch@lst.de>, Alasdair Kergon <agk@redhat.com>,
 Sagi Grimberg <sagi@grimberg.me>, linux-scsi@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, gost.dev@samsung.com,
 nitheshshetty@gmail.com, willy@infradead.org,
 Chaitanya Kulkarni <kch@nvidia.com>, Anuj Gupta <anuj20.g@samsung.com>,
 Mike Snitzer <snitzer@kernel.org>, ming.lei@redhat.com,
 linux-block@vger.kernel.org, dlemoal@kernel.org,
 Alexander Viro <viro@zeniv.linux.org.uk>, Keith Busch <kbusch@kernel.org>,
 bvanassche@acm.org, Jens Axboe <axboe@kernel.dk>,
 Christian Brauner <brauner@kernel.org>, Kanchan Joshi <joshi.k@samsung.com>,
 martin.petersen@oracle.com, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: lst.de
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Just a little heads up:  I think we need to properly solve the
hw vs user limit as the various ad-hoc mechanisms tend to be
broken and don't scale.  I plan to start looking into that the
next days.

On Wed, Jun 28, 2023 at 12:06:15AM +0530, Nitesh Shetty wrote:
> Add device limits as sysfs entries,
>         - copy_offload (RW)
>         - copy_max_bytes (RW)
>         - copy_max_bytes_hw (RO)
> 
> Above limits help to split the copy payload in block layer.
> copy_offload: used for setting copy offload(1) or emulation(0).
> copy_max_bytes: maximum total length of copy in single payload.
> copy_max_bytes_hw: Reflects the device supported maximum limit.

Why do we need the separate copy_offload boolean vs just looking
at the max_bytes value?

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

