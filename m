Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CEC373F424
	for <lists+dm-devel@lfdr.de>; Tue, 27 Jun 2023 07:59:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1687845575;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=70SdgZeZ4UAtfGaLYe/XAk951bBmMc879wcijkP47MU=;
	b=UkA+wwhvrOOJuBGlriqbwBsjlUnaubUbMsht3Rw2qaTaSXBe6vaMYqyYf22CbCR3nU8/5z
	OJwdfv/A1cre1yeV5jZtkHhieMdvo/5ncnDG1WT5E1LbX+RsSY5sqq1CPWf2Gd4TDcHPbd
	nlPNA7we4UlQ+sgZlHAGvMQu0gjfnjI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-644-V2javVPGMlaAP7lws9A9xg-1; Tue, 27 Jun 2023 01:59:33 -0400
X-MC-Unique: V2javVPGMlaAP7lws9A9xg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5F20D185A78B;
	Tue, 27 Jun 2023 05:59:31 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 08E08200B680;
	Tue, 27 Jun 2023 05:59:17 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id C4A5919465A2;
	Tue, 27 Jun 2023 05:59:01 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 0ED6F1946586
 for <dm-devel@listman.corp.redhat.com>; Tue, 27 Jun 2023 05:58:55 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id CF9692166B27; Tue, 27 Jun 2023 05:58:54 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C75A02166B26
 for <dm-devel@redhat.com>; Tue, 27 Jun 2023 05:58:54 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AF2A98B0301
 for <dm-devel@redhat.com>; Tue, 27 Jun 2023 05:58:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-583-5uNhGDiMOQ6DeTrj5QBuVA-1; Tue, 27 Jun 2023 01:58:50 -0400
X-MC-Unique: 5uNhGDiMOQ6DeTrj5QBuVA-1
Received: from hch by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1qE0gi-00Bm6i-1F; Tue, 27 Jun 2023 04:52:24 +0000
Date: Mon, 26 Jun 2023 21:52:24 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Mikulas Patocka <mpatocka@redhat.com>
Message-ID: <ZJprCPEYfqIpqClP@infradead.org>
References: <1a33ace-57f9-9ef9-b967-d6617ca33089@redhat.com>
MIME-Version: 1.0
In-Reply-To: <1a33ace-57f9-9ef9-b967-d6617ca33089@redhat.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: Re: [dm-devel] [PATCH] block: flush the disk cache on BLKFLSBUF
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
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
 dm-devel@redhat.com, Marc Smith <msmith626@gmail.com>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: infradead.org
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Jun 26, 2023 at 10:25:28PM +0200, Mikulas Patocka wrote:
> The BLKFLSBUF ioctl doesn't send the flush bio to the block device, thus
> flushed data may be lurking in the disk cache and they may not be really
> flushed to the stable storage.
> 
> This patch adds the call to blkdev_issue_flush to blkdev_flushbuf.

Umm, why?  This is an ioctl no one should be using, and we certainly
should not add new functionality to it.  Can you explain what you're
trying to do here?

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

