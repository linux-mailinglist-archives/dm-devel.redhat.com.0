Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DAD5797CFB
	for <lists+dm-devel@lfdr.de>; Thu,  7 Sep 2023 21:49:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1694116187;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ExzGFXQxxiP3yVZLI8fhJrBhmrN/s8VMwJ6vwXBXQoQ=;
	b=f7gsP34seOfOl/NOhlIXXdcDnUuVY8O6mTST8Q8zyZ7GZ/R1+es7tYM/NMYMw5532KVri9
	roVEiNPqleEcM+csrFiq3gEsvVNSld98EadEItfpPlkVDsrIjycbVD2vMWWLSmDFFfdS8F
	Lb8/ASFc86HwX8dywMmA81zxxKV5/oA=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-633-wPqVzZ5mOkCkpaaSP7n58A-1; Thu, 07 Sep 2023 15:49:44 -0400
X-MC-Unique: wPqVzZ5mOkCkpaaSP7n58A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C321D3C0FC9F;
	Thu,  7 Sep 2023 19:49:41 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C71FC140E964;
	Thu,  7 Sep 2023 19:49:38 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id E9B9919465B3;
	Thu,  7 Sep 2023 19:49:37 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id F09A4194658C
 for <dm-devel@listman.corp.redhat.com>; Thu,  7 Sep 2023 19:49:35 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id C03367B62; Thu,  7 Sep 2023 19:49:35 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B75FB83B9A
 for <dm-devel@redhat.com>; Thu,  7 Sep 2023 19:49:35 +0000 (UTC)
Received: from us-smtp-inbound-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 974593C0FC9F
 for <dm-devel@redhat.com>; Thu,  7 Sep 2023 19:49:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-112-MvlNdc_aMMWpOic2EuJZAQ-1; Thu, 07 Sep 2023 15:49:33 -0400
X-MC-Unique: MvlNdc_aMMWpOic2EuJZAQ-1
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.96 #2 (Red
 Hat Linux)) id 1qeJtv-00CZ21-28; Thu, 07 Sep 2023 18:38:47 +0000
Date: Thu, 7 Sep 2023 11:38:47 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: Nitesh Shetty <nj.shetty@samsung.com>
Message-ID: <ZPoYtx2CfmYaG3UO@bombadil.infradead.org>
References: <20230906163844.18754-1-nj.shetty@samsung.com>
 <CGME20230906164253epcas5p32862e8384bdd566881d2c155757cb056@epcas5p3.samsung.com>
 <20230906163844.18754-2-nj.shetty@samsung.com>
MIME-Version: 1.0
In-Reply-To: <20230906163844.18754-2-nj.shetty@samsung.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Subject: Re: [dm-devel] [PATCH v15 01/12] block: Introduce queue limits and
 sysfs for copy-offload support
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
Cc: Jens Axboe <axboe@kernel.dk>, Christian Brauner <brauner@kernel.org>,
 Chaitanya Kulkarni <kch@nvidia.com>, Sagi Grimberg <sagi@grimberg.me>,
 martin.petersen@oracle.com, Jonathan Corbet <corbet@lwn.net>,
 gost.dev@samsung.com, Anuj Gupta <anuj20.g@samsung.com>,
 linux-doc@vger.kernel.org, Mike Snitzer <snitzer@kernel.org>,
 linux-kernel@vger.kernel.org, linux-nvme@lists.infradead.org,
 linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 dm-devel@redhat.com, Alexander Viro <viro@zeniv.linux.org.uk>,
 Kanchan Joshi <joshi.k@samsung.com>, Keith Busch <kbusch@kernel.org>,
 Christoph Hellwig <hch@lst.de>, Alasdair Kergon <agk@redhat.com>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kernel.org
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Sep 06, 2023 at 10:08:26PM +0530, Nitesh Shetty wrote:
> Add device limits as sysfs entries,
> 	- copy_max_bytes (RW)
> 	- copy_max_hw_bytes (RO)
> 
> Above limits help to split the copy payload in block layer.
> copy_max_bytes: maximum total length of copy in single payload.
> copy_max_hw_bytes: Reflects the device supported maximum limit.
> 
> Reviewed-by: Hannes Reinecke <hare@suse.de>
> Signed-off-by: Nitesh Shetty <nj.shetty@samsung.com>
> Signed-off-by: Kanchan Joshi <joshi.k@samsung.com>
> Signed-off-by: Anuj Gupta <anuj20.g@samsung.com>

Reviewed-by: Luis Chamberlain <mcgrof@kernel.org>

  Luis

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

