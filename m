Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 603A16190A5
	for <lists+dm-devel@lfdr.de>; Fri,  4 Nov 2022 07:04:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667541839;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=4tRftJ4OoHSG172buhtQkyMaFmstzLuoNQokO0tUWu0=;
	b=AFSkmz3HAqCM2QWNElZzWIYBkoP1HWJg3ICXLoe0ha3wB+92xRvj+j8kR5o0AaAWyJrn4F
	/UmL7SXJ3BDXsTodbtR1KiIf5SEGE/8cnd7aPsO3pVe6egKua59hiIR8wx2F1k8rUHp+Mg
	hVe4eKBb9ilf2fcguY4863P/pTjt1jI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-39-iHTeaHpNMWyfJzUlssQecA-1; Fri, 04 Nov 2022 02:03:55 -0400
X-MC-Unique: iHTeaHpNMWyfJzUlssQecA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1A978185A78B;
	Fri,  4 Nov 2022 06:03:53 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4DA55477F55;
	Fri,  4 Nov 2022 06:03:49 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 906371946A62;
	Fri,  4 Nov 2022 06:03:44 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 3D8031946594
 for <dm-devel@listman.corp.redhat.com>; Fri,  4 Nov 2022 06:03:43 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id DF3A91121330; Fri,  4 Nov 2022 06:03:42 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D825F1121325
 for <dm-devel@redhat.com>; Fri,  4 Nov 2022 06:03:42 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B869E299E768
 for <dm-devel@redhat.com>; Fri,  4 Nov 2022 06:03:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-626-zXwjgM88NCq5lV1TNP7k6A-1; Fri, 04 Nov 2022 02:03:41 -0400
X-MC-Unique: zXwjgM88NCq5lV1TNP7k6A-1
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1oqp2M-002Q3k-4A; Fri, 04 Nov 2022 05:14:38 +0000
Date: Thu, 3 Nov 2022 22:14:38 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Keith Busch <kbusch@meta.com>
Message-ID: <Y2Sfvk1EtG9XwxPC@infradead.org>
References: <20221103152559.1909328-1-kbusch@meta.com>
 <20221103152559.1909328-2-kbusch@meta.com>
MIME-Version: 1.0
In-Reply-To: <20221103152559.1909328-2-kbusch@meta.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Subject: Re: [dm-devel] [PATCH 1/3] block: make dma_alignment a stacking
 queue_limit
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
Cc: axboe@kernel.dk, ebiggers@kernel.org, linux-block@vger.kernel.org,
 dm-devel@redhat.com, mpatocka@redhat.com, stefanha@redhat.com,
 Keith Busch <kbusch@kernel.org>, me@demsh.org
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Nov 03, 2022 at 08:25:57AM -0700, Keith Busch wrote:
> From: Keith Busch <kbusch@kernel.org>
> 
> Device mappers had always been getting the default 511 dma mask, but
> the underlying device might have a larger alignment requirement. Since
> this value is used to determine alloweable direct-io alignment, this
> needs to be a stackable limit.

This can also remove the just added blk_queue_dma_alignment in
nvme_mpath_alloc_disk again as it is right next to the
blk_set_stacking_limits call.

Otherwise looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

