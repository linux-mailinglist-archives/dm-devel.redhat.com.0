Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 0995532038A
	for <lists+dm-devel@lfdr.de>; Sat, 20 Feb 2021 04:41:35 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-485-rFJt-M8QMvWtblh4K8kCvA-1; Fri, 19 Feb 2021 22:41:32 -0500
X-MC-Unique: rFJt-M8QMvWtblh4K8kCvA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2B93E427C3;
	Sat, 20 Feb 2021 03:41:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 180625C6AB;
	Sat, 20 Feb 2021 03:41:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8FC2918095CB;
	Sat, 20 Feb 2021 03:41:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 11K3d1K7026293 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 19 Feb 2021 22:39:02 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 1BAB72026D13; Sat, 20 Feb 2021 03:39:01 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 167A02026D46
	for <dm-devel@redhat.com>; Sat, 20 Feb 2021 03:38:58 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E1B838919B8
	for <dm-devel@redhat.com>; Sat, 20 Feb 2021 03:38:58 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-568-3WVD7mKZMLaWvYCMsOZMMA-1; Fri, 19 Feb 2021 22:38:53 -0500
X-MC-Unique: 3WVD7mKZMLaWvYCMsOZMMA-1
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
	Linux)) id 1lDJ4P-003aOy-38; Sat, 20 Feb 2021 03:36:48 +0000
Date: Sat, 20 Feb 2021 03:36:37 +0000
From: Matthew Wilcox <willy@infradead.org>
To: SelvaKumar S <selvakuma.s1@samsung.com>
Message-ID: <20210220033637.GA2858050@casper.infradead.org>
References: <20210219124517.79359-1-selvakuma.s1@samsung.com>
	<CGME20210219124608epcas5p2a673f9e00c3e7b5352f115497b0e2d98@epcas5p2.samsung.com>
	<20210219124517.79359-4-selvakuma.s1@samsung.com>
MIME-Version: 1.0
In-Reply-To: <20210219124517.79359-4-selvakuma.s1@samsung.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
Cc: axboe@kernel.dk, damien.lemoal@wdc.com, kch@kernel.org, sagi@grimberg.me,
	snitzer@redhat.com, selvajove@gmail.com,
	linux-kernel@vger.kernel.org, linux-nvme@lists.infradead.org,
	nj.shetty@samsung.com, linux-block@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, dm-devel@redhat.com,
	joshi.k@samsung.com, javier.gonz@samsung.com, kbusch@kernel.org,
	joshiiitr@gmail.com, hch@lst.de
Subject: Re: [dm-devel] [RFC PATCH v5 3/4] nvme: add simple copy support
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Feb 19, 2021 at 06:15:16PM +0530, SelvaKumar S wrote:
> +	struct nvme_copy_range *range = NULL;
[...]
> +	range = kmalloc_array(nr_range, sizeof(*range),
> +			GFP_ATOMIC | __GFP_NOWARN);
[...]
> +	req->special_vec.bv_page = virt_to_page(range);
> +	req->special_vec.bv_offset = offset_in_page(range);
> +	req->special_vec.bv_len = sizeof(*range) * nr_range;
[...]
> +struct nvme_copy_range {
> +	__le64			rsvd0;
> +	__le64			slba;
> +	__le16			nlb;
> +	__le16			rsvd18;
> +	__le32			rsvd20;
> +	__le32			eilbrt;
> +	__le16			elbat;
> +	__le16			elbatm;
> +};

so ... at 32 bytes, you can get 128 per 4kB page.  What happens if you
try to send down a command that attempts to copy 129 ranges?

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

